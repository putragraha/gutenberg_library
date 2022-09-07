import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:gutenberg_library/core/error/failure.dart';
import 'package:gutenberg_library/core/usecase/base_use_case.dart';
import 'package:gutenberg_library/features/book/domain/repositories/book_repository.dart';

import '../entities/book.dart';

class SearchBooksUseCase extends BaseUseCase<List<Book>, Params> {

  final BookRepository bookRepository;

  SearchBooksUseCase(this.bookRepository);

  @override
  Future<Either<Failure, List<Book>>> call(Params params) async {
    return bookRepository.searchBooks(params.keyword, params.pageNum);
  }
}

class Params extends Equatable {
  
  final String keyword;

  final int pageNum;

  const Params({
    required this.keyword,
    required this.pageNum
  });
  
  @override
  List<Object?> get props => [keyword, pageNum];
}
