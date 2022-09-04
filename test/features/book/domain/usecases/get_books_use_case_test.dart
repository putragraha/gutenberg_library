import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gutenberg_library/features/book/domain/entities/book.dart';
import 'package:gutenberg_library/features/book/domain/repositories/book_repository.dart';
import 'package:gutenberg_library/features/book/domain/usecases/get_books_use_case.dart';
import 'package:mocktail/mocktail.dart';

class MockBookRepository extends Mock implements BookRepository {}

void main() {

  BookRepository bookRepository = MockBookRepository();

  GetBooksUseCase getBooksUseCase = GetBooksUseCase(bookRepository);

  const pageNum = 1;

  List<String> bookshelves =
      List.unmodifiable(["bookshelve 1", "bookshelve 2"]);

  List<String> authors = List.unmodifiable(["author 1", "author 2"]);

  List<Book> books = List.unmodifiable([
    Book(
        id: 1,
        title: "title 1",
        authors: authors,
        imageUrl: "imageUrl 1",
        downloadCount: 1,
        eBookUrl: "eBookUrl 1",
        bookshelves: bookshelves),
    Book(
        id: 2,
        title: "title 2",
        authors: authors,
        imageUrl: "imageUrl 2",
        downloadCount: 2,
        eBookUrl: "eBookUrl 2",
        bookshelves: bookshelves),
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
