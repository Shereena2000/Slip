import 'package:flutter/material.dart';
import 'package:slip/constants/colors.dart';
import 'package:slip/views/login_view/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slip',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      textTheme: const TextTheme(
      titleLarge: TextStyle( // AppBar Title (Sales)
        fontSize: 20,
        fontWeight: FontWeight.w900,
        color: Colors.grey,
      ),
     
    ),
       
      ),
      home: const LoginView()
    );
  }
}

