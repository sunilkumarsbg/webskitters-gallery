import 'package:flutter/material.dart';
import 'package:photo/homePage.dart';
import 'package:photo/resource/color.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gallery',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ColorSelect.purpleColor),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
