import 'package:flutter/material.dart';
import '../data/quiz_categories.dart';
import 'topic_screen.dart';

class CategoryScreen extends StatelessWidget {
  final String playerName;

  const CategoryScreen({
    super.key,
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
        title: const Text(
          'Pilih Kategori',
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
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                Text(
                  'Mau belajar apa hari ini?',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Pilih kategori yang ingin kamu pelajari.',
                  style: TextStyle(
                    fontSize: 15,
                    color: mutedColor,
                  ),
                ),
                const SizedBox(height: 24),

                ...quizCategories.map((category) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Material(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(22),
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(22),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TopicScreen(
                                category: category,
                                playerName: playerName,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            border: Border.all(
                              color: primaryColor.withValues(alpha: 0.25),
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 58,
                                height: 58,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: primaryColor.withValues(
                                    alpha: isDark ? 0.25 : 0.10,
                                  ),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: Text(
                                  category.icon,
                                  style: const TextStyle(fontSize: 29),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      category.title,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800,
                                        color: textColor,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      category.description,
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: mutedColor,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    const Text(
                                      ' ',
                                      style: TextStyle(fontSize: 0),
                                    ),
                                    Text(
                                      '${category.topics.length} topik tersedia',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: primaryColor,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 17,
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
