import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gutenberg_library/features/book/presentation/pages/book_details_page.dart';

import '../../domain/entities/book.dart';

class BookCard extends StatefulWidget {
  final Book book;

  const BookCard({super.key, required this.book});

  @override
  State<StatefulWidget> createState() => _BookCard();
}

class _BookCard extends State<BookCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _goToBookDetailsPage(),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              if (widget.book.imageUrl != null)
                Image.network(
                  widget.book.imageUrl!,
                  width: 60,
                  height: 90,
                ),
              // ignore: prefer_const_constructors
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  Text(
                    widget.book.title,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    widget.book.authors.first,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _goToBookDetailsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookDetailsPage(book: widget.book),
      ),
    );
  }
}
