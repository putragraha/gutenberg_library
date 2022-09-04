import 'package:dartz/dartz.dart';
import 'package:gutenberg_library/core/error/failure.dart';
import 'package:gutenberg_library/features/book/domain/entities/book.dart';
import 'package:gutenberg_library/features/book/domain/repositories/book_repository.dart';

class GetBooksUseCase {

  final BookRepository bookRepository;

  const GetBooksUseCase(this.bookRepository);

  Future<Either<Failure, List<Book>>> call(int pageNum) async {
    return bookRepository.getBooks(pageNum);
  }
}
