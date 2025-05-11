import 'package:example_kuima_kulak/book_model.dart';
import 'package:flutter/material.dart';

// class Book {
//   final String title;
//   final String author;
//   final String imageUrl;
//   final double rating;

//   Book({
//     required this.title,
//     required this.author,
//     required this.imageUrl,
//     required this.rating,
//   });
// }

class BookDetailScreen2 extends StatelessWidget {
  const BookDetailScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    final book = ModalRoute.of(context)!.settings.arguments as Book2;

    return Scaffold(
      appBar: AppBar(title: Text(book.author)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  book.imageUrl,
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.broken_image, size: 200);
                  },
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              book.title,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8),
            Text(
              book.author,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber),
                SizedBox(width: 4),
                Text(
                  book.rating.toStringAsFixed(1),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
