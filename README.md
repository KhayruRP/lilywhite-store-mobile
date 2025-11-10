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



TUGAS 8
1. Perbedaan utama antara Navigator.push() dan Navigator.pushReplacement() terletak pada bagaimana keduanya mengatur tumpukan halaman (navigation stack) di Flutter.

Navigator.push() digunakan untuk menambahkan halaman baru di atas halaman sebelumnya, tanpa menghapus halaman yang lama dari tumpukan. Artinya, user masih bisa kembali ke halaman sebelumnya dengan menekan tombol back.

Navigator.pushReplacement() digunakan untuk mengganti halaman yang sedang ditampilkan dengan halaman baru, sehingga halaman lama dihapus dari tumpukan. Dengan cara ini, user tidak bisa kembali ke halaman sebelumnya dengan tombol back.

Dalam aplikasi Football Shop (Lilywhite Store), saya menggunakan kedua metode ini sesuai kebutuhan navigasi pengguna:

Navigator.push() saya gunakan ketika ingin membuka halaman baru tanpa menutup halaman sebelumnya.
Contohnya, saat pengguna menekan tombol "Create Product" di homepage, maka akan membuka halaman form penambahan produk (ItemsFormPage) menggunakan:

Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => const ItemsFormPage()),
);

Hal ini memungkinkan user untuk mengisi form, lalu menekan tombol back untuk kembali ke halaman utama tanpa kehilangan data sebelumnya.

Navigator.pushReplacement() saya gunakan ketika navigasi dilakukan ke halaman yang menggantikan halaman sebelumnya sepenuhnya.
Contohnya pada Left Drawer, ketika pengguna memilih menu “Home” atau “Add Item”, maka halaman saat ini akan diganti dengan halaman yang baru:

Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => MyHomePage(colorScheme: Theme.of(context).colorScheme)),
);

Cara ini mencegah pengguna kembali ke halaman lama yang sudah tidak relevan (misalnya tidak perlu kembali ke halaman form setelah berhasil menambah item)


2. Saya memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer berfungsi untuk membangun struktur halaman yang konsisten di seluruh aplikasi dengan prinsip reuse, separation of concerns, dan visual consistency.

Scaffold sebagai kerangka halaman utama - > Saya gunakan sebagai root layout setiap screen karena sudah menyediakan area standar (app bar, body, drawer, bottomNavigationBar, FAB). Dengan menggunakan Scaffold di semua halaman, tata letak dan perilaku dasar aplikasi menjadi konsisten — mis. padding, safe area, dan posisi FAB.

AppBar untuk identitas dan aksi global -> berisi judul halaman, logo / nama toko (Lilywhite Store), serta aksi yang sering dipakai seperti tombol search, icon cart dengan badge, dan menu profil. Saya menaruh elemen-elemen yang bersifat global atau konteks halaman di AppBar sehingga pengguna langsung tahu fungsi utama tiap halaman.

Drawer untuk navigasi utama -> berisi navigasi utama aplikasi: Home, Categories, Add Item, Orders, Profile, Logout, dll. Karena Drawer muncul di banyak halaman, saya buat LeftDrawer sebagai widget terpisah (mis. widgets/left_drawer.dart) lalu tinggal panggil di Scaffold.drawer. Ini membuat perubahan menu cukup dilakukan di satu tempat.

Membuat widget layout yang dapat digunakan ulang -> Untuk konsistensi, saya membuat sebuah BaseScaffold (atau variant) yang menerima parameter seperti title, body, actions, dan showDrawer. Jadi setiap screen cukup memanggil BaseScaffold(title: 'Home', body:) tanpa menulis ulang struktur. 


Kapan tidak menampilkan Drawer / AppBar -> Ada halaman yang sifatnya modal atau langkah khusus (mis. halaman login atau form checkout penuh layar) yang saya tampilkan tanpa Drawer atau dengan AppBar minimal — agar user fokus dan tidak bisa mengakses navigasi lain sembarangan. Halaman seperti detail produk biasanya tetap pakai AppBar untuk tombol back, tapi tidak selalu perlu Drawer.

Konsistensi visual & aksesibilitas -> Saya gunakan ThemeData dan ColorScheme di MaterialApp agar warna AppBar, icon, dan tombol seragam. Selain itu memperhatikan ukuran touch target, label teks pada icon, dan memastikan elemen penting dapat diakses via keyboard / screen reader bila perlu.

3. Dalam desain antarmuka Flutter, penggunaan layout widget seperti Padding, SingleChildScrollView, dan ListView sangat penting untuk membuat tampilan form yang rapi, responsif, dan mudah digunakan di berbagai ukuran layar.

Padding – untuk memberi jarak antar elemen
Widget Padding berfungsi agar setiap field dalam form tidak saling menempel dan terlihat lebih nyaman dibaca. Selain itu, padding juga membantu agar input field tidak menempel langsung ke tepi layar.

Di halaman Add Items Form, setiap TextFormField saya bungkus dengan Padding supaya tata letaknya lebih proporsional dan konsisten di seluruh form.

SingleChildScrollView – agar form bisa digulir (scrollable)
Saat form memiliki banyak elemen (misalnya title, price, description, category, thumbnail, switch “Is Featured”), kalau tidak digulung maka elemen di bawah bisa tertutup keyboard. Dengan SingleChildScrollView, pengguna tetap bisa menggulir halaman ke bawah tanpa kehilangan akses ke field lain.

Contoh dari kode saya di itemlist_form.dart:

body: Form(
  key: _formKey,
  child: SingleChildScrollView(
    child: Column(
      children: [
        // semua field form di sini
      ],
    ),
  ),
),


Ini memastikan form tetap bisa diisi dengan nyaman, bahkan di layar kecil atau ketika keyboard muncul.

ListView – untuk daftar input atau konten yang banyak dan dinamis
Kalau elemen-elemen form atau daftar item sifatnya dinamis atau panjang, ListView lebih efisien karena hanya merender elemen yang terlihat di layar. Misalnya nanti ketika saya ingin menampilkan daftar produk yang pernah ditambahkan, saya akan pakai ListView.builder() agar performanya tetap cepat meskipun data banyak.

4. Untuk menjaga identitas visual yang konsisten di aplikasi Football Shop, saya menyesuaikan warna tema menggunakan ThemeData dan ColorScheme di MaterialApp. Saya menetapkan warna utama (biru tua) sebagai warna brand toko

Dengan ini, semua komponen seperti AppBar, Drawer, Button, dan Card otomatis mengikuti warna tema tanpa harus diatur satu per satu. Selain itu, saya juga memastikan kontras warna tetap jelas agar teks mudah dibaca.

Contohnya, di main.dart saya buat:

theme: ThemeData(
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
    .copyWith(secondary: const Color(0xFFFFC107)),
),