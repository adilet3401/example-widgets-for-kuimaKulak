import 'package:example_kuima_kulak/book_model.dart';
import 'package:flutter/material.dart';

class BookCarusel2 extends StatelessWidget {
  final String sectionTitle;
  final List<Book2> books;

  const BookCarusel2({
    super.key,
    required this.sectionTitle,
    required this.books,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Заголовок
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            sectionTitle,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 12), //расстояние между заголовком и обложкой
        // Горизонтальный список карточек
        SizedBox(
          height: 300, // Высота карточки
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: books.length,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) {
              final book = books[index];
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: SizedBox(
                  width: 180, // Ширина карточки
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Обложка книги
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.network(
                          book.imageUrl,
                          height: 180, // Квадратная форма
                          width: 180,
                          fit: BoxFit.cover,
                          errorBuilder:
                              (_, __, ___) =>
                                  const Icon(Icons.broken_image, size: 180),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Название книги
                      Text(
                        book.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 2),
                      // Автор
                      Text(
                        book.author,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Кнопка и звезда
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                '/bookDetail2',
                                arguments: book,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              backgroundColor: Color(0xff0284C7),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Text(
                              "Угуу",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          const Spacer(),
                          const Icon(Icons.star, color: Colors.amber, size: 18),
                          const SizedBox(width: 2),
                          Text(
                            book.rating.toStringAsFixed(1),
                            style: const TextStyle(
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
            },
          ),
        ),
      ],
    );
  }
}



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
