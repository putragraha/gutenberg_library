import 'package:flutter/material.dart';

import '../../domain/entities/book.dart';
import '../pages/book_details_page.dart';

class BookSimilar extends StatelessWidget {
  final Book book;

  const BookSimilar({super.key, required this.book});

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
            itemCount: 20,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => _openSimilarBook(context),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.network(
                  book.imageUrl!,
                  height: 150,
                  width: 100,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _openSimilarBook(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookDetailsPage(book: book),
      ),
    );
  }
}
