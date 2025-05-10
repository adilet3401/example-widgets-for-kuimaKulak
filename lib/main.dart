import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomeScreen(),
    );
  }
}

class Book {
  final String title;
  final String imageUrl;

  Book({required this.title, required this.imageUrl});
}

class BookListWidget extends StatelessWidget {
  final List<Book> books;

  const BookListWidget({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: books.length,

        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Container(
                  width: 120,
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(books[index].imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'бардыгы',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Book> books1 = [
    Book(title: "House of Stars", imageUrl: "https://via.placeholder.com/150"),
    Book(title: "Jil", imageUrl: "https://via.placeholder.com/150"),
    Book(title: "A Sip of Sunset", imageUrl: "https://via.placeholder.com/150"),
  ];

  final List<Book> books2 = [
    Book(title: "Sunset", imageUrl: "https://via.placeholder.com/150"),
    Book(title: "Another Book", imageUrl: "https://via.placeholder.com/150"),
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("ХАҢЫ КІТЕПТЕР"),
            Text("барлығы", style: TextStyle(fontSize: 16, color: Colors.grey)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            BookListWidget(books: books1),
            SizedBox(height: 16),
            BookListWidget(books: books2),
          ],
        ),
      ),
    );
  }
}
