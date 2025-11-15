# 📱 Tugas Pemrograman Mobile - Flutter

Repositori ini berisi hasil praktikum dan tugas mata kuliah **Pemrograman Mobile** menggunakan **Flutter**.  
Setiap folder di dalam repositori ini merepresentasikan tugas dari setiap **pertemuan**.

---


---

# 📱 Tugas Flutter - Desain Widget Kombinasi

Repositori ini berisi tugas **Pemrograman Mobile (Flutter)** yang berfokus pada **pembuatan kombinasi widget dasar** menggunakan layout `Row` dan `Column`.

---

## 🧩 Deskripsi Tugas

### 📝 Instruksi pertemuan 3:
1. **Buat desain widget kombinasi** dengan menggunakan:
   - **Icon**
   - **Button**
   - **Image**
   - **Text**
2. Gunakan layout **Row** dan **Column** untuk mengatur posisi widget.
3. Buat tampilan sekreatif mungkin, misalnya seperti:
   - Kartu profil pengguna,
   - Tampilan dashboard sederhana,
   - Desain kartu produk atau postingan media sosial.
4. Pastikan tampilan responsif dan rapi di berbagai ukuran layar.
5. Upload project ke **GitHub** masing-masing.
6. Kumpulkan **link repositori GitHub** kepada dosen sesuai instruksi.

### 📝 Instruksi pertemuan 5:
# Soal 3: Desain Daftar Kontak

Tugas ini adalah untuk membuat tampilan daftar kontak yang fungsional dan menarik secara visual menggunakan Flutter.

## 🎯 Instruksi Utama

Buat tampilan daftar kontak menggunakan `ListTile` yang dibungkus di dalam `Card`.

### Kriteria Setiap Item Kontak

Setiap item dalam daftar harus berisi:

* **Avatar:** Ikon orang (misalnya, `Icons.person` atau `CircleAvatar` dengan inisial).
* **Nama Kontak:** Teks untuk menampilkan nama.
* **Nomor Telepon:** Teks untuk menampilkan nomor.
* **Status:** Indikator status (Online, Offline, Away) dengan indikator warna kecil (misalnya, `Container` bulat kecil).
* **Tombol Panggil:** Sebuah `IconButton` dengan ikon telepon (misalnya, `Icons.call`).

### ✨ Peningkatan UX (User Experience)

Tambahkan elemen UX yang baik untuk membuat aplikasi lebih ramah pengguna:

* **Warna Status:** Gunakan warna yang jelas dan mudah dibedakan untuk status (contoh: Hijau untuk Online, Abu-abu untuk Offline, Kuning/Oranye untuk Away).
* **Keterbacaan:** Pastikan semua teks mudah dibaca (kontras warna dan ukuran font yang baik).
* **Interaksi:** Ketika `IconButton` panggil ditekan, tampilkan `SnackBar` atau `Dialog` sederhana (contoh: "Memanggil [Nama Kontak]...").

---

## 🏆 Bonus

* Buat satu versi tambahan dari tampilan ini yang mendukung **Dark Mode** (Mode Gelap) secara penuh.
---

## 🧠 Tujuan Pembelajaran
- Memahami struktur project Flutter.
- Mengimplementasikan **widget dasar Flutter**.
- Menggunakan **layouting** dengan `Row` dan `Column`.
- Menggabungkan berbagai komponen UI dalam satu halaman.

---

## 💡 Contoh Widget yang Digunakan
- `Scaffold`
- `AppBar`
- `Row`
- `Column`
- `Container`
- `Icon`
- `Text`
- `Image`
- `ElevatedButton` / `TextButton` / `IconButton`

---

## ▶️ Cara Menjalankan Project
1. Clone repositori ke lokal:
   ```bash
   git clone https://github.com/wahyualvyy/tugas-pemrograman-mobile.git
2. Masuk ke folder tugas pertemuan 3
   ```bash
   cd pertemuan_3
3. Jalankan program
   ```bash
   flutter run
