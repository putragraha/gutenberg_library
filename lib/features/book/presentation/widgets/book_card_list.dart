import 'package:flutter/material.dart';
import 'package:gutenberg_library/features/book/presentation/bloc/books_bloc.dart';

import 'book_card.dart';

class BookCardList extends StatelessWidget {
  final BooksState state;

  const BookCardList({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    if (state is SuccessGetBooks) {
      final successGetBooks = state as SuccessGetBooks;

      return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: successGetBooks.books.length,
        itemBuilder: (context, index) {
          final item = successGetBooks.books[index];

          return BookCard(book: item);
        },
      );
    } else if (state is LoadingBooks) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is EmptyBooks) {
      return const Text("No books found...");
    } else {
      return const Text("Something went wrong. Please try again later...");
    }
  }
}
