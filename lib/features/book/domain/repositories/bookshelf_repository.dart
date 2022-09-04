import 'package:dartz/dartz.dart';
import 'package:gutenberg_library/features/book/domain/entities/book.dart';

import '../../../../core/error/failure.dart';

abstract class BookshelfRepository {

  Future<Either<Failure, List<Book>>> open(String bookshelf);
}
