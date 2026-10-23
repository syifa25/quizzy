class QuizHistory {
  final String playerName;
  final String categoryName;
  final String topicName;
  final String difficulty;
  final int score;
  final int totalQuestions;
  final DateTime completedAt;

  const QuizHistory({
    required this.playerName,
    required this.categoryName,
    required this.topicName,
    required this.difficulty,
    required this.score,
    required this.totalQuestions,
    required this.completedAt,
  });

  int get percentage {
    if (totalQuestions == 0) return 0;
    return (score / totalQuestions * 100).round();
  }

  Map<String, dynamic> toJson() {
    return {
      'playerName': playerName,
      'categoryName': categoryName,
      'topicName': topicName,
      'difficulty': difficulty,
      'score': score,
      'totalQuestions': totalQuestions,
      'completedAt': completedAt.toIso8601String(),
    };
  }

  factory QuizHistory.fromJson(Map<String, dynamic> json) {
    return QuizHistory(
      playerName: json['playerName'] as String? ?? 'Pemain',
      categoryName: json['categoryName'] as String? ?? '-',
      topicName: json['topicName'] as String? ?? '-',
      difficulty: json['difficulty'] as String? ?? '-',
      score: (json['score'] as num?)?.toInt() ?? 0,
      totalQuestions: (json['totalQuestions'] as num?)?.toInt() ?? 0,
      completedAt:
          DateTime.tryParse(json['completedAt'] as String? ?? '') ??
          DateTime.now(),
    );
  }
}