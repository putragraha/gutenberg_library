
import 'package:flutter_test/flutter_test.dart';
import 'package:gutenberg_library/core/error/exceptions.dart';
import 'package:gutenberg_library/core/error/server_failure.dart';
import 'package:gutenberg_library/core/network/network_info.dart';
import 'package:gutenberg_library/features/book/data/datasources/bookshelf_remote_data_source.dart';
import 'package:gutenberg_library/features/book/data/models/books_model.dart';
import 'package:gutenberg_library/features/book/data/repositories/bookshelf_repository_impl.dart';
import 'package:gutenberg_library/features/book/domain/entities/book.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../core/datafactory/book_factory.dart';
import '../../../../core/datafactory/books_model_factory.dart';

class MockRemoteDataSource extends Mock implements BookshelfRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {

  MockRemoteDataSource mockRemoteDataSource = MockRemoteDataSource();

  MockNetworkInfo mockNetworkInfo = MockNetworkInfo();

  BookshelfRepositoryImpl repository = BookshelfRepositoryImpl(
    remoteDataSource: mockRemoteDataSource,
    networkInfo: mockNetworkInfo
  );

  const bookshelf = "bookshelf";

  const pageNum = 1;

  BooksModel booksModel = BooksModelFactory.newBooksModel();

  List<Book> books = [BookFactory.newBook()];

  test('should check if device is online', () {
    // arrange
    when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    when(() => mockRemoteDataSource.open(any(), any())).thenAnswer((_) async => booksModel);
    // act
    repository.open(bookshelf, pageNum);
    // assert
    verify(() => mockNetworkInfo.isConnected);
  });

  test('should return ServerFailure when the device is offline', () async {
    // arrange
    when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
    // act
    final result = await repository.open(bookshelf, pageNum);
    // assert
    result.fold((left) => expect(left, ServerFailure()), (right) => {});
  });

  test('should return data when the call to remote data is success', () async {
    // arrange
    when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    when(() => mockRemoteDataSource.open(any(), any())).thenAnswer((_) async => booksModel);
    // act
    final result = await repository.open(bookshelf, pageNum);
    // assert
    verify(() => mockRemoteDataSource.open(bookshelf, pageNum));
    result.fold((left) => {}, (right) => {});
  });

  test('should return ServerFailure when the call to remote data source is fail', () async {
    // arrange
    when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    when(() => mockRemoteDataSource.open(any(), any())).thenThrow(ServerException());
    // act
    final result = await repository.open(bookshelf, pageNum);
    // assert
    result.fold((left) => expect(left, ServerFailure()), (right) => {});
  });
}
