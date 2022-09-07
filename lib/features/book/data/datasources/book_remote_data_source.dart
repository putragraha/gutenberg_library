import 'package:gutenberg_library/features/book/data/models/books_model.dart';

abstract class BookRemoteDataSource {

  /// For calling API http://gutendex.com/books
  /// Throws [ServerException] on issue occurred
  Future<BooksModel> getBooks(int pageNum);

  /// For calling API http://gutendex.com/books?search=dickens%20great
  /// Throws [ServerException] on issue occurred
  Future<BooksModel> searchBooks(String keyword, int pageNum);
}
