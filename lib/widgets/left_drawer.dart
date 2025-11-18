import 'package:flutter/material.dart';
import 'package:lilywhite_store_mobile/screens/menu.dart';
import 'package:lilywhite_store_mobile/screens/itemlist_form.dart';
import 'package:lilywhite_store_mobile/screens/items_entry_list.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
  decoration: BoxDecoration(
    color: Colors.blue,
  ),
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
      Text("Your one-stop shop for sports gear",
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
                builder: (context) => MyHomePage(colorScheme: Theme.of(context).colorScheme),
        ));
  },
),
ListTile(
  leading: const Icon(Icons.post_add),
  title: const Text('Add Item'),
  // Bagian redirection ke ItemsFormPage
  onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const ItemsFormPage(),
            ),
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
            MaterialPageRoute(builder: (context) => const ItemsEntryListPage()),
        );
    },
),
        ],
      ),
    );
  }
}