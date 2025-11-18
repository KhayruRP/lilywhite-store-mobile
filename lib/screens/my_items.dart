import 'package:flutter/material.dart';
import 'package:lilywhite_store_mobile/models/items_entry.dart';
import 'package:lilywhite_store_mobile/widgets/left_drawer.dart';
import 'package:lilywhite_store_mobile/screens/items_detail.dart';
import 'package:lilywhite_store_mobile/widgets/items_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class MyItemsPage extends StatefulWidget {
  const MyItemsPage({super.key});

  @override
  State<MyItemsPage> createState() => _MyItemsPageState();
}

class _MyItemsPageState extends State<MyItemsPage> {
  Future<List<ItemsEntry>> fetchMyItems(CookieRequest request) async {
    // TODO: Replace the URL with your app's URL and don't forget to add a trailing slash (/)!
    // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
    // If you using chrome,  use URL http://localhost:8000
    
    try {
      // Use server-side filter endpoint to get only current user's items
      // (backend should use session/cookie to determine current user)
      final response = await request
          .get('http://localhost:8000/json/?filter=my')
          .timeout(const Duration(seconds: 10));

      var data = response;

      List<ItemsEntry> listItems = [];
      for (var d in data) {
        if (d != null) {
          listItems.add(ItemsEntry.fromJson(d));
        }
      }

      return listItems;
    } catch (e) {
      // If fetching fails or times out, return empty list to avoid blocking UI
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Products'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchMyItems(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.inbox,
                      size: 80,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'You haven\'t created any products yet.',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => ItemsEntryCard(
                  items: snapshot.data![index],
                  onTap: () {
                    // Navigate to items detail page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ItemsDetailPage(
                          items: snapshot.data![index],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          }
        },
      ),
    );
  }
}
