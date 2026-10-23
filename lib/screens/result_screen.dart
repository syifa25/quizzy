import 'package:flutter/material.dart';
import '../models/question.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final String playerName;
  final List<int?> userAnswers;
  final List<Question> questions;

  const ResultScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.playerName,
    required this.userAnswers,
    required this.questions,
  });

  static const Color primaryColor = Color(0xFF7655E8);
  static const Color greenColor = Color(0xFF27AE60);
  static const Color redColor = Color(0xFFE85D75);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final backgroundColor = theme.scaffoldBackgroundColor;
    final cardColor = theme.colorScheme.surface;
    final textColor = theme.colorScheme.onSurface;
    final mutedColor =
        isDark ? Colors.white70 : const Color(0xFF77738A);

    final explanationColor =
        isDark ? const Color(0xFF302B43) : const Color(0xFFF8F7FF);

    final int wrongAnswers = totalQuestions - score;

    final int finalScore = totalQuestions == 0
        ? 0
        : (score / totalQuestions * 100).round();

    String resultMessage;
    String resultDescription;
    IconData resultIcon;

    if (finalScore >= 80) {
      resultMessage = 'Amazing Job!';
      resultDescription =
          'Keren banget! Kamu menguasai materi kuis ini.';
      resultIcon = Icons.emoji_events_rounded;
    } else if (finalScore >= 60) {
      resultMessage = 'Good Work!';
      resultDescription =
          'Bagus! Terus belajar untuk mendapatkan hasil lebih tinggi.';
      resultIcon = Icons.workspace_premium_rounded;
    } else {
      resultMessage = 'Keep Learning!';
      resultDescription =
          'Jangan menyerah. Coba lagi dan tingkatkan skormu!';
      resultIcon = Icons.auto_awesome_rounded;
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        elevation: 0,
        title: const Text(
          'Hasil Kuis',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const SizedBox(height: 12),

                  const Text(
                    'QUIZ COMPLETED',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 12,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w900,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    'Hebat, $playerName! 🎉',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  const SizedBox(height: 28),

                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: isDark
                          ? const Color(0xFF302B43)
                          : const Color(0xFFECE6FF),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Icon(
                      resultIcon,
                      color: isDark
                          ? const Color(0xFFB6A3FF)
                          : primaryColor,
                      size: 68,
                    ),
                  ),

                  const SizedBox(height: 24),

                  Text(
                    resultMessage,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    resultDescription,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: mutedColor,
                      fontSize: 15,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 32),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'YOUR FINAL SCORE',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.w800,
                          ),
                        ),

                        const SizedBox(height: 16),

                        Text(
                          '$finalScore',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 68,
                            height: 1,
                            fontWeight: FontWeight.w900,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          '$score dari $totalQuestions jawaban benar',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        const SizedBox(height: 24),

                        Row(
                          children: [
                            Expanded(
                              child: _ScoreItem(
                                icon: Icons.check_circle_rounded,
                                label: 'Benar',
                                value: '$score',
                                color: const Color(0xFF9CF0BB),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _ScoreItem(
                                icon: Icons.cancel_rounded,
                                label: 'Salah',
                                value: '$wrongAnswers',
                                color: const Color(0xFFFFB8C3),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 28),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Review Jawaban 📝',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Yuk, pelajari kembali jawabanmu!',
                      style: TextStyle(
                        color: mutedColor,
                        fontSize: 14,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  ...List.generate(
                    questions.length,
                    (index) {
                      final question = questions[index];

                      final int? selectedIndex =
                          index < userAnswers.length
                              ? userAnswers[index]
                              : null;

                      final bool hasAnswered = selectedIndex != null &&
                          selectedIndex >= 0 &&
                          selectedIndex < question.options.length;

                      final bool isCorrect = hasAnswered &&
                          selectedIndex == question.correctAnswerIndex;

                      final Color statusColor =
                          isCorrect ? greenColor : redColor;

                      final String selectedAnswer = hasAnswered
                          ? question.options[selectedIndex]
                          : 'Tidak dijawab';

                      final String correctAnswer =
                          question.options[question.correctAnswerIndex];

                      return Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 16),
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: cardColor,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: statusColor.withValues(alpha: 0.4),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Pertanyaan ${index + 1}',
                                    style: TextStyle(
                                      color: textColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: statusColor.withValues(
                                      alpha: 0.12,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    isCorrect ? 'BENAR' : 'SALAH',
                                    style: TextStyle(
                                      color: statusColor,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 12),

                            Text(
                              question.question,
                              style: TextStyle(
                                color: textColor,
                                fontSize: 16,
                                height: 1.4,
                                fontWeight: FontWeight.w800,
                              ),
                            ),

                            const SizedBox(height: 16),

                            Text(
                              'Jawaban kamu:',
                              style: TextStyle(
                                color: mutedColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),

                            const SizedBox(height: 5),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  isCorrect
                                      ? Icons.check_circle_rounded
                                      : Icons.cancel_rounded,
                                  color: statusColor,
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    selectedAnswer,
                                    style: TextStyle(
                                      color: textColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            if (!isCorrect) ...[
                              const SizedBox(height: 12),

                              Text(
                                'Jawaban yang benar:',
                                style: TextStyle(
                                  color: mutedColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),

                              const SizedBox(height: 5),

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.check_circle_rounded,
                                    color: greenColor,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      correctAnswer,
                                      style: const TextStyle(
                                        color: greenColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],

                            const SizedBox(height: 16),

                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: explanationColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    '💡 Penjelasan',
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    question.explanation,
                                    style: TextStyle(
                                      color: textColor,
                                      fontSize: 13,
                                      height: 1.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 16),

                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/',
                          (route) => false,
                        );
                      },
                      icon: const Icon(Icons.home_rounded),
                      label: const Text('Kembali ke Home'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/',
                          (route) => false,
                        );
                      },
                      icon: const Icon(Icons.refresh_rounded),
                      label: const Text('Main Lagi'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: isDark
                            ? const Color(0xFFB6A3FF)
                            : primaryColor,
                        side: BorderSide(
                          color: isDark
                              ? const Color(0xFFB6A3FF)
                              : primaryColor,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  Text(
                    'Thanks for playing with Quizzy! 💜',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: mutedColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ScoreItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _ScoreItem({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 26),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}