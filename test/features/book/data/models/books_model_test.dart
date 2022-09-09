import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:gutenberg_library/features/book/data/models/books_model.dart';

import '../../../../core/datafactory/books_model_factory.dart';
import '../../../../fixtures/fixture_reader.dart';

void main() {

  test('should return a valid model from sample book.json', () async {
    // arrange
    final Map<String, dynamic> jsonMap = json.decode(fixture('book.json'));

    // act
    final result = BooksModel.fromJson(jsonMap);

    // assert
    expect(result, BooksModelFactory.newBooksModel());
  });
}
