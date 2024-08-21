import 'package:flutter/material.dart';
import 'package:flutter_app/pages/product_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html/dom.dart' as dom;
import 'package:http/http.dart' as http;
import 'package:flutter_app/pages/menu.dart'; // Ensure this is the correct path

// Article model class
class Article {
  final String url;
  final String title;
  final String img;

  Article({
    required this.url,
    required this.title,
    required this.img,
  });
}

// Network service for fetching articles and GIF
class NetworkService {
  Future<List<Article>> fetchArticles(String query) async {
    final url = Uri.parse('https://www.mytek.tn/catalogsearch/result/?q=$query');
    final response = await http.get(url);
    dom.Document html = dom.Document.html(response.body);

    final titles = html
        .querySelectorAll('div.prdtBILDetails > div > strong')
        .map((e) => e.text.trim())
        .toList();

    final urls = html
        .querySelectorAll('div.prdtBILDetails > div > strong > a')
        .map((e) => e.attributes['href'])
        .toList();

    final images = html
        .querySelectorAll('div.prdtBILImg > a > span > span > img')
        .map((e) => e.attributes['src'])
        .toList();

    if (titles.length == urls.length && urls.length == images.length) {
      return List.generate(titles.length, (index) => Article(
        title: titles[index],
        url: 'https://www.mytek.tn${urls[index]}',
        img: images[index]!,
      ));
    } else {
      throw Exception('Data length mismatch!');
    }
  }

  Future<Map<String, String>> fetchGifAndImagesUrls() async {
    final url = Uri.parse('https://www.mytek.tn');
    final response = await http.get(url);
    dom.Document html = dom.Document.html(response.body);

    final gifUrl = html
        .querySelector('div.page-wrapper > div.widget.block.block-static-block > p > a > img')
        ?.attributes['src'];

    final first = html
        .querySelector('div.columns > div > div.row > div:nth-child(1) > a > picture > img')
        ?.attributes['src'];

    final second = html
        .querySelector('div > div:nth-child(7) > div > div > a > picture > img')
        ?.attributes['src'];

    final third = html
        .querySelector('div.row > div:nth-child(5) > a > picture > img')
        ?.attributes['src'];

    if (gifUrl != null && first != null && second != null && third != null) {
      return {
        'gif': gifUrl.trim(), // Trim the URL if necessary
        'left': first.trim(),
        'right': second.trim(),
        'third': third.trim(),
      };
    } else {
      throw Exception('GIF or image URLs not found!');
    }
  }

}

