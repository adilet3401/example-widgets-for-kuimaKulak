import 'package:flutter/material.dart';

class AudioBook {
  final String title, imageUrl, author;

  AudioBook({
    required this.author,
    required this.imageUrl,
    required this.title,
  });
}

class AudioBookScrollWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<AudioBook> books;
  final String backgroundImageUrl;

  const AudioBookScrollWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.books,
    required this.backgroundImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          // Фоновое изображение с затемнением
          SizedBox(
            width: double.infinity,
            height: 280,
            child: Image.network(
              backgroundImageUrl,
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.6),
              colorBlendMode: BlendMode.darken,
            ),
          ),
          // Контент поверх
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.white70, fontSize: 16),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 220,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: books.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      return AudioBookCard(book: books[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AudioBookCard extends StatelessWidget {
  final AudioBook book;

  const AudioBookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              book.imageUrl,
              width: 140,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8),
          Text(
            book.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(),
          ),
          SizedBox(height: 4),
          Text(book.author, style: TextStyle()),
        ],
      ),
    );
  }
}
