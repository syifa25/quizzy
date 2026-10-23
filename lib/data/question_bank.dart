import '../models/question.dart';
import 'quiz_categories.dart';

const Map<String, Map<QuizDifficulty, List<Question>>> questionBank = {
  // ==================== MATEMATIKA ====================
  'Matematika Dasar': {
    QuizDifficulty.easy: [
      Question(
        question: 'Berapakah hasil dari 5 + 3?',
        options: ['6', '7', '8', '9'],
        correctAnswerIndex: 2,
        explanation: '5 + 3 = 8.',
      ),
      Question(
        question: 'Berapakah hasil dari 10 - 4?',
        options: ['4', '5', '6', '7'],
        correctAnswerIndex: 2,
        explanation: '10 dikurangi 4 menghasilkan 6.',
      ),
    ],
    QuizDifficulty.medium: [
      Question(
        question: 'Berapakah hasil dari 12 × 8?',
        options: ['86', '96', '106', '108'],
        correctAnswerIndex: 1,
        explanation: '12 × 8 = 96.',
      ),
    ],
    QuizDifficulty.hard: [
      Question(
        question: 'Berapakah hasil dari 144 ÷ 12 + 7?',
        options: ['12', '17', '19', '21'],
        correctAnswerIndex: 2,
        explanation: '144 ÷ 12 = 12, lalu 12 + 7 = 19.',
      ),
    ],
  },

  // ==================== ALJABAR ====================
  'Aljabar': {
    QuizDifficulty.easy: [
      Question(
        question: 'Jika x = 3, berapakah nilai x + 2?',
        options: ['4', '5', '6', '7'],
        correctAnswerIndex: 1,
        explanation: 'Masukkan x = 3, sehingga 3 + 2 = 5.',
      ),
    ],
    QuizDifficulty.medium: [
      Question(
        question: 'Jika 2x = 12, berapakah nilai x?',
        options: ['4', '5', '6', '8'],
        correctAnswerIndex: 2,
        explanation: 'Kedua sisi dibagi 2, sehingga x = 6.',
      ),
    ],
    QuizDifficulty.hard: [
      Question(
        question: 'Jika 3x + 5 = 20, berapakah nilai x?',
        options: ['3', '4', '5', '6'],
        correctAnswerIndex: 2,
        explanation: '3x = 20 - 5 = 15, sehingga x = 5.',
      ),
    ],
  },

  // ==================== GEOMETRI ====================
  'Geometri': {
    QuizDifficulty.easy: [
      Question(
        question: 'Bangun datar yang memiliki 3 sisi adalah ...',
        options: ['Persegi', 'Segitiga', 'Lingkaran', 'Persegi panjang'],
        correctAnswerIndex: 1,
        explanation: 'Segitiga memiliki tiga sisi.',
      ),
    ],
    QuizDifficulty.medium: [
      Question(
        question: 'Luas persegi dengan sisi 6 cm adalah ...',
        options: ['12 cm²', '24 cm²', '36 cm²', '42 cm²'],
        correctAnswerIndex: 2,
        explanation: 'Luas persegi = sisi × sisi = 6 × 6 = 36 cm².',
      ),
    ],
    QuizDifficulty.hard: [
      Question(
        question: 'Sebuah persegi panjang memiliki panjang 12 cm dan lebar 5 cm. Luasnya adalah ...',
        options: ['17 cm²', '34 cm²', '50 cm²', '60 cm²'],
        correctAnswerIndex: 3,
        explanation: 'Luas persegi panjang = panjang × lebar = 12 × 5 = 60 cm².',
      ),
    ],
  },

  // ==================== BIOLOGI ====================
  'Sel dan Jaringan': {
    QuizDifficulty.easy: [
      Question(
        question: 'Unit struktural dan fungsional terkecil makhluk hidup adalah ...',
        options: ['Organ', 'Jaringan', 'Sel', 'Sistem organ'],
        correctAnswerIndex: 2,
        explanation: 'Sel merupakan unit struktural dan fungsional terkecil makhluk hidup.',
      ),
    ],
    QuizDifficulty.medium: [
      Question(
        question: 'Organel yang berperan sebagai tempat respirasi sel adalah ...',
        options: ['Ribosom', 'Mitokondria', 'Lisosom', 'Badan Golgi'],
        correctAnswerIndex: 1,
        explanation: 'Mitokondria menghasilkan sebagian besar ATP melalui respirasi sel.',
      ),
    ],
    QuizDifficulty.hard: [
      Question(
        question: 'Organel yang berperan utama dalam sintesis protein adalah ...',
        options: ['Ribosom', 'Lisosom', 'Vakuola', 'Sentriol'],
        correctAnswerIndex: 0,
        explanation: 'Ribosom merupakan tempat berlangsungnya sintesis protein.',
      ),
    ],
  },

  'Genetika': {
    QuizDifficulty.easy: [
      Question(
        question: 'Materi genetik yang membawa informasi pewarisan sifat adalah ...',
        options: ['Air', 'DNA', 'Glukosa', 'Lemak'],
        correctAnswerIndex: 1,
        explanation: 'DNA menyimpan informasi genetik makhluk hidup.',
      ),
    ],
    QuizDifficulty.medium: [
      Question(
        question: 'Jika alel A dominan terhadap a, genotipe heterozigotnya adalah ...',
        options: ['AA', 'aa', 'Aa', 'AAA'],
        correctAnswerIndex: 2,
        explanation: 'Heterozigot memiliki dua alel berbeda, yaitu Aa.',
      ),
    ],
    QuizDifficulty.hard: [
      Question(
        question: 'Persilangan Aa × Aa menghasilkan peluang genotipe aa sebesar ...',
        options: ['0%', '25%', '50%', '75%'],
        correctAnswerIndex: 1,
        explanation: 'Hasil persilangan adalah AA, Aa, Aa, dan aa. Peluang aa adalah 1 dari 4 atau 25%.',
      ),
    ],
  },

  'Ekologi': {
    QuizDifficulty.easy: [
      Question(
        question: 'Hubungan antara makhluk hidup dan lingkungannya dipelajari dalam ...',
        options: ['Genetika', 'Ekologi', 'Anatomi', 'Taksonomi'],
        correctAnswerIndex: 1,
        explanation: 'Ekologi mempelajari interaksi makhluk hidup dengan lingkungannya.',
      ),
    ],
    QuizDifficulty.medium: [
      Question(
        question: 'Organisme yang mampu membuat makanannya sendiri disebut ...',
        options: ['Konsumen', 'Dekomposer', 'Produsen', 'Predator'],
        correctAnswerIndex: 2,
        explanation: 'Produsen dapat menghasilkan makanan sendiri, misalnya melalui fotosintesis.',
      ),
    ],
    QuizDifficulty.hard: [
      Question(
        question: 'Dalam rantai makanan, energi umumnya berpindah dari ...',
        options: [
          'Konsumen ke produsen',
          'Produsen ke konsumen',
          'Dekomposer ke matahari',
          'Konsumen ke matahari',
        ],
        correctAnswerIndex: 1,
        explanation: 'Energi berpindah dari produsen ke konsumen melalui proses makan dan dimakan.',
      ),
    ],
  },

  // ==================== PROGRAMMING ====================
  'Dasar Pemrograman': {
    QuizDifficulty.easy: [
      Question(
        question: 'Apa fungsi variabel dalam pemrograman?',
        options: [
          'Menyimpan data',
          'Menghapus aplikasi',
          'Mematikan komputer',
          'Mengganti perangkat keras',
        ],
        correctAnswerIndex: 0,
        explanation: 'Variabel digunakan untuk menyimpan nilai yang dapat digunakan program.',
      ),
    ],
    QuizDifficulty.medium: [
      Question(
        question: 'Struktur yang digunakan untuk menjalankan kode berdasarkan kondisi adalah ...',
        options: ['if-else', 'import', 'comment', 'print saja'],
        correctAnswerIndex: 0,
        explanation: 'if-else memilih jalur eksekusi berdasarkan kondisi.',
      ),
    ],
    QuizDifficulty.hard: [
      Question(
        question: 'Berapa kali perulangan berikut berjalan jika i dimulai dari 0?\nfor (int i = 0; i < 5; i++)',
        options: ['4 kali', '5 kali', '6 kali', 'Tidak berjalan'],
        correctAnswerIndex: 1,
        explanation: 'Perulangan berjalan untuk i = 0, 1, 2, 3, dan 4, yaitu 5 kali.',
      ),
    ],
  },

  'Dart': {
    QuizDifficulty.easy: [
      Question(
        question: 'Bahasa pemrograman yang digunakan Flutter adalah ...',
        options: ['Java', 'Dart', 'PHP', 'SQL'],
        correctAnswerIndex: 1,
        explanation: 'Flutter menggunakan Dart sebagai bahasa pemrograman utamanya.',
      ),
    ],
    QuizDifficulty.medium: [
      Question(
        question: 'Keyword Dart untuk membuat variabel yang nilainya tidak dapat diubah setelah diinisialisasi adalah ...',
        options: ['var', 'final', 'dynamic', 'void'],
        correctAnswerIndex: 1,
        explanation: 'final membuat variabel tidak dapat diberi nilai baru setelah diinisialisasi.',
      ),
    ],
    QuizDifficulty.hard: [
      Question(
        question: 'Apa hasil dari kode Dart berikut?\nprint(2 + 3 * 4);',
        options: ['20', '14', '24', '11'],
        correctAnswerIndex: 1,
        explanation: 'Perkalian dikerjakan lebih dahulu: 3 × 4 = 12, lalu 2 + 12 = 14.',
      ),
    ],
  },

  'Python': {
    QuizDifficulty.easy: [
      Question(
        question: 'Perintah Python yang umum digunakan untuk menampilkan teks adalah ...',
        options: ['echo()', 'printf()', 'print()', 'show()'],
        correctAnswerIndex: 2,
        explanation: 'Fungsi print() digunakan untuk menampilkan keluaran.',
      ),
    ],
    QuizDifficulty.medium: [
      Question(
        question: 'Apa hasil dari kode Python berikut?\nprint(10 % 3)',
        options: ['1', '3', '3.33', '0'],
        correctAnswerIndex: 0,
        explanation: 'Operator % menghasilkan sisa pembagian. Sisa 10 dibagi 3 adalah 1.',
      ),
    ],
    QuizDifficulty.hard: [
      Question(
        question: 'Apa hasil dari kode Python berikut?\nprint([x * 2 for x in range(3)])',
        options: ['[2, 4, 6]', '[0, 2, 4]', '[0, 1, 2]', '[1, 2, 3]'],
        correctAnswerIndex: 1,
        explanation: 'range(3) menghasilkan 0, 1, 2. Setiap nilai dikalikan 2 menjadi [0, 2, 4].',
      ),
    ],
  },
};