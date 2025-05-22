import 'package:example_kuima_kulak/audio_widget/audio_book_detail.dart';
import 'package:flutter/material.dart';

class AudioBook {
  final String title, imageUrl, author;

  AudioBook({
    required this.author,
    required this.imageUrl,
    required this.title,
  });
}

class AudioBookScrollWidget extends StatefulWidget {
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
  // ignore: library_private_types_in_public_api
  _AudioBookScrollWidgetState createState() => _AudioBookScrollWidgetState();
}

class _AudioBookScrollWidgetState extends State<AudioBookScrollWidget> {
  final ScrollController _scrollController =
      ScrollController(); // Контроллер для отслеживания прокрутки

  @override
  void dispose() {
    _scrollController.dispose(); // Освобождаем ресурсы контроллера
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10), // Закругление только сверху слева
        topRight: Radius.circular(10), // Закругление только сверху справа
      ), // Закругление для виджета
      child: Stack(
        children: [
          // Фоновое изображение с затемнением
          SizedBox(
            width: double.infinity,
            height: 240, // Высота фонового изображения
            child: Image.network(
              widget.backgroundImageUrl,
              fit: BoxFit.cover,
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.6), // Затемнение изображения
              colorBlendMode: BlendMode.darken,
            ),
          ),
          // Контент поверх фонового изображения
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15), // Отступы для заголовка
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title, // Заголовок
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 23, // Размер текста заголовка
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.subtitle, // Подзаголовок
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 36), // Отступ между заголовком и списком
              SizedBox(
                height: 230, // Высота списка карточек
                child: NotificationListener<ScrollNotification>(
                  // Слушатель прокрутки
                  onNotification: (scrollNotification) {
                    setState(() {}); // Обновляем состояние при прокрутке
                    return true;
                  },
                  child: ListView.builder(
                    controller: _scrollController, // Контроллер прокрутки
                    scrollDirection:
                        Axis.horizontal, // Горизонтальная прокрутка
                    itemCount: widget.books.length, // Количество карточек
                    padding: EdgeInsets.only(
                      left:
                          _scrollController.hasClients &&
                                  _scrollController.offset > 0
                              ? 0
                              : 15, // Динамический отступ слева
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          right: 15,
                        ), // Отступ между карточками
                        child: AudioBookCard(
                          book: widget.books[index],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AudioBookDetail(),
                              ),
                            );
                          },
                        ), // Карточка книги
                      );
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
  final void Function()? onTap;

  const AudioBookCard({super.key, required this.book, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // Обработка нажатия
      child: Container(
        // Карточка аудиокниги
        width: 140, // Ширина карточки
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4), // Закругленные углы
          color: Colors.white, // Цвет фона карточки
          boxShadow: [
            // Тень карточки
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // Обложка книги
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
                border: Border.all(
                  color: Colors.white,
                  width: 4,
                ), // Белая рамка вокруг обложки
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
                child: Image.network(
                  book.imageUrl, // Ссылка на изображение обложки
                  width: 140,
                  height: 150,
                  fit: BoxFit.cover, // Масштабирование изображения
                ),
              ),
            ),
            const SizedBox(height: 7), // Отступ между обложкой и текстом
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ), // Горизонтальные отступы
              child: Text(
                book.title, // Название книги
                maxLines: 2, // Ограничение по количеству строк
                overflow:
                    TextOverflow.ellipsis, // Обрезка текста при переполнении
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 4), // Отступ между названием и автором
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ), // Горизонтальные отступы
              child: Text(
                book.author, // Автор книги
                maxLines: 1, // Ограничение по количеству строк
                overflow:
                    TextOverflow.ellipsis, // Обрезка текста при переполнении
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 8), // Отступ внизу карточки
          ],
        ),
      ),
    );
  }
}

class AudioBookDetail extends StatelessWidget {
  const AudioBookDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('interesting')));
  }
}
