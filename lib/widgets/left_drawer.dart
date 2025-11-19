import 'package:flutter/material.dart';
import 'package:lilywhite_store_mobile/screens/menu.dart';
import 'package:lilywhite_store_mobile/screens/itemlist_form.dart';
import 'package:lilywhite_store_mobile/screens/items_entry_list.dart';
import 'package:lilywhite_store_mobile/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Column(
              children: [
                Text(
                  'Lilywhite Store',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Your one-stop shop for sports gear",
                  // TODO: Tambahkan gaya teks dengan center alignment, font ukuran 15, warna putih, dan weight biasa
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      MyHomePage(colorScheme: Theme.of(context).colorScheme),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.post_add),
            title: const Text('Add Item'),
            // Bagian redirection ke ItemsFormPage
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ItemsFormPage()),
              );
            },
          ), // TODO: Bagian routing
          ListTile(
            leading: const Icon(Icons.add_reaction_rounded),
            title: const Text('Items List'),
            onTap: () {
              // Route to items list page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ItemsEntryListPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () async {
              // Ambil instance CookieRequest dari Provider
              final request = context.read<CookieRequest>();

              final response = await request.logout(
                "https://khayru-rafamanda-storelilywhites.pbp.cs.ui.ac.id/auth/logout/",
              );

              final String message = response["message"];

              if (!context.mounted) return;

              if (response['status']) {
                final String uname = response["username"];

                // Tutup drawer dulu biar nggak numpuk
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("$message See you again, $uname.")),
                );

                // Arahkan ke halaman login, ganti route utama
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              } else {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(message)));
              }
            },
          ),
        ],
      ),
    );
  }
}
