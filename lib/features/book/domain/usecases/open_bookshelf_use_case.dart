import 'package:dartz/dartz.dart';
import 'package:gutenberg_library/features/book/domain/entities/book.dart';
import 'package:gutenberg_library/features/book/domain/repositories/bookshelf_repository.dart';

import '../../../../core/error/failure.dart';

class OpenBookshelfUseCase {

  final BookshelfRepository bookshelfRepository;

  const OpenBookshelfUseCase(this.bookshelfRepository);

  Future<Either<Failure, List<Book>>> call(String bookshelf) async {
    return bookshelfRepository.open(bookshelf);
  }
}
