import 'package:flutter/material.dart';
import 'package:lilywhite_store_mobile/models/items_entry.dart';
import 'package:lilywhite_store_mobile/widgets/left_drawer.dart';
import 'package:lilywhite_store_mobile/screens/items_detail.dart';
import 'package:lilywhite_store_mobile/widgets/items_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ItemsEntryListPage extends StatefulWidget {
  const ItemsEntryListPage({super.key});

  @override
  State<ItemsEntryListPage> createState() => _ItemsEntryListPageState();
}

class _ItemsEntryListPageState extends State<ItemsEntryListPage> {
  Future<List<ItemsEntry>> fetchItems(CookieRequest request) async {
    // TODO: Replace the URL with your app's URL and don't forget to add a trailing slash (/)!
    // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
    // If you using chrome,  use URL http://localhost:8000

    final response = await request.get('https://khayru-rafamanda-storelilywhites.pbp.cs.ui.ac.id/json/');

    // Decode response to json format
    var data = response;

    // Convert json data to ItemsEntry objects
    List<ItemsEntry> listItems = [];
      for (var d in data) {
          if (d != null) {
            try {
              listItems.add(ItemsEntry.fromJson(d));
            } catch (e, stack) {
              debugPrint('Error parsing item: $e');
              debugPrint('Raw data: $d');
            }
          }
        } return listItems;
  } 

      @override
      Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Scaffold(
          appBar: AppBar(title: const Text('Items Entry List')),
          drawer: const LeftDrawer(),
          body: FutureBuilder(
            future: fetchItems(request),
            builder: (context, AsyncSnapshot<List<ItemsEntry>> snapshot) {
              // 1. Loading
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              // 2. Error
              if (snapshot.hasError) {
                return Center(child: Text('Terjadi error: ${snapshot.error}'));
              }

              // 3. Data sudah selesai di-load
              final items = snapshot.data;

              // 4. Data kosong
              if (items == null || items.isEmpty) {
                return const Column(
                  children: [
                    Text(
                      'There are no items in football items yet.',
                      style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              }

              // 5. Data ada → tampilkan ListView
              return ListView.builder(
                itemCount: items.length,
                itemBuilder: (_, index) => ItemsEntryCard(
                  items: items[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ItemsDetailPage(items: items[index]),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        );
      }
    }
  
