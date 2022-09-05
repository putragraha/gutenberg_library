import 'package:dartz/dartz.dart';
import 'package:gutenberg_library/core/error/failure.dart';
import 'package:gutenberg_library/features/book/domain/repositories/book_repository.dart';

import '../entities/book.dart';

class SearchBooksUseCase {

  final BookRepository bookRepository;

  const SearchBooksUseCase(this.bookRepository);

  Future<Either<Failure, List<Book>>> call(String keyword) async {
    return bookRepository.searchBooks(keyword);
  }
}
