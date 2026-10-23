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
    required this.questions
  });

  static const Color primaryColor = Color(0xFF7655E8);
  static const Color darkColor = Color(0xFF292344);
  static const Color backgroundColor = Color(0xFFF8F7FF);

  @override
  Widget build(BuildContext context) {
    final int wrongAnswers = totalQuestions - score;
    final int finalScore = totalQuestions == 0
        ? 0
        : (score / totalQuestions * 100).round();

    String resultMessage;
    String resultDescription;
    IconData resultIcon;

    if (finalScore >= 80) {
      resultMessage = 'Amazing Job!';
      resultDescription = 'Keren banget! Kamu menguasai materi kuis ini.';
      resultIcon = Icons.emoji_events_rounded;
    } else if (finalScore >= 60) {
      resultMessage = 'Good Work!';
      resultDescription = 'Bagus! Terus belajar untuk mendapatkan hasil lebih tinggi.';
      resultIcon = Icons.workspace_premium_rounded;
    } else {
      resultMessage = 'Keep Learning!';
      resultDescription = 'Jangan menyerah. Coba lagi dan tingkatkan skormu!';
      resultIcon = Icons.auto_awesome_rounded;
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const SizedBox(height: 20),

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
                    style: const TextStyle(
                      color: darkColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  const SizedBox(height: 28),


                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: const Color(0xFFECE6FF),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Icon(
                      resultIcon,
                      color: primaryColor,
                      size: 68,
                    ),
                  ),

                  const SizedBox(height: 24),

                  Text(
                    resultMessage,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: darkColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    resultDescription,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF77738A),
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
                  // REVIEW JAWABAN
                  const SizedBox(height: 12),

                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Review Jawaban 📝',
                      style: TextStyle(
                        color: darkColor,
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Yuk, pelajari kembali jawabanmu!',
                      style: TextStyle(
                        color: Color(0xFF77738A),
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
                          index < userAnswers.length ? userAnswers[index] : null;

                      final bool isCorrect =
                          selectedIndex == question.correctAnswerIndex;

                      final Color statusColor = isCorrect
                          ? const Color(0xFF27AE60)
                          : const Color(0xFFE85D75);

                      final String selectedAnswer = selectedIndex != null &&
                              selectedIndex >= 0 &&
                              selectedIndex < question.options.length
                          ? question.options[selectedIndex]
                          : 'Tidak dijawab';

                      final String correctAnswer =
                          question.options[question.correctAnswerIndex];

                      return Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 16),
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: statusColor.withValues(alpha: 0.4),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Nomor soal dan status
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Pertanyaan ${index + 1}',
                                    style: const TextStyle(
                                      color: darkColor,
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
                                    color: statusColor.withValues(alpha: 0.12),
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

                            // Pertanyaan
                            Text(
                              question.question,
                              style: const TextStyle(
                                color: darkColor,
                                fontSize: 16,
                                height: 1.4,
                                fontWeight: FontWeight.w800,
                              ),
                            ),

                            const SizedBox(height: 16),

                            // Jawaban pemain
                            const Text(
                              'Jawaban kamu:',
                              style: TextStyle(
                                color: Color(0xFF77738A),
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),

                            const SizedBox(height: 5),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  selectedIndex != null && isCorrect
                                      ? Icons.check_circle_rounded
                                      : Icons.cancel_rounded,
                                  color: selectedIndex != null && isCorrect
                                      ? const Color(0xFF27AE60)
                                      : const Color(0xFFE85D75),
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    selectedAnswer,
                                    style: const TextStyle(
                                      color: darkColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            // Tampilkan jawaban benar jika pemain salah.
                            if (!isCorrect) ...[
                              const SizedBox(height: 12),

                              const Text(
                                'Jawaban yang benar:',
                                style: TextStyle(
                                  color: Color(0xFF77738A),
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
                                    color: Color(0xFF27AE60),
                                    size: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      correctAnswer,
                                      style: const TextStyle(
                                        color: Color(0xFF27AE60),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],

                            const SizedBox(height: 16),

                            // Penjelasan jawaban
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF8F7FF),
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
                                    style: const TextStyle(
                                      color: darkColor,
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
                  const SizedBox(height: 28),

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
                      label: const Text('Lihat Hasil Lagi'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: primaryColor,
                        side: const BorderSide(color: primaryColor),
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

                  const Text(
                    'Thanks for playing with Quizzy! 💜',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF9691A9),
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