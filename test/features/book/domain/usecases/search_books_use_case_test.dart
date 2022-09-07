import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gutenberg_library/features/book/domain/entities/book.dart';
import 'package:gutenberg_library/features/book/domain/repositories/book_repository.dart';
import 'package:gutenberg_library/features/book/domain/usecases/search_books_use_case.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../core/datafactory/book_factory.dart';

class MockBookRepository extends Mock implements BookRepository {}

void main() {
  BookRepository bookRepository = MockBookRepository();

  SearchBooksUseCase searchBooksUseCase = SearchBooksUseCase(bookRepository);

  List<Book> books = List.unmodifiable([
    BookFactory.newBook(withId: 1),
    BookFactory.newBook(withId: 2),
  ]);

  test('search books from bookRepository', () async {
    // arrange
    final params = Params(keyword: "keyword", pageNum: 1);
    when(() => bookRepository.searchBooks(any(), any()))
        .thenAnswer((_) async => Future.value(Right(books)));

    // act
    final result = await searchBooksUseCase(params);

    // assert
    expect(result, Right(books));
    verify(() => bookRepository.searchBooks(params.keyword, params.pageNum)).called(1);
    verifyNoMoreInteractions(bookRepository);
  });
}
