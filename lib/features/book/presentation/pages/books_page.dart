import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gutenberg_library/features/book/presentation/bloc/books_bloc.dart';
import 'package:gutenberg_library/features/book/presentation/widgets/book_card_list.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({super.key});

  @override
  State<StatefulWidget> createState() => _BooksPage();
}

class _BooksPage extends State<BooksPage> {

  @override
  Widget build(BuildContext context) {
    final windowSize = MediaQuery.of(context).size;

    return BlocBuilder<BooksBloc, BooksState>(
      builder: (context, state) {
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
                      padding: const EdgeInsets.only(top: 16),
                      child: BookCardList(state: state),
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
