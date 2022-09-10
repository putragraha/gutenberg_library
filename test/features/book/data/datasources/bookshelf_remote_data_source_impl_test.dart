import 'package:flutter_test/flutter_test.dart';
import 'package:gutenberg_library/core/error/exceptions.dart';
import 'package:gutenberg_library/features/book/data/datasources/bookshelf_remote_data_source_impl.dart';
import 'package:gutenberg_library/features/book/data/models/books_model.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

import '../../../../core/datafactory/books_model_factory.dart';
import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  
  late http.Client mockClient;

  late BookshelfRemoteDataSourceImpl dataSource;

  late Uri url;

  const pageNum = 1;

  const bookshelf = "Contemporary Reviews";

  const encodedBookshelf = "Contemporary%20Reviews";

  final BooksModel booksModel = BooksModelFactory.newBooksModel();

  setUp(() {
    mockClient = MockHttpClient();
    dataSource = BookshelfRemoteDataSourceImpl(client: mockClient);
    url = Uri.parse("http://gutendex.com/books?topic=$encodedBookshelf&page=$pageNum");
  });

    test('''
      should perform a GET request and return data 
      on an URL with books being the endpoint and responseCode is 200
    ''', () async {
      // arrange
      when(() => mockClient.get(url))
        .thenAnswer((_) async => http.Response(fixture("book.json"), 200));
      // act
      final result = await dataSource.open(bookshelf, pageNum);
      // assert
      verify(() => mockClient.get(url));
      expect(result, booksModel);
    });

    test('should return ServerException on API does not returned responseCode 200', () async {
      // arrange
      when(() => mockClient.get(url))
        .thenAnswer((_) async => http.Response('Something went wrong', 404));
      // act
      final call = dataSource.open;
      // assert
      expect(() => call(bookshelf, pageNum), throwsA(const TypeMatcher<ServerException>()));
    });
}
