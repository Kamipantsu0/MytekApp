import 'package:flutter/material.dart';
import 'package:html/dom.dart' as dom;
import 'package:http/http.dart' as http;

class CodeLess extends StatefulWidget {
  const CodeLess({Key? key}) : super(key: key);

  @override
  State<CodeLess> createState() => _CodeLessState();
}

class _CodeLessState extends State<CodeLess> {
  List<Article> articles = [];

  @override
  void initState() {
    super.initState();
    getWebsiteData();
  }

  Future getWebsiteData() async {
    final url = Uri.parse('https://www.mytek.tn/catalogsearch/result/?q=redragon');
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

    print('Titles count: ${titles.length}');
    print('URLs count: ${urls.length}');
    print('Images count: ${images.length}');

    if (titles.length == urls.length && urls.length == images.length) {
      setState(() {
        articles = List.generate(titles.length, (index) => Article(
          title: titles[index],
          url: 'https://www.mytek.tn${urls[index]}',
          img: images[index]!,
        ));
      });
    } else {
      // Handle the case where lengths don't match
      print('Data length mismatch!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => const Divider(thickness: 1),
              padding: const EdgeInsets.all(10),
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return ListTile(
                  title: Text(article.title),
                  subtitle: Text(article.url, maxLines: 1, overflow: TextOverflow.ellipsis),
                  leading: Image.network(article.img, fit: BoxFit.fitHeight, width: 50),
                );
              }
          ),
        ),
      ),
    );
  }
}

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
