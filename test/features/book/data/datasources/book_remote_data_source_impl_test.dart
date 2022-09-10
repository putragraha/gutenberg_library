import 'package:flutter_test/flutter_test.dart';
import 'package:gutenberg_library/core/error/exceptions.dart';
import 'package:gutenberg_library/features/book/data/datasources/book_remote_data_source_impl.dart';
import 'package:gutenberg_library/features/book/data/models/books_model.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

import '../../../../core/datafactory/books_model_factory.dart';
import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {

  late http.Client mockClient;

  late BookRemoteDataSourceImpl dataSource;

  const pageNum = 1;

  final BooksModel booksModel = BooksModelFactory.newBooksModel();

  setUp(() {
    mockClient = MockHttpClient();
    dataSource = BookRemoteDataSourceImpl(client: mockClient);
  });

  group('getBooks', () {
    late Uri url;

    setUp(() {
      url = Uri.parse("http://gutendex.com/books?page=$pageNum");
    });

    test('''
      should perform a GET request and return data 
      on an URL with books being the endpoint and responseCode is 200
    ''', () async {
      // arrange
      when(() => mockClient.get(url))
        .thenAnswer((_) async => http.Response(fixture("book.json"), 200));
      // act
      final result = await dataSource.getBooks(pageNum);
      // assert
      verify(() => mockClient.get(url));
      expect(result, booksModel);
    });

    test('should return ServerException on API does not returned responseCode 200', () async {
      // arrange
      when(() => mockClient.get(url))
        .thenAnswer((_) async => http.Response('Something went wrong', 404));
      // act
      final call = dataSource.getBooks;
      // assert
      expect(() => call(pageNum), throwsA(const TypeMatcher<ServerException>()));
    });
  });

  group('searchBooks', () {
    late Uri url;

    const keyword = "dickens great";

    const encodedKeyword = "dickens%20great"; 

    setUp(() {
      url = Uri.parse("http://gutendex.com/books?search=$encodedKeyword&page=$pageNum");
    });

    test('''
      should perform a GET request and return data 
      on an URL with books being the endpoint and responseCode is 200
    ''', () async {
      // arrange
      when(() => mockClient.get(url))
        .thenAnswer((_) async => http.Response(fixture("book.json"), 200));
      // act
      final result = await dataSource.searchBooks(keyword, pageNum);
      // assert
      verify(() => mockClient.get(url));
      expect(result, booksModel);
    });

    test('should return ServerException on API does not returned responseCode 200', () async {
      // arrange
      when(() => mockClient.get(url))
        .thenAnswer((_) async => http.Response('Something went wrong', 404));
      // act
      final call = dataSource.searchBooks;
      // assert
      expect(() => call(keyword, pageNum), throwsA(const TypeMatcher<ServerException>()));
    });
  });
}
