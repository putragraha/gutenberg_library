import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:gutenberg_library/features/book/data/models/book_results_model.dart';
import 'package:gutenberg_library/features/book/data/models/books_model.dart';
import 'package:gutenberg_library/features/book/data/models/format_model.dart';
import 'package:gutenberg_library/features/book/data/models/person_model.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {

  final BooksModel booksModel = BooksModel(
    count: 1,
    next: "http://gutendex.com/books/?page=2",
    previous: null,
    bookResultsModels: [
      BookResultsModel(
        id: 1342,
        title: "Pride and Prejudice",
        authors: const [
          PersonModel(
            name: "Austen, Jane",
            birthYear: 1775,
            deathYear: 1817 
          )
        ],
        translators: List.empty(),
        subjects: const [
          "Courtship -- Fiction",
          "Domestic fiction",
          "England -- Fiction",
          "Love stories",
          "Sisters -- Fiction",
          "Social classes -- Fiction",
          "Young women -- Fiction"
        ],
        bookshelves: const [
          "Best Books Ever Listings",
          "Harvard Classics"
        ],
        languages: const ["en"],
        copyright: false,
        mediaType: "Text",
        formats: const FormatModel(
          xMobipocketEBook: "https://www.gutenberg.org/ebooks/1342.kindle.images",
          ePubZip: "https://www.gutenberg.org/ebooks/1342.epub.images",
          rdfXml: "https://www.gutenberg.org/ebooks/1342.rdf",
          textHtmlUtf8: "https://www.gutenberg.org/files/1342/1342-h/1342-h.htm",
          textPlain: "https://www.gutenberg.org/files/1342/1342-0.txt",
          imageJpeg: "https://www.gutenberg.org/cache/epub/1342/pg1342.cover.medium.jpg",
          textHtml: "https://www.gutenberg.org/ebooks/1342.html.images"
        ),
        downloadCount: 52612
      )
    ]
  );

  test('should return a valid model from sample book.json', () async {
    // arrange
    final Map<String, dynamic> jsonMap = json.decode(fixture('book.json'));

    // act
    final result = BooksModel.fromJson(jsonMap);

    // assert
    expect(result, booksModel);
  });
}
