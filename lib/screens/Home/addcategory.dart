import 'package:flutter/material.dart';

class Addcategory extends StatefulWidget {
  @override
  State<Addcategory> createState() => _AddcategoryState();
}

class _AddcategoryState extends State<Addcategory> {
  String name = '';

  void showNameDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Name'),
          content: TextField(
            onChanged: (value) {
              setState(() {
                name = value;
              });
            },
          ),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog Example'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextButton(
              onPressed: showNameDialog,
              child: Text(
                'Show Dialog',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
          if (name.isNotEmpty) ...[
            Container(
              width: 140,
              height: 140,
              color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  TextButton(
                    child: Text('Add Task'),
                    onPressed: () {
                      // Perform the desired action when the "Add Task" button is pressed.
                    },
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
