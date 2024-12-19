import 'package:flutter/material.dart';

void main() {
  runApp(BookstoreApp());
}

class BookstoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bookstore',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: BookListPage(),
    );
  }
}

class BookListPage extends StatelessWidget {
  final List<Map<String, String>> books = [
    {'title': 'Flutter Basics', 'author': 'Jane Doe'},
    {'title': 'Advanced Dart', 'author': 'John Smith'},
    {'title': 'Mobile App Design', 'author': 'Alice Johnson'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookstore'),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              elevation: 4,
              child: ListTile(
                tileColor: Colors.yellow,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                title: Text(
                  books[index]['title']!,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'Author: ${books[index]['author']}',
                  style: TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Placeholder for add book functionality
          print('Add Book Clicked');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
