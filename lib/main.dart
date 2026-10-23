import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'theme_controller.dart';

void main() {
  runApp(const QuizzyApp());
}

class QuizzyApp extends StatelessWidget {
  const QuizzyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, currentTheme, child) {
        return MaterialApp(
          title: 'Quizzy',
          debugShowCheckedModeBanner: false,

          themeMode: currentTheme,

          // LIGHT MODE
          theme: ThemeData(
            useMaterial3: true,
            fontFamily: 'Nunito',
            scaffoldBackgroundColor: const Color(0xFFF8F7FF),
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF7655E8),
              brightness: Brightness.light,
              primary: const Color(0xFF7655E8),
              secondary: const Color(0xFFFFC857),
              surface: Colors.white,
            ),
          ),

          // DARK MODE
          darkTheme: ThemeData(
            useMaterial3: true,
            fontFamily: 'Nunito',
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF7655E8),
              brightness: Brightness.dark,
              primary: const Color(0xFFB6A3FF),
              secondary: const Color(0xFFFFC857),
              surface: const Color(0xFF242424),
            ),
            scaffoldBackgroundColor: const Color(0xFF121212),
          ),

          routes: {
            '/': (context) => const HomeScreen(),
          },
        );
      },
    );
  }
}
