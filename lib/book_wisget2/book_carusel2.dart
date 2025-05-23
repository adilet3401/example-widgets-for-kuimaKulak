import 'package:flutter/material.dart';

// Глобальный список избранных книг (для простоты примера)
final List<Book2> favoriteBooks = [];

class BookCarusel2 extends StatefulWidget {
  final String sectionTitle;
  final List<Book2> books;

  const BookCarusel2({
    super.key,
    required this.sectionTitle,
    required this.books,
  });

  @override
  State<BookCarusel2> createState() => _BookCarusel2State();
}

class _BookCarusel2State extends State<BookCarusel2> {
  bool isFavorite(Book2 book) => favoriteBooks.contains(book);

  void toggleFavorite(Book2 book) {
    setState(() {
      if (isFavorite(book)) {
        favoriteBooks.remove(book);
      } else {
        favoriteBooks.add(book);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Заголовок + кнопка перехода к избранным
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Text(
                widget.sectionTitle,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.bookmark, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => FavoritesScreen()),
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.books.length,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) {
              final book = widget.books[index];
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Stack(
                  children: [
                    // Карточка книги
                    Container(
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Обложка книги
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              book.imageUrl,
                              height: 180,
                              width: 180,
                              fit: BoxFit.cover,
                              errorBuilder:
                                  (_, __, ___) =>
                                      const Icon(Icons.broken_image, size: 180),
                            ),
                          ),
                          const SizedBox(height: 10),
                          // Название книги
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Text(
                              book.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          const SizedBox(height: 2),
                          // Автор
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Text(
                              book.author,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Кнопка и звезда
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Row(
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
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 18,
                                ),
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
                          ),
                        ],
                      ),
                    ),
                    // Иконка избранного в углу
                    Positioned(
                      top: 8,
                      right: 8,
                      child: GestureDetector(
                        onTap: () => toggleFavorite(book),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            isFavorite(book)
                                ? Icons.bookmark
                                : Icons.bookmark_border,
                            color:
                                isFavorite(book) ? Colors.blue : Colors.black54,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

// Экран избранных книг
class FavoritesScreen extends StatefulWidget {
  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Избранные книги')),
      body:
          favoriteBooks.isEmpty
              ? Center(child: Text('Нет избранных книг'))
              : ListView.builder(
                itemCount: favoriteBooks.length,
                itemBuilder: (context, index) {
                  final book = favoriteBooks[index];
                  return ListTile(
                    leading: Image.network(
                      book.imageUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      errorBuilder:
                          (_, __, ___) =>
                              const Icon(Icons.broken_image, size: 50),
                    ),
                    title: Text(book.title),
                    subtitle: Text(book.author),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          favoriteBooks.remove(book);
                        });
                      },
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/bookDetail2',
                        arguments: book,
                      );
                    },
                  );
                },
              ),
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

class Book2 {
  final String title;
  final String author;
  final String imageUrl;
  final double rating;

  Book2({
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.rating,
  });

  // Для корректного сравнения книг
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Book2 &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          author == other.author &&
          imageUrl == other.imageUrl;

  @override
  int get hashCode => title.hashCode ^ author.hashCode ^ imageUrl.hashCode;
}
