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
          return ListTile(
            title: Text(books[index]['title']!),
            subtitle: Text('Author: ${books[index]['author']}'),
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
