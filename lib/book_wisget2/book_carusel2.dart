import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final Book book;
  final VoidCallback onPlayPressed;
  final VoidCallback onBookmarkPressed;

  const BookCard({
    super.key,
    required this.book,
    required this.onPlayPressed,
    required this.onBookmarkPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Обложка и кнопка-сердечко
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset(
                  // book.imageUrl,
                  'assets/w2.png',
                  height: 200,
                  width: 224,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: onBookmarkPressed,
                  child: const Icon(
                    Icons.bookmark_border,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Название книги
          Text(
            book.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          // Автор
          Text(
            book.author,
            style: const TextStyle(color: Colors.grey),
            maxLines: 1,
          ),
          const SizedBox(height: 8),
          // Кнопка и рейтинг
          Row(
            children: [
              ElevatedButton(
                onPressed: onPlayPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text("Угуу", style: TextStyle(color: Colors.white)),
              ),
              const Spacer(),
              const Icon(Icons.star, color: Colors.amber, size: 18),
              Text(
                book.rating.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Book {
  final String title;
  final String author;
  final String imageUrl;
  final double rating;

  Book({
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.rating,
  });
}
