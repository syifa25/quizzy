import 'package:flutter/material.dart';
import '../data/quiz_categories.dart';
import '../data/question_bank.dart';
import 'quiz_screen.dart';

class DifficultyScreen extends StatelessWidget {
  final String playerName;
  final QuizCategory category;
  final QuizTopic topic;

  const DifficultyScreen({
    super.key,
    required this.playerName,
    required this.category,
    required this.topic,
  });

  static const Color primaryColor = Color(0xFF7655E8);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.colorScheme.onSurface;
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text(
          'Tingkat Kesulitan',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        backgroundColor: theme.scaffoldBackgroundColor,
        foregroundColor: textColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),

                  Text(
                    'Siap menantang diri?',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      color: textColor,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    '${category.title} • ${topic.title}',
                    style: TextStyle(
                      fontSize: 15,
                      color: isDark
                          ? Colors.white70
                          : const Color(0xFF77738A),
                    ),
                  ),

                  const SizedBox(height: 16),

                  _DifficultyCard(
                    title: 'Mudah',
                    description: 'Cocok untuk pemanasan dan belajar dasar.',
                    icon: Icons.sentiment_satisfied_alt_rounded,
                    color: const Color(0xFF27AE60),
                    onTap: () {
                      _startQuiz(context, QuizDifficulty.easy);
                    },
                  ),

                  const SizedBox(height: 16),

                  _DifficultyCard(
                    title: 'Sedang',
                    description: 'Uji pemahamanmu lebih dalam.',
                    icon: Icons.psychology_alt_rounded,
                    color: const Color(0xFFF0A52B),
                    onTap: () {
                      _startQuiz(context, QuizDifficulty.medium);
                    },
                  ),

                  const SizedBox(height: 16),

                  _DifficultyCard(
                    title: 'Sulit',
                    description:
                        'Tantang kemampuanmu dengan soal lebih kompleks.',
                    icon: Icons.local_fire_department_rounded,
                    color: const Color(0xFFE85D75),
                    onTap: () {
                      _startQuiz(context, QuizDifficulty.hard);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _startQuiz(BuildContext context, QuizDifficulty difficulty) {
    final questions = questionBank[topic.title]?[difficulty];

    if (questions == null || questions.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Soal untuk pilihan ini belum tersedia.'),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuizScreen(
          playerName: playerName,
          questions: questions,
          categoryName: category.title,
          topicName: topic.title,
          difficulty: _difficultyLabel(difficulty),
        ),
      ),
    );
  }

  String _difficultyLabel(QuizDifficulty difficulty) {
    switch (difficulty) {
      case QuizDifficulty.easy:
        return 'Mudah';
      case QuizDifficulty.medium:
        return 'Sedang';
      case QuizDifficulty.hard:
        return 'Sulit';
    }
  }
}

class _DifficultyCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _DifficultyCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final textColor = theme.colorScheme.onSurface;
    final mutedColor = isDark
        ? Colors.white70
        : const Color(0xFF77738A);

    return Material(
      color: theme.colorScheme.surface,
      borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: color.withValues(alpha: 0.35),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: isDark ? 0.22 : 0.12),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 29,
                ),
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: color,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 13,
                        color: mutedColor,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 8),

              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                color: textColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
