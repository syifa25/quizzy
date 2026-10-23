enum QuizDifficulty {
  easy,
  medium,
  hard,
}
class QuizCategory {
  final String title;
  final String description;
  final String icon;
  final List<QuizTopic> topics;

  const QuizCategory({
    required this.title,
    required this.description,
    required this.icon,
    required this.topics,
  });
}

class QuizTopic {
  final String title;
  final String description;

  const QuizTopic({
    required this.title,
    required this.description,
  });
}

const List<QuizCategory> quizCategories = [
  QuizCategory(
    title: 'Matematika',
    description: 'Angka, logika, dan pemecahan masalah',
    icon: '🔢',
    topics: [
      QuizTopic(
        title: 'Matematika Dasar',
        description: 'Operasi hitung dan bilangan',
      ),
      QuizTopic(
        title: 'Aljabar',
        description: 'Variabel dan persamaan',
      ),
      QuizTopic(
        title: 'Geometri',
        description: 'Bangun datar dan ruang',
      ),
    ],
  ),
  QuizCategory(
    title: 'Biologi',
    description: 'Pelajari kehidupan dan makhluk hidup',
    icon: '🧬',
    topics: [
      QuizTopic(
        title: 'Sel dan Jaringan',
        description: 'Struktur dasar makhluk hidup',
      ),
      QuizTopic(
        title: 'Genetika',
        description: 'Gen, DNA, dan pewarisan sifat',
      ),
      QuizTopic(
        title: 'Ekologi',
        description: 'Hubungan makhluk hidup dan lingkungan',
      ),
    ],
  ),
  QuizCategory(
    title: 'Programming',
    description: 'Asah kemampuan coding kamu',
    icon: '💻',
    topics: [
      QuizTopic(
        title: 'Dasar Pemrograman',
        description: 'Variabel, tipe data, dan logika',
      ),
      QuizTopic(
        title: 'Dart',
        description: 'Bahasa pemrograman untuk Flutter',
      ),
      QuizTopic(
        title: 'Python',
        description: 'Belajar dasar bahasa Python',
      ),
    ],
  ),
];