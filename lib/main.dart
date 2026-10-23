import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const QuizzyApp());
}

class QuizzyApp extends StatelessWidget {
  const QuizzyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizzy',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Nunito',
        scaffoldBackgroundColor: const Color(0xFFF8F7FF),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7655E8),
          primary: const Color(0xFF7655E8),
          secondary: const Color(0xFFFFC857),
          surface: Colors.white,
        ),
      ),

      routes: {
        '/': (context) => const HomeScreen(),
      },

      
    );
  }
}