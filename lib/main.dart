import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_app/pages/cart.dart';
import 'package:flutter_app/pages/chatbot.dart';
import 'package:flutter_app/pages/home_page.dart';
import 'package:flutter_app/pages/homepage2.dart';
import 'package:flutter_app/pages/login_signup.dart';
import 'package:flutter_app/pages/menu.dart';
import 'package:flutter_app/pages/palette.dart';
import 'package:flutter_app/pages/sign_in.dart';
import 'package:flutter_app/pages/signup.dart';
import 'package:flutter_app/pages/welcome_screen.dart';
import 'package:flutter_app/pages/test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky); // Full screen mode
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mytek app',
      home: Scaffold(
        // body: Cart(),
        // body: Chatbot(),
        // body: HomePage(),
         //body: LoginSignup(),
        // body: Menu(),
        // body: Palette(),
        // body: SignIn(),
        // body: Signup(),
          //body: Homepage(),
         body: WelcomeScreen(),
        //body:CodeLess(),
      ),
    );
  }
}
