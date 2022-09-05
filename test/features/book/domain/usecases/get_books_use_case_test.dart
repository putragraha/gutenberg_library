import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gutenberg_library/features/book/domain/entities/book.dart';
import 'package:gutenberg_library/features/book/domain/repositories/book_repository.dart';
import 'package:gutenberg_library/features/book/domain/usecases/get_books_use_case.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../core/book_builder.dart';

class MockBookRepository extends Mock implements BookRepository {}

void main() {

  BookRepository bookRepository = MockBookRepository();

  GetBooksUseCase getBooksUseCase = GetBooksUseCase(bookRepository);

  const pageNum = 1;

  List<Book> books = List.unmodifiable([
    BookBuilder().setId(1).build(),
    BookBuilder().setId(2).build(),
  ]);

  test('get books from bookRepository', () async {
    // arrange
    when(() => bookRepository.getBooks(pageNum)).thenAnswer((_) async => Future.value(Right(books)));

    // act
    final result = await getBooksUseCase(pageNum);

    // assert
    expect(result, Right(books));
    verify(() => bookRepository.getBooks(pageNum)).called(1);
    verifyNoMoreInteractions(bookRepository);
  });
}
