import 'package:dartz/dartz.dart';
import 'package:gutenberg_library/core/error/failure.dart';
import 'package:gutenberg_library/features/book/domain/entities/book.dart';

abstract class BookRepository {

  Future<Either<Failure, List<Book>>> getBooks(int pageNum);
}
