import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gutenberg_library/features/book/domain/entities/book.dart';
import 'package:gutenberg_library/features/book/presentation/widgets/book_card.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({super.key});

  @override
  State<StatefulWidget> createState() => _BooksPage();
}

class _BooksPage extends State<BooksPage> {
  final items = const [
    Book(
      id: 1,
      title: "Title 1",
      authors: ["Penulis 1"],
      downloadCount: 1,
      bookshelves: [],
      imageUrl:
          "https://www.gutenberg.org/cache/epub/1342/pg1342.cover.medium.jpg",
      eBookUrl: "https://www.gutenberg.org/files/1342/1342-h/1342-h.htm",
    ),
    Book(
      id: 2,
      title: "Title 2",
      authors: ["Penulis 2"],
      downloadCount: 1,
      bookshelves: [],
      imageUrl:
          "https://www.gutenberg.org/cache/epub/1342/pg1342.cover.medium.jpg",
      eBookUrl: "https://www.gutenberg.org/files/1342/1342-h/1342-h.htm",
    ),
    Book(
      id: 3,
      title: "Title 3",
      authors: ["Penulis 3"],
      downloadCount: 1,
      bookshelves: [],
      imageUrl:
          "https://www.gutenberg.org/cache/epub/1342/pg1342.cover.medium.jpg",
      eBookUrl: "https://www.gutenberg.org/files/1342/1342-h/1342-h.htm",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final windowSize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Books"),
          centerTitle: true,
        ),
        body: Container(
          height: windowSize.height,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Icon(Icons.search),
                  // ignore: prefer_const_constructors
                  Expanded(
                      // ignore: prefer_const_constructors
                      child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: const TextField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: 'Search',
                      ),
                    ),
                  ))
                ],
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.only(top: 16),
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: items.length,
                    itemBuilder: ((context, index) {
                      final item = items[index];

                      return BookCard(book: item);
                    })),
              ))
            ],
          ),
        ));
  }
}
