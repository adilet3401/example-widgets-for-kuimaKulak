import 'package:example_kuima_kulak/book_widget1/book_in_screen1.dart';
import 'package:example_kuima_kulak/book_widget1/books_carusel1.dart'
    as widget1;
import 'package:example_kuima_kulak/book_wisget2/book_carusel2.dart' as widget2;
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
      home: const HomeScreen(),
      routes: {'/bookDetail': (context) => const BookDetailScreen()},
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text(
          'Китептер',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.grey.shade700,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            widget1.BookCarousel(
              title: 'Тарых',
              onSeeAll: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BookDetailScreen(),
                  ),
                );
              },
              books: [
                widget1.Book(title: "Жамийла", imageUrl: ""),
                widget1.Book(title: "Жамийла 2", imageUrl: ""),
                widget1.Book(title: "Жамийла 3", imageUrl: ""),
                widget1.Book(title: "Жамийла 4", imageUrl: ""),
              ],
            ),
            SizedBox(height: 20),
            widget2.BookCard(
              book: widget2.Book(
                title: 'Green Mile',
                imageUrl: 'assets/2161c86c80f7a224f7c973010315073b03311c65.png',
                author: '',
                rating: 3,
              ),
              onPlayPressed: () {},
              onBookmarkPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
