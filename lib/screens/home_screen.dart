import 'package:flutter/material.dart';
import 'name_screen.dart';
import '../theme_controller.dart';
import 'history_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const Color primaryColor = Color(0xFF7655E8);
  static const Color darkColor = Color(0xFF292344);
  static const Color backgroundColor = Color(0xFFF8F7FF);
  static const Color yellowColor = Color(0xFFFFC857);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : darkColor;
    final mutedColor = isDark
        ? Colors.white70
        : const Color(0xFF77738A);
    final cardColor = isDark
        ? const Color(0xFF242424)
        : Colors.white;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(
                          Icons.psychology_alt_rounded,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 12),

                      Text(
                        'Quizzy',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: textColor,
                        ),
                      ),

                      const Spacer(),

                      // Theme toggle
                      Container(
                        decoration: BoxDecoration(
                          color: cardColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: IconButton(
                          tooltip: isDark
                              ? 'Aktifkan Light Mode'
                              : 'Aktifkan Dark Mode',
                          onPressed: () {
                            themeNotifier.value = isDark
                                ? ThemeMode.light
                                : ThemeMode.dark;
                          },
                          icon: Icon(
                            isDark
                                ? Icons.light_mode_rounded
                                : Icons.dark_mode_rounded,
                            color: isDark
                                ? yellowColor
                                : primaryColor,
                          ),
                        ),
                      ),

                      const SizedBox(width: 8),

                      // Badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: cardColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.bolt_rounded,
                              color: yellowColor,
                              size: 20,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "Let's Play!",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: textColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 36),

                  // Greeting
                  const Text(
                    'HELLO, SMART PEOPLE! 👋',
                    style: TextStyle(
                      fontSize: 12,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w800,
                      color: primaryColor,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Main heading
                  Text(
                    'Test Your Knowledge!',
                    style: TextStyle(
                      fontSize: 38,
                      height: 1.15,
                      fontWeight: FontWeight.w900,
                      color: textColor,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    'Siap menguji pengetahuanmu? Yuk, jawab '
                    'pertanyaan seru dan buktikan kemampuanmu!',
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.6,
                      color: mutedColor,
                    ),
                  ),

                  const SizedBox(height: 28),

                  // Main card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 7,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.18),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            '✨ QUICK QUIZ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1,
                            ),
                          ),
                        ),

                        const SizedBox(height: 18),

                        const Text(
                          'Ready to Challenge Yourself?',
                          style: TextStyle(
                            fontSize: 25,
                            height: 1.25,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(height: 12),

                        Text(
                          'Asah kemampuanmu lewat kuis '
                          'pengetahuan dengan berbagai topik menarik.',
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.5,
                            color: Colors.white.withValues(alpha: 0.9),
                          ),
                        ),

                        const SizedBox(height: 24),

                        Wrap(
                          spacing: 20,
                          runSpacing: 12,
                          children: const [
                            _InfoItem(
                              icon: Icons.quiz_rounded,
                              title: 'Multiple Questions',
                            ),
                            _InfoItem(
                              icon: Icons.category_rounded,
                              title: '3 Categories',
                            ),
                          ],
                        ),

                        const SizedBox(height: 28),

                                                
                        SizedBox(
                          width: double.infinity,
                          height: 54,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const NameScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: yellowColor,
                              foregroundColor: darkColor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Mulai Kuis',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Icon(Icons.arrow_forward_rounded),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: OutlinedButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HistoryScreen(),
                                ),
                              );
                            },
                            icon: const Icon(Icons.history_rounded),
                            label: const Text('Riwayat Permainan'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.white,
                              side: const BorderSide(color: Colors.white70),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Footer
                  Center(
                    child: Text(
                      'Learn something new, one quiz at a time 💜',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: mutedColor.withValues(alpha: 0.85),
                        fontWeight: FontWeight.w600,
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

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const _InfoItem({
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: const Color(0xFFFFC857),
          size: 20,
        ),
        const SizedBox(width: 7),
        Flexible(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
