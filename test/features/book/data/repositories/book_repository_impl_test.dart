import 'package:flutter_test/flutter_test.dart';
import 'package:gutenberg_library/core/error/cache_failure.dart';
import 'package:gutenberg_library/core/error/exceptions.dart';
import 'package:gutenberg_library/core/error/server_failure.dart';
import 'package:gutenberg_library/core/network/network_info.dart';
import 'package:gutenberg_library/features/book/data/datasources/book_local_data_source.dart';
import 'package:gutenberg_library/features/book/data/datasources/book_remote_data_source.dart';
import 'package:gutenberg_library/features/book/data/models/books_model.dart';
import 'package:gutenberg_library/features/book/data/repositories/book_repository_impl.dart';
import 'package:gutenberg_library/features/book/domain/entities/book.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../core/datafactory/book_factory.dart';
import '../../../../core/datafactory/books_model_factory.dart';

class MockRemoteDataSource extends Mock implements BookRemoteDataSource {}

class MockLocalDataSource extends Mock implements BookLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  MockRemoteDataSource mockRemoteDataSource = MockRemoteDataSource();

  MockLocalDataSource mockLocalDataSource = MockLocalDataSource();

  MockNetworkInfo mockNetworkInfo = MockNetworkInfo();

  BookRepositoryImpl repository = BookRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo);

  const keyword = "keyword";

  const pageNum = 1;

  BooksModel bookModel = BooksModelFactory.newBooksModel();

  List<Book> books = [BookFactory.newBook()];

  group('getBooks', () {
    test('should check if device is online', () async {
      // arrange
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(() => mockRemoteDataSource.getBooks(any()))
          .thenAnswer((_) async => bookModel);
      // act
      repository.getBooks(pageNum);
      // assert
      verify(() => mockNetworkInfo.isConnected);
    });

    group('device is online', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
          'should return remote data when the call to remote data source is success',
          () async {
        // arrange
        when(() => mockRemoteDataSource.getBooks(any()))
            .thenAnswer((_) async => bookModel);
        // act
        final result = await repository.getBooks(pageNum);
        // assert
        verify(() => mockRemoteDataSource.getBooks(pageNum));
        verifyZeroInteractions(mockLocalDataSource);
        result.fold((left) => {}, (right) => expect(right, books));
      });

      test(
          'should return server failure when the call to remote data source is fail',
          () async {
        // arrange
        when(() => mockRemoteDataSource.getBooks(any()))
            .thenThrow(ServerException());
        // act
        final result = await repository.getBooks(pageNum);
        // assert
        verify(() => mockRemoteDataSource.getBooks(pageNum));
        verifyZeroInteractions(mockLocalDataSource);
        result.fold((left) => expect(left, ServerFailure()), (right) => {});
      });
    });

    group('device is offline', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test(
          'should return last cached data when the call to local data source is success',
          () async {
        // arrange
        when(() => mockLocalDataSource.getCachedBooks())
            .thenAnswer((_) async => books);
        // act
        final result = await repository.getBooks(pageNum);
        // assert
        verify(() => mockLocalDataSource.getCachedBooks());
        verifyZeroInteractions(mockRemoteDataSource);
        result.fold((left) => {}, (right) => expect(right, books));
      });

      test(
          'should return CacheFailure when the call to local data source is fail',
          () async {
        // arrange
        when(() => mockLocalDataSource.getCachedBooks())
            .thenThrow(CacheException());
        // act
        final result = await repository.getBooks(pageNum);
        // assert
        verify(() => mockLocalDataSource.getCachedBooks());
        verifyZeroInteractions(mockRemoteDataSource);
        result.fold((left) => expect(left, CacheFailure()), (right) => {});
      });
    });
  });

  group('searchBooks', () {
    test('should check if device online', () {
      // arrange
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(() => mockRemoteDataSource.searchBooks(any(), any())).thenAnswer((_) async => bookModel);
      // act
      repository.searchBooks(keyword, pageNum);
      // assert
      verify(() => mockNetworkInfo.isConnected);
    });

    test('should return ServerFailure when the device is offline', () async {
      // arrange
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      // act
      final result = await repository.searchBooks(keyword, pageNum);
      // assert
      result.fold((left) => expect(left, ServerFailure()), (right) => {});
    });

    test('should return data when the call to remote data source is success', () async {
      // arrange
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(() => mockRemoteDataSource.searchBooks(any(), any())).thenAnswer((_) async => bookModel);
      // act
      final result = await repository.searchBooks(keyword, pageNum);
      // assert
      verify(() => mockRemoteDataSource.searchBooks(keyword, pageNum));
      result.fold((left) => {}, (right) => expect(right, books));
    });

    test('should return ServerFailure when the call to remote data source is fail', () async {
      // arrange
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(() => mockRemoteDataSource.searchBooks(any(), any())).thenThrow(ServerException());
      // act
      final result = await repository.searchBooks(keyword, pageNum);
      // assert
      result.fold((left) => expect(left, ServerFailure()), (right) => {});
    });
  });

  tearDown(() {
    clearInteractions(mockNetworkInfo);
    clearInteractions(mockRemoteDataSource);
    clearInteractions(mockLocalDataSource);
  });
}
