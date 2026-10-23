import 'package:flutter/material.dart';
import '../data/questions_data.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  int score = 0;
  bool isAnswerChecked = false;

  static const Color primaryColor = Color(0xFF7655E8);
  static const Color darkColor = Color(0xFF292344);
  static const Color backgroundColor = Color(0xFFF8F7FF);
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

      if (selectedAnswerIndex ==
          quizQuestions[currentQuestionIndex].correctAnswerIndex) {
        score++;
      }
    });
  }

  void nextQuestion() {
    if (!isAnswerChecked) return;

    if (currentQuestionIndex < quizQuestions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswerIndex = null;
        isAnswerChecked = false;
      });
    } else {
      // Halaman hasil akan kita hubungkan pada tahap berikutnya.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Kuis selesai! Skor kamu: $score/${quizQuestions.length}'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = quizQuestions[currentQuestionIndex];
    final progress = (currentQuestionIndex + 1) / quizQuestions.length;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text(
          'Quiz Time!',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.pop(context),
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
                        '${currentQuestionIndex + 1}/${quizQuestions.length}',
                        style: const TextStyle(
                          color: darkColor,
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
                      backgroundColor: const Color(0xFFE7E1FA),
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
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
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
                            color: const Color(0xFFF0EBFF),
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
                          style: const TextStyle(
                            color: darkColor,
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

                            Color borderColor = const Color(0xFFE9E6F2);
                            Color optionColor = Colors.white;
                            Color textColor = darkColor;
                            IconData? trailingIcon;

                            if (isAnswerChecked && isCorrect) {
                              borderColor = greenColor;
                              optionColor = const Color(0xFFE9F8EF);
                              trailingIcon = Icons.check_circle_rounded;
                            } else if (isAnswerChecked && isSelected) {
                              borderColor = redColor;
                              optionColor = const Color(0xFFFFEDF0);
                              trailingIcon = Icons.cancel_rounded;
                            } else if (isSelected) {
                              borderColor = primaryColor;
                              optionColor = const Color(0xFFF0EBFF);
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
                                      color: borderColor,
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 34,
                                        height: 34,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: borderColor.withValues(
                                            alpha: 0.15,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Text(
                                          String.fromCharCode(65 + index),
                                          style: TextStyle(
                                            color: isSelected ||
                                                    (isAnswerChecked &&
                                                        isCorrect)
                                                ? borderColor
                                                : textColor,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                      ),

                                      const SizedBox(width: 14),

                                      Expanded(
                                        child: Text(
                                          question.options[index],
                                          style: TextStyle(
                                            color: textColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),

                                      if (trailingIcon != null)
                                        Icon(
                                          trailingIcon,
                                          color: borderColor,
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
                              color: const Color(0xFFF8F7FF),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Text(
                              question.explanation,
                              style: const TextStyle(
                                color: darkColor,
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
                        disabledBackgroundColor: const Color(0xFFD9D3EA),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        isAnswerChecked
                            ? currentQuestionIndex == quizQuestions.length - 1
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
                      style: const TextStyle(
                        color: Color(0xFF77738A),
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