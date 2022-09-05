import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gutenberg_library/features/book/domain/entities/book.dart';
import 'package:gutenberg_library/features/book/domain/repositories/book_repository.dart';
import 'package:gutenberg_library/features/book/domain/usecases/search_books_use_case.dart';
import 'package:mocktail/mocktail.dart';

class MockBookRepository extends Mock implements BookRepository {}

void main() {
  BookRepository bookRepository = MockBookRepository();

  SearchBooksUseCase searchBooksUseCase = SearchBooksUseCase(bookRepository);

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
