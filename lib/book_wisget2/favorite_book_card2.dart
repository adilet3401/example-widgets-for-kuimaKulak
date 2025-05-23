// import 'package:example_kuima_kulak/book_wisget2/book_carusel2.dart';
// import 'package:flutter/material.dart';

// class FavoriteBookCard extends StatelessWidget {
//   final String title;
//   final String author;
//   final String imageUrl;
//   final double rating;
//   final VoidCallback onRead;
//   final VoidCallback onRemove;

//   const FavoriteBookCard({
//     super.key,
//     required this.title,
//     required this.author,
//     required this.imageUrl,
//     required this.rating,
//     required this.onRead,
//     required this.onRemove,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.all(12),
//         child: Row(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(6),
//               child: Image.network(
//                 imageUrl,
//                 width: 80,
//                 height: 100,
//                 fit: BoxFit.cover,
//                 errorBuilder:
//                     (_, __, ___) => const Icon(Icons.broken_image, size: 80),
//               ),
//             ),
//             const SizedBox(width: 16),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                     style: const TextStyle(
//                       fontWeight: FontWeight.w600,
//                       fontSize: 16,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     author,
//                     style: const TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.black,
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   Row(
//                     children: [
//                       ElevatedButton(
//                         onPressed: onRead,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: const Color(0xff0284C7),
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 18,
//                             vertical: 8,
//                           ),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                         ),
//                         child: const Text(
//                           "Угуу",
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                       const Spacer(),
//                       const Icon(Icons.star, color: Colors.amber, size: 20),
//                       const SizedBox(width: 4),
//                       Text(
//                         rating.toStringAsFixed(1),
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.amber,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             IconButton(
//               icon: const Icon(Icons.close, color: Colors.black54),
//               onPressed: onRemove,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class FavoritesScreen extends StatelessWidget {
//   final List<Book2> favoriteBooks;

//   const FavoritesScreen({super.key, required this.favoriteBooks});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Тандалгандар')),
//       body: ListView.builder(
//         itemCount: favoriteBooks.length,
//         itemBuilder: (context, index) {
//           final book = favoriteBooks[index];
//           return FavoriteBookCard(
//             title: book.title,
//             author: book.author,
//             imageUrl: book.imageUrl,
//             rating: book.rating,
//             onRead: () {
//               Navigator.pushNamed(context, '/bookDetail2', arguments: book);
//             },
//             onRemove: () {
//               // Добавьте логику удаления из избранного
//             },
//           );
//         },
//       ),
//     );
//   }
// }
