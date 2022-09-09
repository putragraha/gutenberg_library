import '../../features/book/data/models/books_model.dart';
import '../../features/book/domain/entities/book.dart';

class BooksMapper {

  static List<Book> map(BooksModel booksModel) {
    return booksModel.bookResultsModels
        .map((e) => Book.fromBooksModel(e))
        .toList();
  }
}
