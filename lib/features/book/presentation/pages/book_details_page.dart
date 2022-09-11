import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gutenberg_library/features/book/domain/entities/book.dart';
import 'package:gutenberg_library/features/book/presentation/bloc/book_details_bloc.dart';
import 'package:gutenberg_library/features/book/presentation/widgets/book_similar.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../injection_container.dart';

class BookDetailsPage extends StatelessWidget {
  final Book book;

  const BookDetailsPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final firstBookshelf =
        book.bookshelves.isNotEmpty ? book.bookshelves.first : "";
    final windowSize = MediaQuery.of(context).size;
    final author = book.authors.isNotEmpty ? book.authors.first : "";

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Book Details"),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) =>
            sl<BookDetailsBloc>()..add(LoadBookshelf(firstBookshelf)),
        child: BlocBuilder<BookDetailsBloc, BookDetailsState>(
          builder: (context, state) {
            return SizedBox(
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
                          child: Container(
                            decoration: BoxDecoration(
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(children: [
                        Text(
                          overflow: TextOverflow.ellipsis,
                          book.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          author,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(height: 20),
                        Text("Download: ${book.downloadCount}"),
                        const SizedBox(height: 4),
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
                  ),
                  const SizedBox(height: 36),
                  if (state is SuccessLoadBookshelf) BookSimilar(state: state)
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
