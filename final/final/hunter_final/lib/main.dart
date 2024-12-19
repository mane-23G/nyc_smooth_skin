import 'package:flutter/material.dart';

void main() {
  runApp(BookstoreApp());
}

class BookstoreApp extends StatefulWidget {
  @override
  _BookstoreAppState createState() => _BookstoreAppState();
}


class _BookstoreAppState extends State<BookstoreApp> {
  bool isDarkTheme = false; // Track the current theme state

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bookstore',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light, // Apply theme
      home: BookListPage(
        isDarkTheme: isDarkTheme,
        toggleTheme: toggleTheme,
      ),
    );
  }

  void toggleTheme() {
    setState(() {
      isDarkTheme = !isDarkTheme; // Toggle theme state
    });
  }
}

class BookListPage extends StatelessWidget {
  final bool isDarkTheme;
  final VoidCallback toggleTheme;

   BookListPage({
    super.key,
    required this.isDarkTheme,
    required this.toggleTheme,
  });
  
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
        actions: [
          IconButton(
            icon: Icon(
              isDarkTheme ? Icons.wb_sunny : Icons.nights_stay,
            ),
            onPressed: toggleTheme, // Toggle theme when pressed
          ),
        ],
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
                tileColor: Colors.purple.shade200,
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
