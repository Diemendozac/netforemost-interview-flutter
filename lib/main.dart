import 'package:flutter/material.dart';
import 'package:interview_flutter/screens/home_screen/home_screen.dart';
import 'package:interview_flutter/theme/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.route,
      routes: {
        HomePage.route : (_) => const HomePage()
      },
    );
  }
}