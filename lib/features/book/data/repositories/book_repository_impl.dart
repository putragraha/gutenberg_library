import 'package:gutenberg_library/core/error/cache_failure.dart';
import 'package:gutenberg_library/core/error/exceptions.dart';
import 'package:gutenberg_library/core/mapper/books_mapper.dart';
import 'package:gutenberg_library/core/network/network_info.dart';
import 'package:gutenberg_library/features/book/data/datasources/book_local_data_source.dart';
import 'package:gutenberg_library/features/book/data/datasources/book_remote_data_source.dart';
import 'package:gutenberg_library/features/book/data/models/books_model.dart';
import 'package:gutenberg_library/features/book/domain/entities/book.dart';
import 'package:gutenberg_library/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:gutenberg_library/features/book/domain/repositories/book_repository.dart';

import '../../../../core/error/server_failure.dart';

class BookRepositoryImpl extends BookRepository {
  final BookRemoteDataSource remoteDataSource;

  final BookLocalDataSource localDataSource;

  final NetworkInfo networkInfo;

  BookRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<Book>>> getBooks(int pageNum) async {
    try {
      if (await networkInfo.isConnected) {
        BooksModel booksModel = await remoteDataSource.getBooks(pageNum);
        List<Book> books = BooksMapper.map(booksModel);

        return Right(books);
      } else {
        return Right(await localDataSource.getCachedBooks());
      }
    } on ServerException {
      return Left(ServerFailure());
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<Book>>> searchBooks(String keyword, int pageNum) async {
    try {
      if (await networkInfo.isConnected) {
        BooksModel booksModel = await remoteDataSource.searchBooks(keyword, pageNum);
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
