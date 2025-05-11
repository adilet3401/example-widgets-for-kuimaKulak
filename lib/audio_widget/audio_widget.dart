import 'package:flutter/material.dart';

class AudioBook {
  final String title, imageUrl, author;

  AudioBook({
    required this.author,
    required this.imageUrl,
    required this.title,
  });
}

class AudioScrollWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<AudioBook> books;

  const AudioScrollWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.books,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Заголовок
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Text(title, style: TextStyle()),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Text(subtitle, style: TextStyle()),
        ),
      ],
    );
  }
}
