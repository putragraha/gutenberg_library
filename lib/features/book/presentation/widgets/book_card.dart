import 'package:flutter/material.dart';
import 'package:gutenberg_library/features/book/presentation/pages/book_details_page.dart';

import '../../domain/entities/book.dart';

class BookCard extends StatelessWidget {
  final Book book;

  const BookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final author = book.authors.isNotEmpty ? book.authors.first : "";

    return GestureDetector(
      onTap: () => _goToBookDetailsPage(context),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              if (book.imageUrl != null)
                Image.network(
                  book.imageUrl!,
                  width: 60,
                  height: 90,
                ),
              // ignore: prefer_const_constructors
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        overflow: TextOverflow.ellipsis,
                        book.title,
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        overflow: TextOverflow.ellipsis,
                        author,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _goToBookDetailsPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookDetailsPage(book: book),
      ),
    );
  }
}
