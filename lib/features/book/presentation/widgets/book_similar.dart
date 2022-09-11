import 'package:flutter/material.dart';
import 'package:gutenberg_library/features/book/presentation/bloc/book_details_bloc.dart';

import '../../domain/entities/book.dart';
import '../pages/book_details_page.dart';

class BookSimilar extends StatelessWidget {
  final SuccessLoadBookshelf state;

  const BookSimilar({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            "Similar Books",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              final book = state.books[index];

              if (book.imageUrl != null) {
                return GestureDetector(
                  onTap: () => _openSimilarBook(context, book),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.network(
                      book.imageUrl!,
                      height: 150,
                      width: 100,
                    ),
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ],
    );
  }

  void _openSimilarBook(BuildContext context, Book book) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookDetailsPage(book: book),
      ),
    );
  }
}
