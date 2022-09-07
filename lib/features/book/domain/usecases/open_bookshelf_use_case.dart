import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:gutenberg_library/core/usecase/base_use_case.dart';
import 'package:gutenberg_library/features/book/domain/entities/book.dart';
import 'package:gutenberg_library/features/book/domain/repositories/bookshelf_repository.dart';

import '../../../../core/error/failure.dart';

class OpenBookshelfUseCase extends BaseUseCase<List<Book>, Params> {

  final BookshelfRepository bookshelfRepository;

  OpenBookshelfUseCase(this.bookshelfRepository);

  @override
  Future<Either<Failure, List<Book>>> call(Params params) async {
    return bookshelfRepository.open(params.bookshelf, params.pageNum);
  }
}

class Params extends Equatable {
  
  final String bookshelf;

  final int pageNum;

  const Params({
    required this.bookshelf,
    required this.pageNum
  });
  
  @override
  List<Object?> get props => [bookshelf, pageNum];
}
