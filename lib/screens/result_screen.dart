import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;

  const ResultScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
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
                        Navigator.pop(context);
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