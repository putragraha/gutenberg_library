import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gutenberg_library/features/book/presentation/bloc/books_bloc.dart';
import 'package:gutenberg_library/features/book/presentation/widgets/book_card_list.dart';

import '../../../../injection_container.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({super.key});

  @override
  State<StatefulWidget> createState() => _BooksPage();
}

class _BooksPage extends State<BooksPage> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final windowSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Books"),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => sl<BooksBloc>()..add(GetAllBooks()),
        child: BlocBuilder<BooksBloc, BooksState>(
          builder: (context, state) {
            return Container(
              height: windowSize.height,
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      GestureDetector(
                        child: const Icon(Icons.search),
                        onTap: () => context
                            .read<BooksBloc>()
                            .add(SearchBook(searchController.text)),
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: TextField(
                          controller: searchController,
                          decoration: const InputDecoration(
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
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
