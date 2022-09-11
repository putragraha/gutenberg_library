import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gutenberg_library/features/book/domain/entities/book.dart';
import 'package:url_launcher/url_launcher_string.dart';

class BookDetailsPage extends StatelessWidget {
  final Book book;

  const BookDetailsPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final windowSize = MediaQuery.of(context).size;
    final author = book.authors.isNotEmpty ? book.authors.first : "";

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text("Book Details"),
          centerTitle: true,
        ),
        body: Container(
          width: windowSize.width,
          height: windowSize.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: windowSize.height / 3,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(book.imageUrl!),
                          fit: BoxFit.cover),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                      child: new Container(
                        decoration: new BoxDecoration(
                            color: Colors.white.withOpacity(0.5)),
                      ),
                    ),
                  ),
                  Image.network(
                    book.imageUrl!,
                    height: 180,
                    width: 120,
                  ),
                ],
              ),
              const SizedBox(height: 36),
              Center(
                child: Column(children: [
                  Text(
                    book.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Text(author, style: TextStyle(fontSize: 20)),
                  const SizedBox(height: 12),
                  Text("Download: ${book.downloadCount}"),
                  GestureDetector(
                    onTap: () async {
                      if (book.eBookUrl != null &&
                          await canLaunchUrlString(book.eBookUrl!)) {
                        await launchUrlString(book.eBookUrl!);
                      }
                    },
                    child: const Text(
                      "Read here",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ]),
              ),
              const SizedBox(height: 36),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Similar Books",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
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
          ),
        ));
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
