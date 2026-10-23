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
  static const Color darkColor = Color(0xFF292344);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pilih Kategori',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        backgroundColor: const Color(0xFFF8F7FF),
        foregroundColor: darkColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                const Text(
                  'Mau belajar apa hari ini?',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: darkColor,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Pilih kategori yang ingin kamu pelajari.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 24),

                ...quizCategories.map((category) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
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
                              color: primaryColor.withValues(alpha: 0.12),
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 58,
                                height: 58,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: primaryColor.withValues(alpha: 0.10),
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
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800,
                                        color: darkColor,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      category.description,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
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