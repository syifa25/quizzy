# 🎯 Quizzy

**Quizzy** adalah aplikasi kuis pilihan ganda berbasis Flutter yang dirancang untuk menguji pengetahuan pengguna melalui berbagai kategori dan tingkat kesulitan. Aplikasi ini memiliki tampilan yang interaktif dan sederhana sehingga pengguna bisa belajar sambil bermain.

## 👩‍💻 Identitas Pengembang

| Informasi | Keterangan |
|---|---|
| Nama | Umri Marsyifa |
| NIM | 241401029 |
| Program Studi | Ilmu Komputer |
| Lab | 3 |

## 📱 Deskripsi Aplikasi

Quizzy merupakan aplikasi kuis yang memungkinkan pengguna mengerjakan soal berdasarkan kategori, topik, dan tingkat kesulitan yang dipilih.

Pengguna dapat memasukkan nama, memilih kategori kuis, menjawab pertanyaan pilihan ganda, dan melihat hasil setelah menyelesaikan kuis. Aplikasi juga menyediakan penjelasan jawaban serta fitur riwayat permainan untuk membantu pengguna melihat hasil kuis sebelumnya.

## ✨ Fitur Utama

- **Player Name:** Pengguna memasukkan nama sebelum memulai kuis.
- **Multiple Categories:** Tersedia tiga kategori utama, yaitu Matematika, Biologi, dan Programming.
- **Topic Selection:** Setiap kategori menyediakan beberapa topik yang dapat dipilih.
- **Difficulty Levels:** Tersedia tiga tingkat kesulitan, yaitu Easy, Medium, dan Hard.
- **Interactive Quiz:** Pengguna menjawab pertanyaan pilihan ganda dan mendapatkan umpan balik atas jawabannya.
- **Score Calculation:** Skor dihitung berdasarkan jawaban yang benar.
- **Answer Explanation:** Pengguna dapat melihat penjelasan jawaban pada proses kuis atau halaman hasil.
- **Result Review:** Halaman hasil menampilkan skor dan ulasan jawaban.
- **Quiz History:** Riwayat permainan dirancang untuk menyimpan informasi hasil kuis secara lokal.
- **Light and Dark Mode:** Pengguna dapat memilih tampilan terang atau gelap.
- **Responsive Layout:** Tampilan dirancang agar dapat menyesuaikan ukuran layar perangkat.

## 🛠️ Teknologi yang Digunakan

- **Flutter** — framework untuk membangun antarmuka dan aplikasi multiplatform.
- **Dart** — bahasa pemrograman utama aplikasi.
- **Material Design** — komponen antarmuka aplikasi.
- **SharedPreferences** — package untuk penyimpanan data sederhana secara lokal.
- **Google Fonts — Nunito** — referensi font yang digunakan dalam desain aplikasi.

## 🗂️ Struktur Proyek

```text
quizzy/
├── assets/
│   └── fonts/
│       └── Nunito-VariableFont_wght.ttf
├── lib/
│   ├── data/
│   │   ├── quiz_categories.dart
│   │   └── question_bank.dart
│   ├── models/
│   │   ├── question.dart
│   │   └── quiz_history.dart
│   ├── screens/
│   │   ├── home_screen.dart
│   │   ├── name_screen.dart
│   │   ├── category_screen.dart
│   │   ├── topic_screen.dart
│   │   ├── difficulty_screen.dart
│   │   ├── quiz_screen.dart
│   │   ├── result_screen.dart
│   │   └── history_screen.dart
│   ├── services/
│   │   └── history_service.dart
│   ├── widgets/
│   ├── theme_controller.dart
│   └── main.dart
├── pubspec.yaml
└── README.md
```

*Catatan: Struktur di atas menggambarkan susunan file yang digunakan dalam pengembangan Quizzy. Pastikan nama dan lokasi setiap file sesuai dengan versi proyek yang terakhir.*

## 🚀 Cara Menjalankan Aplikasi

### Prasyarat

Pastikan perangkat sudah memiliki:
- Flutter SDK.
- Dart SDK yang sesuai dengan instalasi Flutter.
- Visual Studio Code atau editor lainnya.
- Android Studio atau perangkat Android untuk menjalankan aplikasi Android.

### Langkah Menjalankan

1. Clone repository:

   ```bash
   git clone https://github.com/syifa25/quizzy.git
   ```

2. Masuk ke direktori proyek:

   ```bash
   cd quizzy
   ```

3. Unduh dependensi:

   ```bash
   flutter pub get
   ```

4. Jalankan aplikasi:

   ```bash
   flutter run
   ```

## 🖼️ Screenshot Aplikasi

Tambahkan screenshot aplikasi pada bagian ini agar pembaca dapat melihat tampilan dan alur penggunaan Quizzy.

### 1. Home Screen

Halaman utama untuk memulai kuis dan membuka riwayat permainan.

![Home Screen](screenshots/home_screen.png)

### 2. Name Screen

Halaman untuk memasukkan nama pemain.

![Name Screen](screenshots/name_screen.png)

### 3. Category Screen

Halaman pemilihan kategori kuis.

![Category Screen](screenshots/category_screen.png)

### 4. Topic Screen

Halaman pemilihan topik berdasarkan kategori.

![Topic Screen](screenshots/topic_screen.png)

### 5. Difficulty Screen

Halaman untuk memilih tingkat kesulitan.

![Difficulty Screen](screenshots/difficulty_screen.png)

### 6. Quiz Screen

Halaman pengerjaan soal pilihan ganda.

![Quiz Screen](screenshots/quiz_screen.png)

### 7. Result Screen

Halaman hasil kuis yang menampilkan skor dan ulasan jawaban.

![Result Screen](screenshots/result_screen.png)

### 8. History Screen

Halaman untuk melihat riwayat permainan yang tersimpan.

![History Screen](screenshots/history_screen.png)

### 9. Dark Mode

Contoh tampilan aplikasi ketika menggunakan tema gelap.

![Dark Mode](screenshots/dark_mode.png)

> **Catatan:** Simpan screenshot asli aplikasi ke dalam folder `screenshots/` menggunakan nama file yang tercantum di atas. Jika suatu halaman atau fitur belum berhasil diuji, pastikan fitur tersebut berfungsi sebelum mengambil screenshot untuk dokumentasi.

## 🎨 Desain dan Prototype

Link desain atau prototype aplikasi:

**Figma:** [Tambahkan link prototype Figma di sini]

## 🎥 Video Presentasi

Video presentasi Quizzy menjelaskan fitur aplikasi, alur penggunaan, dan implementasi fitur utama.

**Google Drive:** [Tambahkan link video presentasi di sini]

Durasi video: maksimal 10 menit.

## 📦 Kredit Aset

- **Font Nunito:** [Google Fonts — Nunito](https://fonts.google.com/specimen/Nunito)
- **Ikon antarmuka:** Menggunakan ikon bawaan Flutter Material Icons.
- **Ilustrasi atau aset tambahan:** Cantumkan sumber dan lisensi aset yang benar-benar digunakan dalam aplikasi.

## 📌 Pengembangan Selanjutnya

Beberapa pengembangan yang dapat dipertimbangkan untuk Quizzy:
- Menambahkan lebih banyak variasi soal.
- Menyediakan statistik perkembangan skor pengguna.
- Mengembangkan fitur pengacakan soal.
- Menambahkan kategori kuis baru.

## 📄 Lisensi

Proyek ini dikembangkan untuk keperluan pembelajaran dan pemenuhan tugas Ujian Tengah Semester (UTS).

---

**Quizzy — Learn something new, one quiz at a time. 💜**