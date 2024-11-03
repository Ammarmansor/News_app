import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Screens/Home.dart';
import 'package:news_app/Screens/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen()
    );
  }
}

class AfterSplashScreen extends StatelessWidget {
  const AfterSplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('News'),
            Text('Cloud',
            style: TextStyle(
              color: Colors.yellow
            ),)
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: HomeScreen(),
      )
    );
  }
}