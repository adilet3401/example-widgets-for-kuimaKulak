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
            height: 240,
            child: Image.network(
              backgroundImageUrl,
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.6),
              colorBlendMode: BlendMode.darken,
            ),
          ),
          // Контент поверх
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(15),
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
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              // Text(
              //   title,
              //   style: const TextStyle(
              //     color: Colors.white,
              //     fontSize: 22,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              // Text(
              //   subtitle,
              //   style: const TextStyle(color: Colors.white70, fontSize: 16),
              // ),
              const SizedBox(height: 36),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SizedBox(
                  height: 230,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: books.length,
                    padding: EdgeInsets.zero,
                    separatorBuilder: (_, __) => const SizedBox(width: 14),
                    itemBuilder: (context, index) {
                      return AudioBookCard(book: books[index]);
                    },
                  ),
                ),
              ),
            ],
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
    return Container(
      width: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Обложка книги с рамкой
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
              ),
              border: Border.all(
                color: Colors.white, // Цвет рамки
                width: 4, // Толщина рамки
              ),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Image.network(
                    book.imageUrl,
                    width: 140,
                    height: 146,
                    fit: BoxFit.cover,
                  ),
                ),
                // Полупрозрачный фон
                // Positioned.fill(
                //   child: Container(
                //     decoration: BoxDecoration(
                //       gradient: LinearGradient(
                //         colors: [
                //           Colors.black.withOpacity(0.6),
                //           Colors.transparent,
                //         ],
                //         // begin: Alignment.bottomCenter,
                //         // end: Alignment.topCenter,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // Название книги
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              book.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 4),
          // Автор книги
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              book.author,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 10, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
