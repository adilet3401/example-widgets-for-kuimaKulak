import 'package:example_kuima_kulak/book_in_screen.dart';
import 'package:example_kuima_kulak/books_carusel.dart';
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
            BookCarousel(
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
                Book(title: "Жамийла", imageUrl: ""),
                Book(title: "Жамийла 2", imageUrl: ""),
                Book(title: "Жамийла 3", imageUrl: ""),
                Book(title: "Жамийла 4", imageUrl: ""),
              ],
            ),
            BookCarousel(
              title: 'Романдар',
              onSeeAll: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BookDetailScreen(),
                  ),
                );
              },
              books: [
                Book(title: "Роман 1", imageUrl: ""),
                Book(title: "Роман 2", imageUrl: ""),
                Book(title: "Роман 3", imageUrl: ""),
                Book(title: "Роман 4", imageUrl: ""),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
