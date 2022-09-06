import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gutenberg_library/features/book/domain/entities/book.dart';
import 'package:gutenberg_library/features/book/domain/repositories/bookshelf_repository.dart';
import 'package:gutenberg_library/features/book/domain/usecases/open_bookshelf_use_case.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../core/book_factory.dart';

class MockBookshelfRepository extends Mock implements BookshelfRepository {}

void main() {

  BookshelfRepository bookshelfRepository = MockBookshelfRepository();

  OpenBookshelfUseCase openBookshelfUseCase = OpenBookshelfUseCase(bookshelfRepository);

  List<Book> books = List.unmodifiable([
    BookFactory.newBook(withId: 1),
    BookFactory.newBook(withId: 2),
  ]);

  test('open bookshelf from bookRepository', () async {
    // arrange
    String bookshelf = "bookshelf";
    when(() => bookshelfRepository.open(bookshelf)).thenAnswer((_) async => Future.value(Right(books)));

    // act
    final result = await openBookshelfUseCase(bookshelf);

    // assert
    expect(result, Right(books));
    verify(() => bookshelfRepository.open(bookshelf)).called(1);
    verifyNoMoreInteractions(bookshelfRepository);
  });
}
