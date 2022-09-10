import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:gutenberg_library/core/error/failure.dart';
import 'package:gutenberg_library/core/usecase/base_use_case.dart';
import 'package:gutenberg_library/features/book/domain/entities/book.dart';
import 'package:gutenberg_library/features/book/domain/repositories/book_repository.dart';

class GetBooksUseCase extends BaseUseCase<List<Book>, GetBooksParams> {

  final BookRepository bookRepository;

  GetBooksUseCase(this.bookRepository);

  @override
  Future<Either<Failure, List<Book>>> call(GetBooksParams params) async {
    return bookRepository.getBooks(params.pageNum);
  }
}

class GetBooksParams extends Equatable {

  final int pageNum;

  const GetBooksParams({required this.pageNum});
  
  @override
  List<Object?> get props => [pageNum];
}
