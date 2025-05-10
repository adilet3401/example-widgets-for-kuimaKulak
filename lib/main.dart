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
      home: HomeScreen(),
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
        title: Text(
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
                  MaterialPageRoute(builder: (context) => BookDetailScreen()),
                );
              },
              books: [
                Book(
                  title: "Жамийла",
                  imagePath:
                      "assets/2161c86c80f7a224f7c973010315073b03311c65.png",
                ),
                Book(
                  title: "Жамийла",
                  imagePath:
                      "assets/b73bb67fe1adbdbdfcee000485768a5e07fc9aba.png",
                ),
                Book(
                  title: "Жамийла",
                  imagePath:
                      "assets/e04a15805bb83452d4d6a368e889834b73fb3dcb.png",
                ),
                Book(
                  title: "Жамийла",
                  imagePath:
                      "assets/e06014a98abc7dce2f3dadc70b5ffc27b8e80ef4.png",
                ),
              ],
            ),
            BookCarousel(
              title: 'Тарых',
              onSeeAll: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookDetailScreen()),
                );
              },
              books: [
                Book(
                  title: "Жамийла",
                  imagePath:
                      "assets/2161c86c80f7a224f7c973010315073b03311c65.png",
                ),
                Book(
                  title: "Жамийла",
                  imagePath:
                      "assets/b73bb67fe1adbdbdfcee000485768a5e07fc9aba.png",
                ),
                Book(
                  title: "Жамийла",
                  imagePath:
                      "assets/e04a15805bb83452d4d6a368e889834b73fb3dcb.png",
                ),
                Book(
                  title: "Жамийла",
                  imagePath:
                      "assets/e06014a98abc7dce2f3dadc70b5ffc27b8e80ef4.png",
                ),
              ],
            ),
            BookCarousel(
              title: 'Тарых',
              onSeeAll: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookDetailScreen()),
                );
              },
              books: [
                Book(
                  title: "Жамийла",
                  imagePath:
                      "assets/2161c86c80f7a224f7c973010315073b03311c65.png",
                ),
                Book(
                  title: "Жамийла",
                  imagePath:
                      "assets/b73bb67fe1adbdbdfcee000485768a5e07fc9aba.png",
                ),
                Book(
                  title: "Жамийла",
                  imagePath:
                      "assets/e04a15805bb83452d4d6a368e889834b73fb3dcb.png",
                ),
                Book(
                  title: "Жамийла",
                  imagePath:
                      "assets/e06014a98abc7dce2f3dadc70b5ffc27b8e80ef4.png",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
