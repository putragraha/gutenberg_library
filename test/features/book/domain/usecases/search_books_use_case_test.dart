import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gutenberg_library/features/book/domain/entities/book.dart';
import 'package:gutenberg_library/features/book/domain/repositories/book_repository.dart';
import 'package:gutenberg_library/features/book/domain/usecases/search_books_use_case.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../core/book_builder.dart';

class MockBookRepository extends Mock implements BookRepository {}

void main() {
  BookRepository bookRepository = MockBookRepository();

  SearchBooksUseCase searchBooksUseCase = SearchBooksUseCase(bookRepository);

  List<Book> books = List.unmodifiable([
    BookBuilder().setId(1).build(),
    BookBuilder().setId(2).build(),
  ]);

  test('search books from repository', () async {
    // arrange
    String keyword = "katakunci";
    when(() => bookRepository.searchBooks(any()))
        .thenAnswer((_) async => Future.value(Right(books)));

    // act
    final result = await searchBooksUseCase(keyword);

    // assert
    expect(result, Right(books));
    verify(() => bookRepository.searchBooks(keyword)).called(1);
    verifyNoMoreInteractions(bookRepository);
  });
}