// Homepage widget
class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController _controller = TextEditingController();
  String _searchQuery = "";
  List<Article> articles = [];
  Map<String, List<Article>> _cache = {}; // Cache for search results
  bool _isLoading = false; // Track loading state
  final NetworkService _networkService = NetworkService(); // Add NetworkService instance
  String _gifUrl = ''; // Store the GIF URL
  String _leftImageUrl = ''; // Store the left image URL
  String _rightImageUrl = ''; // Store the right image URL
  String _thirdImageUrl = ''; // Store the right image URL

  @override
  void initState() {
    super.initState();
    _fetchGifAndImages(); // Fetch the GIF and image URLs initially
    getWebsiteData(''); // Initial search term
  }

  Future<void> _fetchGifAndImages() async {
    try {
      final urls = await _networkService.fetchGifAndImagesUrls();
      setState(() {
        _gifUrl = urls['gif'] ?? '';
        _leftImageUrl = urls['left'] ?? '';
        _rightImageUrl = urls['right'] ?? '';
        _thirdImageUrl = urls['third'] ?? '';
      });
    } catch (e) {
      print('Error fetching GIF and image URLs: $e');
    }
  }

  Future<void> getWebsiteData(String query) async {
    setState(() {
      _isLoading = true; // Show loading indicator
    });

    // Check cache first
    if (_cache.containsKey(query)) {
      setState(() {
        articles = _cache[query]!;
        _isLoading = false; // Hide loading indicator
      });
      return;
    }

    try {
      final fetchedArticles = await _networkService.fetchArticles(query);

      // Cache the results
      _cache[query] = fetchedArticles;

      setState(() {
        articles = fetchedArticles;
        _isLoading = false; // Hide loading indicator
      });
    } catch (e) {
      print('Error fetching data: $e');
      setState(() {
        _isLoading = false; // Hide loading indicator
      });
    }
  }

  void _onSearch() {
    final query = _controller.text;
    setState(() {
      _searchQuery = query;
    });
    getWebsiteData(query);
    print('Searching for: $_searchQuery');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.5, // Half the screen width
        child: MenuPage(), // Custom MenuPage widget
      ),
      body: Stack(
        children: [
          _buildHeaderAndSearchBar(context),
          _buildContentArea(),
        ],
      ),
    );
  }

  // Method for building the header and search bar
  Widget _buildHeaderAndSearchBar(BuildContext context) {
    return Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: Builder(
        builder: (BuildContext context) => Container(
      height: 140,
      color: Color(0xFFC70A0A),
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 8, 19, 10),
        child: Column(
          children: [
            Header(
              onMenuTap: () => Scaffold.of(context).openDrawer(), // Open drawer
            ),
            SizedBox(height: 20),
            SearchBar(
              controller: _controller,
              onSearch: _onSearch,
              query: _searchQuery,
              ),
            ],
          ),
        ),
      ),
        )
    );
  }

  // Method for building the content area with separate positioning for GIF and search results
  Widget _buildContentArea() {
    return Stack(
      children: [
        // Positioned for GIF
        if (_searchQuery.isEmpty && _gifUrl.isNotEmpty) // Show GIF only when there's no search query
          Positioned(
            top: 140, // Start below the header
            left: 0,
            right: 0,
            child: _buildGif(),
          ),
        // Positioned for search results
        Positioned(
          top: 140, // Positioned below the header
          left: 0,
          right: 0,
          bottom: 0, // Stretch to the bottom of the screen
          child: _buildSearchResults(),
        ),
      ],
    );
  }

  // Method for building the GIF and images
  Widget _buildGif() {
    return SingleChildScrollView(
      child: Column(
        children: [
          // GIF at the top
          FractionallySizedBox(
            widthFactor: 0.99, // Responsive width factor (99% of parent width)
            child: Image.network(
              _gifUrl,
              fit: BoxFit.contain, // Adjust fit as needed
            ),
          ),
          // Row for two images below the GIF
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left column image
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(8),
                  child: Image.network(
                    _leftImageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Right column image
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(8),
                  child: Image.network(
                    _rightImageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          // New row for the third image
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Third image
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(8),
                  child: Image.network(
                    _thirdImageUrl,
                    fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ],
        ),
    );
  }

  // Method for building the search results
  Widget _buildSearchResults() {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 140, // Adjust height based on header height
      child: _isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : articles.isEmpty && _searchQuery.isNotEmpty
          ? Center(child: Text('No results found'))
          : articles.isEmpty && _searchQuery.isEmpty
          ? Container() // Empty container to avoid showing results when the search query is empty
          : ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return ListTile(
            title: Text(article.title, style: TextStyle(color: Color(0xFF0a07b8))),
            leading: Image.network(article.img, fit: BoxFit.fitHeight, width: 50),
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                isDismissible: true, // Allows dismissal by tapping outside
                backgroundColor: Colors.transparent, // Makes the background transparent
                builder: (BuildContext context) {
                  return ProductPage(
                    imageUrl: article.img,
                    productName: article.title,
                    price: 'Insert price here', // Update with actual price
                    description: 'Insert description here', // Update with actual description
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

// Header widget
class Header extends StatelessWidget {
  final VoidCallback onMenuTap;

  Header({required this.onMenuTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LogoSection(onMenuTap: onMenuTap), // Pass the function to LogoSection
        IconSection(),
      ],
    );
  }
}

// Logo section widget
class LogoSection extends StatelessWidget {
  final VoidCallback onMenuTap;

  LogoSection({required this.onMenuTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onMenuTap, // Trigger the menu overlay
            child: Container(
              margin: EdgeInsets.only(right: 25),
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage('assets/images/menu.png'),
                ),
              ),
            ),
          ),
          Container(
            width: 90,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFFFFFFF)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/image_1.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Icon section widget
class IconSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.05,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconContainer(imagePath: 'assets/images/phone1.png'),
          IconContainer(imagePath: 'assets/images/shopping_cart1.png'),
          IconContainer(imagePath: 'assets/images/location1.png'),
          IconContainer(imagePath: 'assets/images/male_user1.png'),
        ],
      ),
    );
  }
}

// Icon container widget
class IconContainer extends StatelessWidget {
  final String imagePath;

  IconContainer({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 26,
      height: 26,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage(imagePath),
        ),
      ),
    );
  }
}

// Search bar widget
class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSearch;
  final String query;

  SearchBar({
    required this.controller,
    required this.onSearch,
    required this.query,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: EdgeInsets.fromLTRB(11, 4, 10, 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 15,
                  color: Color(0xff505050),
                ),
              ),
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                hintText: 'Rechercher...',
                hintStyle: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 15,
                    color: Color(0xff505050),
                  ),
                ),
              ),
              controller: controller,
              onSubmitted: (value) => onSearch(),
            ),
          ),
          GestureDetector(
            onTap: onSearch,
            child: Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage('assets/images/search1.png'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
