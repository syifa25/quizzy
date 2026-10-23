import 'package:flutter/material.dart';
import '../data/quiz_categories.dart';
import 'difficulty_screen.dart';

class TopicScreen extends StatelessWidget {
  final QuizCategory category;
  final String playerName;

  const TopicScreen({
    super.key,
    required this.category,
    required this.playerName,
  });

  static const Color primaryColor = Color(0xFF7655E8);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final textColor = theme.colorScheme.onSurface;
    final mutedColor = isDark
        ? Colors.white70
        : const Color(0xFF77738A);
    final cardColor = theme.colorScheme.surface;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          category.title,
          style: const TextStyle(fontWeight: FontWeight.w800),
        ),
        backgroundColor: theme.scaffoldBackgroundColor,
        foregroundColor: textColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                Text(
                  'Pilih Topik, $playerName!',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Pilih topik ${category.title} yang ingin kamu kuasai.',
                  style: TextStyle(
                    fontSize: 15,
                    color: mutedColor,
                  ),
                ),
                const SizedBox(height: 24),

                ...category.topics.asMap().entries.map((entry) {
                  final index = entry.key;
                  final topic = entry.value;

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: Material(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(20),
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DifficultyScreen(
                                playerName: playerName,
                                category: category,
                                topic: topic,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: primaryColor.withValues(alpha: 0.25),
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: primaryColor.withValues(
                                    alpha: isDark ? 0.25 : 0.10,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Text(
                                  '${index + 1}',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: primaryColor,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      topic.title,
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w800,
                                        color: textColor,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      topic.description,
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: mutedColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 16,
                                color: primaryColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
