// import 'package:example_kuima_kulak/main.dart';
import 'package:flutter/material.dart';

class BookCarousel extends StatelessWidget {
  final String title;
  final VoidCallback onSeeAll;
  final List<Book> books;

  const BookCarousel({
    super.key,
    required this.title,
    required this.onSeeAll,
    required this.books,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Заголовок и "бардыгы"
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextButton(
                onPressed: onSeeAll,
                child: const Text(
                  "бардыгы",
                  style: TextStyle(
                    color: Color(0xff3E424A),
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        // Горизонтальный скролл
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: books.length,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemBuilder: (context, index) {
              final book = books[index];
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/bookDetail', arguments: book);
                },
                child: Container(
                  width: 120,
                  margin: const EdgeInsets.only(right: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          book.imagePath,
                          height: 160,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(book.title, style: const TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class Book {
  final String title;
  final String imagePath;

  Book({required this.title, required this.imagePath});
}
