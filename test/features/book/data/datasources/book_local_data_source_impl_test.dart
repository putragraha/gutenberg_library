import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:gutenberg_library/features/book/data/datasources/book_local_data_source_impl.dart';
import 'package:gutenberg_library/features/book/domain/entities/book.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../../../../core/datafactory/book_factory.dart';

class MockDb extends Mock implements Database {}

void main() {
  
  late Database mockDb;

  late BookLocalDataSourceImpl dataSource;

  List<Book> books = [BookFactory.newBook()];

  sqfliteFfiInit();

  setUp(() async {
    mockDb = await databaseFactoryFfi.openDatabase(inMemoryDatabasePath);
    await mockDb.execute('''
      CREATE TABLE Book (
        id INTEGER PRIMARY KEY,
        title TEXT,
        authors TEXT,
        image_url TEXT,
        download_count INTEGER,
        bookshelves TEXT,
        e_book_url TEXT
      )
    ''');
    dataSource = BookLocalDataSourceImpl(db:mockDb);
  });
  
  test('should be connected', () async {
    expect(await mockDb.getVersion(), 0);
  });

  test("should contains data when data inserted successfully", () async {
    // arrange
    dataSource.cacheBooks(books);
    // act
    final result = await dataSource.getCachedBooks();
    // assert
    expect(result, books);
  });

  tearDown(() async {
    await mockDb.close();
  });
}
