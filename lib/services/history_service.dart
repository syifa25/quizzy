import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/quiz_history.dart';

class HistoryService {
  static const String _storageKey = 'quiz_history';

  // Mengambil semua riwayat permainan.
  static Future<List<QuizHistory>> getHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final String? savedData = prefs.getString(_storageKey);

    if (savedData == null || savedData.isEmpty) {
      return [];
    }

    try {
      final List<dynamic> decodedData = jsonDecode(savedData);

      return decodedData.map((item) {
        return QuizHistory.fromJson(
          Map<String, dynamic>.from(item as Map),
        );
      }).toList();
    } catch (e) {
      return [];
    }
  }

  // Menyimpan riwayat baru di urutan paling atas.
  static Future<void> saveHistory(QuizHistory history) async {
    final prefs = await SharedPreferences.getInstance();
    final List<QuizHistory> historyList = await getHistory();

    historyList.insert(0, history);

    final String encodedData = jsonEncode(
      historyList.map((item) => item.toJson()).toList(),
    );

    await prefs.setString(_storageKey, encodedData);
  }

  // Menghapus semua riwayat jika suatu saat dibutuhkan.
  static Future<void> clearHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_storageKey);
  }
}