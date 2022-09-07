import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gutenberg_library/features/book/domain/entities/book.dart';
import 'package:gutenberg_library/features/book/domain/repositories/book_repository.dart';
import 'package:gutenberg_library/features/book/domain/usecases/get_books_use_case.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../core/book_factory.dart';

class MockBookRepository extends Mock implements BookRepository {}

void main() {

  BookRepository bookRepository = MockBookRepository();

  GetBooksUseCase getBooksUseCase = GetBooksUseCase(bookRepository);

  const Params params = Params(pageNum: 1);

  List<Book> books = List.unmodifiable([
    BookFactory.newBook(withId: 1),
    BookFactory.newBook(withId: 2),
  ]);

  test('get books from bookRepository', () async {
    // arrange
    when(() => bookRepository.getBooks(params.pageNum)).thenAnswer((_) async => Future.value(Right(books)));

    // act
    final result = await getBooksUseCase(params);

    // assert
    expect(result, Right(books));
    verify(() => bookRepository.getBooks(params.pageNum)).called(1);
    verifyNoMoreInteractions(bookRepository);
  });
}
