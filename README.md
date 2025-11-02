# lilywhite_store_mobile

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Khayru Rafamanda Prananta - 2406495893 - F

TUGAS 7 

1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.

Jadi di Flutter itu semua yang kita lihat di layar disebut widget, seperti tombol, teks, gambar, layout, dan sebagainya. Semua widget itu disusun secara bertingkat seperti pohon, yang disebut widget tree.

Di dalam tree itu ada hubungan parent dan child:
- Widget parent itu seperti pembungkus atau wadah utama.
- Widget child itu elemen yang ada di dalamnya.

2.  Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.

Beberapa widget yang saya pakai di tugas ini misalnya:

MaterialApp: sebagai root widget aplikasi berbasis Material Design. Dia menyediakan konfigurasi aplikasi (title, theme, routing, dsb).
Scaffold: struktur dasar halaman (layout skeleton) yang menyediakan area appBar, body, floatingActionButton, dsb.
AppBar: bar atas halaman yang biasanya menampilkan judul atau aksi. Di kode menampilkan judul "Lilywhite" dan menggunakan warna dari theme.
Padding: memberi jarak (padding) di sekeliling child widget.
Column: menyusun widget satu per satu secara vertikal.
Row: menyusun widget secara horizontal, dipakai untuk menaruh tiga InfoCard berdampingan.
Center: memposisikan child di tengah parent.
SizedBox: memberi jarak tetap (di kode dipakai SizedBox(height: 16.0)).
Card: membuat kotak/kartu dengan elevasi (bayangan) — dipakai di InfoCard.
Container: wadah serbaguna untuk atur padding, width, height, dan dekorasi. Dipakai di InfoCard dan ItemCard
GridView.count: menampilkan daftar widget dalam bentuk grid dengan jumlah kolom tetap (crossAxisCount: 3). Di kode dipakai untuk menampilkan ItemCard berulang.
Text: menampilkan teks di layar (mis. judul, nama, npm, dsb).
Icon: menampilkan ikon (dipakai di ItemCard).
Material: widget yang menyediakan material surface (digunakan agar InkWell ripple effect muncul di atas background warna item.color).
InkWell: mendeteksi ketukan (tap) dan menampilkan efek sentuh (ripple). Di ItemCard dipakai untuk menangani tap dan memicu SnackBar.

3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root

MaterialApp itu widget yang membungkus seluruh aplikasi Flutter dan memberikan fitur-fitur penting seperti:
- Tema (warna, font, dll)
- Routing / navigasi antar halaman
- Konteks Material Design (biar tombol, AppBar, dsb tampil sesuai gaya Android modern)

Karena MaterialApp sudah nyiapin “kerangka” untuk aplikasi berbasis Material Design, makanya widget ini hampir selalu dipakai di paling atas (root).
Tanpa ini, widget lain seperti Scaffold atau AppBar kadang tidak bisa tampil dengan benar


4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?

StatelessWidget -> isinya tidak bisa berubah, atau tampilannya tetap selama aplikasi jalan.
Contoh: Text("Halo"), karena teks itu tidak akan berubah sendiri.

StatefulWidget -> bisa berubah tampilan karena ada state (keadaan) yang bisa di-update.
Misalnya counter yang nambah saat tombol ditekan.

Kalau saya butuh tampilan yang interaktif (seperti tombol yang ubah teks, atau daftar yang bisa di-refresh), saya pakai StatefulWidget.
Kalau cuma buat tampilan statis, saya cukup pakai StatelessWidget biar simpel dan lebih ringan.

5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?

BuildContext itu seperti identitas atau posisi dari widget di dalam widget tree.
Dengan BuildContext, Flutter tahu widget itu ada di mana dan bisa cari widget lain di atasny

6.  Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".

Hot reload -> menyimpan perubahan kode dan langsung memperbarui tampilan tanpa kehilangan state.
Jadi misalnya kamu ubah teks atau warna, tinggal tekan r (atau klik reload), langsung berubah di emulator tanpa reset ulang.

Hot restart ->  memulai ulang seluruh aplikasi dari awal, jadi semua state hilang (seperti app-nya direstart total).
Biasanya dipakai kalau ubah hal besar, seperti inisialisasi variabel global atau struktur kode utama.

Sebagai pemula, saya lebih sering pakai hot reload buat ngecek tampilan cepat, dan hot restart kalau ada bug yang butuh reset app dari awal.