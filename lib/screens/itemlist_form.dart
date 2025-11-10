import 'package:flutter/material.dart';
import 'package:lilywhite_store_mobile/widgets/left_drawer.dart';

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
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Item Submitted'),
                    content: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                           Text('Title: $_title'),
                           Text('Price: $_price'),
                            Text('Description: $_description'),
                            Text('Category: $_category'),
                            Text('Thumbnail: $_thumbnail'),
                            Text(
                                'Is Featured: ${_isFeatured ? "Yes" : "No"}'),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.pop(context);
                          _formKey.currentState!.reset();
                        },
                      ),
                    ],
                  );
                },
              );
           
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

