import 'package:gutenberg_library/features/book/data/models/books_model.dart';

abstract class BookshelfRemoteDataSource {

  /// For calling API http://gutendex.com/books?topic={bookshelf}
  /// Throws [ServerException] on issue occurred
  Future<BooksModel> open(String bookshelf, int pageNum);
}
