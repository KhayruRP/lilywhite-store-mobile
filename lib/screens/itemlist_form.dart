import 'package:flutter/material.dart';
import 'package:lilywhite_store_mobile/widgets/left_drawer.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:lilywhite_store_mobile/screens/menu.dart';

class ItemsFormPage extends StatefulWidget {
    const ItemsFormPage({super.key});

    @override
    State<ItemsFormPage> createState() => _ItemsFormPageState();
}

class _ItemsFormPageState extends State<ItemsFormPage> {
  final _formKey = GlobalKey<FormState>();
    
    String _title = "";
    int _price = 0;
    String _description = "";
    String _category = "jersey"; // default
    String _thumbnail = "";
    bool _isFeatured = false; // default

    final List<String> _categories = [
      'jersey',
      'socks',
      'shorts',
      'shoes',
    ];
  @override
  Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Scaffold(
                appBar: AppBar(
                  title: const Center(
                    child: Text(
                      'Add Items Form',
                    ),
                  ),
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                ),
                drawer: LeftDrawer(),
                body: Form(
                  key: _formKey,
                child: SingleChildScrollView(
                    child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children:[
    // === Title ===
  Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Title",
          labelText: "Title",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        onChanged: (String? value) {
          setState(() {
            _title = value!;
          });
        },
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return "Title must be filled!";
          }
          return null;
        },
      ),
    ),

    Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Price",
          labelText: "Price",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        onChanged: (String? value) {
          setState(() {
            _title = value!;
          });
        },
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return "Price must be filled!";
          }
          return null;
        },
      ),
    ),
  // === Description ===
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      maxLines: 5,
      decoration: InputDecoration(
        hintText: "Description",
        labelText: "Description",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      onChanged: (String? value) {
        setState(() {
          _description = value!;
        });
      },
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "Description must be filled!";
        }
        return null;
      },
    ),
  ),

  // === Category ===
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: "Category",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      value: _category,
      items: _categories
          .map((cat) => DropdownMenuItem(
                value: cat,
                child: Text(
                    cat[0].toUpperCase() + cat.substring(1)),
              ))
          .toList(),
      onChanged: (String? newValue) {
        setState(() {
          _category = newValue!;
        });
      },
    ),
  ),

  // === Thumbnail URL ===
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      decoration: InputDecoration(
        hintText: "URL Thumbnail (optional)",
        labelText: "URL Thumbnail",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      onChanged: (String? value) {
        setState(() {
          _thumbnail = value!;
        });
      },
    ),
  ),

  // === Is Featured ===
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: SwitchListTile(
      title: const Text("Is Featured"),
      value: _isFeatured,
      onChanged: (bool value) {
        setState(() {
          _isFeatured = value;
        });
      },
    ),
  ),

   Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Colors.indigo),
          ),
          onPressed: () async {
              if (_formKey.currentState!.validate()) {
                // TODO: Replace the URL with your app's URL
                // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
                // If you using chrome,  use URL http://localhost:8000
                
                final response = await request.postJson(
                  "http://localhost:8000/create-flutter/",
                  jsonEncode({
                    "title": _title,
                    "description": _description,
                    "thumbnail": _thumbnail,
                    "category": _category,
                    "is_featured": _isFeatured,
                  }),
                );
                if (context.mounted) {
                  if (response['status'] == 'success') {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(
                      content: Text("News successfully saved!"),
                    ));
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyHomePage(colorScheme: Theme.of(context).colorScheme)),
                    );
                  } else {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(
                      content: Text("Something went wrong, please try again."),
                    ));
                  }
                }
              }
            },
          child: const Text(
            "Save",
            style: TextStyle(color: Colors.white),
          ),
        ),
                    ))],
              )
              )
              )
              );
    }
}

