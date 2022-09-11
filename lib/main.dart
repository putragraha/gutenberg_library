import 'package:flutter/material.dart';
import 'package:gutenberg_library/features/book/presentation/pages/books_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const GutenbergLibrary());
}

class GutenbergLibrary extends StatelessWidget {
  const GutenbergLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gutenberg Library',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BooksPage(),
    );
  }
}
