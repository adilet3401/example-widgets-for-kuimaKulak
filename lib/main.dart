import 'package:example_kuima_kulak/audio_widget/audio_widget.dart';
import 'package:example_kuima_kulak/book_model.dart';
import 'package:example_kuima_kulak/book_widget1/book_in_screen1.dart';
import 'package:example_kuima_kulak/book_widget1/books_carusel1.dart'
    as widget1;
import 'package:example_kuima_kulak/book_wisget2/book_carusel2.dart' as widget2;
import 'package:example_kuima_kulak/book_wisget2/book_in_screen2.dart';
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
      routes: {
        '/bookDetail1': (context) => const BookDetailScreen1(),
        '/bookDetail2': (context) => BookDetailScreen2(),
      },
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
                    builder: (context) => const BookDetailScreen1(),
                  ),
                );
              },
              books: [
                widget1.Book(
                  title: "Green Mile",
                  imageUrl:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWEZnYYvwPxS_EPf8g-ne8mnAVmu1som0H0A&s",
                ),
                widget1.Book(
                  title: "Dune",
                  imageUrl:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSu511u3XIsfgiDwiW8pvzeBqC2VKML-tkPXA&s",
                ),
                widget1.Book(
                  title: "Game of thrones",
                  imageUrl:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiCtTwp9bSRc7VltVNvfhXkbJCS0Kc8b3jtA&s",
                ),
                widget1.Book(
                  title: "Lord of the rings",
                  imageUrl:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEmIRwGWSmUR9IBb1PiCqmX8YBsUOS-3C18A&s",
                ),
              ],
            ),
            widget2.BookCarusel2(
              sectionTitle: 'Ден соолук', //заголовок
              books: [
                Book2(
                  title: 'Название',
                  author: 'Автор',
                  imageUrl:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRt7IvaU-lDY_jW7lKzJppZUnrpZVolruYh0g&s',
                  rating: 5,
                ),
                Book2(
                  title: 'Название',
                  author: 'Автор',
                  imageUrl: 'https://avidreaders.ru/pics/4/5/1245.jpg',
                  rating: 5,
                ),
                Book2(
                  title: 'Название',
                  author: 'Author',
                  imageUrl:
                      'https://upload.wikimedia.org/wikipedia/ru/4/49/Game_of_Thrones.jpg',
                  rating: 5,
                ),
                Book2(
                  title: 'Nazvanie',
                  author: 'Author',
                  imageUrl: 'https://i.ytimg.com/vi/Dz2sT_o2KGQ/hqdefault.jpg',
                  rating: 5,
                ),
              ],
            ),
            AudioBookScrollWidget(
              title: 'Жаңы аудио китептер \n7-13 апрельде',
              subtitle: '80 китеп',
              backgroundImageUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2MTdAbmZlaf0Upgxi8XQj6pB34fo7bwtQyQ&s',
              books: [
                AudioBook(
                  author: 'А.Туракулова',
                  imageUrl:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOoU3afWI3fih9ZO0Fuo1Y8NtLZK97vMSeNw&s',
                  title: 'Баламды кантип тарбиялайм?',
                ),
                AudioBook(
                  author: 'А.Туракулова',
                  imageUrl:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOoU3afWI3fih9ZO0Fuo1Y8NtLZK97vMSeNw&s',
                  title: 'Баламды кантип тарбиялайм?',
                ),
                AudioBook(
                  author: 'А.Туракулова',
                  imageUrl:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOoU3afWI3fih9ZO0Fuo1Y8NtLZK97vMSeNw&s',
                  title: 'Баламды кантип тарбиялайм?',
                ),
                AudioBook(
                  author: 'А.Туракулова',
                  imageUrl:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOoU3afWI3fih9ZO0Fuo1Y8NtLZK97vMSeNw&s',
                  title: 'Баламды кантип тарбиялайм?',
                ),
              ],
            ),
            SizedBox(height: 200),
          ],
        ),
      ),
    );
  }
}
