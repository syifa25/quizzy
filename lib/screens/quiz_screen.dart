import 'package:flutter/material.dart';
import 'result_screen.dart';
import '../models/question.dart';
import '../models/quiz_history.dart';
import '../services/history_service.dart';

class QuizScreen extends StatefulWidget {
  final String playerName;
  final List<Question> questions;
  final String categoryName;
  final String topicName;
  final String difficulty;

  const QuizScreen({
    super.key,
    required this.playerName,
    required this.questions,
    required this.categoryName,
    required this.topicName,
    required this.difficulty,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  int score = 0;
  bool isAnswerChecked = false;

  // Menyimpan jawaban pemain untuk setiap pertanyaan.
  final List<int?> userAnswers = [];

  static const Color primaryColor = Color(0xFF7655E8);
  static const Color greenColor = Color(0xFF27AE60);
  static const Color redColor = Color(0xFFE85D75);

  void selectAnswer(int index) {
    if (isAnswerChecked) return;

    setState(() {
      selectedAnswerIndex = index;
    });
  }

  void checkAnswer() {
    if (selectedAnswerIndex == null) return;

    setState(() {
      isAnswerChecked = true;

      userAnswers.add(selectedAnswerIndex);

      if (selectedAnswerIndex ==
          widget.questions[currentQuestionIndex].correctAnswerIndex) {
        score++;
      }
    });
  }

  bool isSavingResult = false;

  Future<void> nextQuestion() async {
    if (isSavingResult) return;

    if (currentQuestionIndex < widget.questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswerIndex = null;
        isAnswerChecked = false;
      });
      return;
    }

    // Cegah penyimpanan ganda ketika tombol ditekan berulang kali.
    isSavingResult = true;

    try {
      final history = QuizHistory(
        playerName: widget.playerName,
        categoryName: widget.categoryName,
        topicName: widget.topicName,
        difficulty: widget.difficulty,
        score: score,
        totalQuestions: widget.questions.length,
        completedAt: DateTime.now(),
      );

      // Simpan hasil kuis sebelum pindah ke halaman hasil.
      await HistoryService.saveHistory(history);

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            score: score,
            totalQuestions: widget.questions.length,
            playerName: widget.playerName,
            userAnswers: List<int?>.from(userAnswers),
            questions: List<Question>.from(widget.questions),
          ),
        ),
      );
    } catch (e) {
      isSavingResult = false;

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Riwayat gagal disimpan. Coba lagi.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final backgroundColor = theme.scaffoldBackgroundColor;
    final cardColor = theme.colorScheme.surface;
    final textColor = theme.colorScheme.onSurface;
    final mutedColor = isDark ? Colors.white70 : const Color(0xFF77738A);
    final borderColor = theme.colorScheme.outlineVariant;
    final selectedColor = theme.colorScheme.primaryContainer;
    final selectedTextColor = theme.colorScheme.onPrimaryContainer;
    final explanationColor = isDark
        ? const Color(0xFF302B43)
        : const Color(0xFFF8F7FF);

    final questions = widget.questions;

    if (questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Quiz Time'),
        ),
        body: const Center(
          child: Text('Belum ada pertanyaan untuk kuis ini.'),
        ),
      );
    }

    final question = questions[currentQuestionIndex];
    final progress = (currentQuestionIndex + 1) / questions.length;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        elevation: 0,
        title: Text(
          'Quiz Time, ${widget.playerName}!',
          style: const TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'YOUR PROGRESS',
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.w800,
                          fontSize: 12,
                          letterSpacing: 1.2,
                        ),
                      ),
                      Text(
                        '${currentQuestionIndex + 1}/${questions.length}',
                        style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 10,
                      backgroundColor: isDark
                          ? const Color(0xFF39334D)
                          : const Color(0xFFE7E1FA),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        primaryColor,
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(24),
                      border: isDark
                          ? Border.all(
                              color: theme.colorScheme.outlineVariant,
                            )
                          : null,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: isDark
                                ? const Color(0xFF302B43)
                                : const Color(0xFFF0EBFF),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            '🧠 KNOWLEDGE QUIZ',
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),

                        const SizedBox(height: 24),

                        Text(
                          question.question,
                          style: TextStyle(
                            color: textColor,
                            fontSize: 23,
                            height: 1.4,
                            fontWeight: FontWeight.w900,
                          ),
                        ),

                        const SizedBox(height: 28),

                        ...List.generate(
                          question.options.length,
                          (index) {
                            final isSelected = selectedAnswerIndex == index;
                            final isCorrect =
                                index == question.correctAnswerIndex;

                            Color optionBorderColor = borderColor;
                            Color optionColor = cardColor;
                            Color optionTextColor = textColor;
                            Color letterColor = textColor;
                            IconData? trailingIcon;

                            if (isAnswerChecked && isCorrect) {
                              optionBorderColor = greenColor;
                              optionColor = isDark
                                  ? const Color(0xFF183D2A)
                                  : const Color(0xFFE9F8EF);
                              letterColor = greenColor;
                              trailingIcon = Icons.check_circle_rounded;
                            } else if (isAnswerChecked && isSelected) {
                              optionBorderColor = redColor;
                              optionColor = isDark
                                  ? const Color(0xFF45232D)
                                  : const Color(0xFFFFEDF0);
                              letterColor = redColor;
                              trailingIcon = Icons.cancel_rounded;
                            } else if (isSelected) {
                              optionBorderColor = primaryColor;
                              optionColor = selectedColor;
                              optionTextColor = selectedTextColor;
                              letterColor = selectedTextColor;
                            }

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: InkWell(
                                onTap: () => selectAnswer(index),
                                borderRadius: BorderRadius.circular(16),
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: optionColor,
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: optionBorderColor,
                                      width: isSelected ? 2 : 1.5,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 34,
                                        height: 34,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: optionBorderColor.withValues(
                                            alpha: 0.15,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Text(
                                          String.fromCharCode(65 + index),
                                          style: TextStyle(
                                            color: letterColor,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                      ),

                                      const SizedBox(width: 14),

                                      Expanded(
                                        child: Text(
                                          question.options[index],
                                          style: TextStyle(
                                            color: optionTextColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),

                                      if (trailingIcon != null)
                                        Icon(
                                          trailingIcon,
                                          color: optionBorderColor,
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),

                        if (isAnswerChecked) ...[
                          const SizedBox(height: 8),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: explanationColor,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Text(
                              question.explanation,
                              style: TextStyle(
                                color: textColor,
                                fontSize: 13,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      onPressed: isAnswerChecked
                          ? nextQuestion
                          : selectedAnswerIndex != null
                              ? checkAnswer
                              : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.white,
                        disabledBackgroundColor: isDark
                            ? const Color(0xFF39334D)
                            : const Color(0xFFD9D3EA),
                        disabledForegroundColor: isDark
                            ? Colors.white54
                            : Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        isAnswerChecked
                            ? currentQuestionIndex == questions.length - 1
                                ? 'Selesaikan Kuis'
                                : 'Pertanyaan Berikutnya'
                            : 'Periksa Jawaban',
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Center(
                    child: Text(
                      'Skor sementara: $score',
                      style: TextStyle(
                        color: mutedColor,
                        fontWeight: FontWeight.w700,
                      ),
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