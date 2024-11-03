import 'package:flutter/material.dart';
import 'package:news_app/main.dart'; // Import your HomeScreen

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _startSplashScreen();
  }

  // Function to navigate to HomeScreen after a delay
  void _startSplashScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const AfterSplashScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network('https://hotpot.ai/designs/thumbnails/splash-screen/9.jpg')
      ),
    );
  }
}
