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
      // First, get the current user info
      final userResponse = await request.get('http://localhost:8000/auth/user/');
      String currentUsername = userResponse['username'] ?? '';
      
      // Then, fetch all items
      final response = await request.get('http://localhost:8000/json/');
      
      // Decode response to json format
      var data = response;
      
      // Convert json data to ItemsEntry objects and filter by current user
      List<ItemsEntry> listItems = [];
      for (var d in data) {
        if (d != null) {
          listItems.add(ItemsEntry.fromJson(d));
        }
      }
      
      // Filter items to show only those created by the current user
      List<ItemsEntry> myItems = listItems
          .where((item) => item.username == currentUsername)
          .toList();
      
      return myItems;
    } catch (e) {
      // If fetching user info fails, return empty list
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
