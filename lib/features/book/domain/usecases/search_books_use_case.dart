import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:gutenberg_library/core/error/failure.dart';
import 'package:gutenberg_library/core/usecase/base_use_case.dart';
import 'package:gutenberg_library/features/book/domain/repositories/book_repository.dart';

import '../entities/book.dart';

class SearchBooksUseCase extends BaseUseCase<List<Book>, SearchBooksParams> {

  final BookRepository bookRepository;

  SearchBooksUseCase(this.bookRepository);

  @override
  Future<Either<Failure, List<Book>>> call(SearchBooksParams params) async {
    return bookRepository.searchBooks(params.keyword, params.pageNum);
  }
}

class SearchBooksParams extends Equatable {
  
  final String keyword;

  final int pageNum;

  const SearchBooksParams({
    required this.keyword,
    required this.pageNum
  });
  
  @override
  List<Object?> get props => [keyword, pageNum];
}
