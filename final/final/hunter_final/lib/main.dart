import 'package:flutter/material.dart';
import 'dart:convert'; 
import 'package:http/http.dart' as http;

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

class BookListPage extends StatefulWidget {
  final bool isDarkTheme;
  final VoidCallback toggleTheme;

  const BookListPage({
    Key? key,
    required this.isDarkTheme,
    required this.toggleTheme,
  }) : super(key: key);

  @override
  _BookListPageState createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  List<Map<String, String>> books = [
    {'title': 'Flutter Basics', 'author': 'Jane Doe'},
    {'title': 'Advanced Dart', 'author': 'John Smith'},
    {'title': 'Mobile App Design', 'author': 'Alice Johnson'},
  ];

  @override
  void initState() {
    super.initState();
    fetchBooks(); // Fetch books when the widget is created
  }

  // Fetch books from the backend
  Future<void> fetchBooks() async {
    try {
      final response = await http.get(Uri.parse('http://localhost:8080/getBooks')); // Replace with your backend URL
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        setState(() {
          books = data.map((item) => {
                'title': item['title'] as String,
                'author': item['author'] as String,
              }).toList();
        });
      } else {
        throw Exception('Failed to fetch books');
      }
    } catch (e) {
      print('Error fetching books: $e');
    }
  }

  Future<void> addBook(String title, String author) async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost:8080/addBook'), // Replace with your backend URL
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'title': title, 'author': author}),
      );
      if (response.statusCode == 200) {
        await fetchBooks(); // Reload the book list
      } else {
        throw Exception('Failed to add book');
      }
    } catch (e) {
      print('Error adding book: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookstore'),
        actions: [
          IconButton(
            icon: Icon(
              widget.isDarkTheme ? Icons.wb_sunny : Icons.nights_stay,
            ),
            onPressed: widget.toggleTheme, // Toggle theme when pressed
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
