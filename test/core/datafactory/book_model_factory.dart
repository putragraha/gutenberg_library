import 'package:gutenberg_library/features/book/data/models/book_results_model.dart';
import 'package:gutenberg_library/features/book/data/models/books_model.dart';

import 'book_results_model_factory.dart';

class BookModelFactory {
  
  static BooksModel newBooksModel({
    int withId = 1,
    String? withNext = "http://gutendex.com/books/?page=2",
    String? withPrevious,
    List<BookResultsModel>? withBookResultsModels,
  }) {
    withBookResultsModels ??= [BookResultsModelFactory.newBookResultsModel()];

    return BooksModel(
        count: withId,
        next: withNext,
        previous: withPrevious,
        bookResultsModels: withBookResultsModels,
    );
  }
}
