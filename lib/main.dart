import 'package:flutter/material.dart';
import 'package:ngetweet/shared/theme.dart';
import 'package:ngetweet/views/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NgeTweet',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: blueColor),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
