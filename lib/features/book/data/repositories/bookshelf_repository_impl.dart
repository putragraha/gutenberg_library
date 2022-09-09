import 'package:gutenberg_library/core/error/exceptions.dart';
import 'package:gutenberg_library/core/error/server_failure.dart';
import 'package:gutenberg_library/core/mapper/books_mapper.dart';
import 'package:gutenberg_library/core/network/network_info.dart';
import 'package:gutenberg_library/features/book/data/datasources/bookshelf_remote_data_source.dart';
import 'package:gutenberg_library/features/book/data/models/books_model.dart';
import 'package:gutenberg_library/features/book/domain/entities/book.dart';
import 'package:gutenberg_library/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:gutenberg_library/features/book/domain/repositories/bookshelf_repository.dart';

class BookshelfRepositoryImpl extends BookshelfRepository {
  
  final BookshelfRemoteDataSource remoteDataSource;

  final NetworkInfo networkInfo;

  BookshelfRepositoryImpl({
    required this.remoteDataSource, 
    required this.networkInfo
  });

  @override
  Future<Either<Failure, List<Book>>> open(String bookshelf, int pageNum) async {
    try {
      if (await networkInfo.isConnected) {
        BooksModel booksModel = await remoteDataSource.open(bookshelf, pageNum);
        List<Book> books = BooksMapper.map(booksModel);

        return Right(books);
      } else {
        return Left(ServerFailure());
      }
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
