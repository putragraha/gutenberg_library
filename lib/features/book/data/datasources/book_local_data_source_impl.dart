// ignore_for_file: constant_identifier_names

import 'package:gutenberg_library/features/book/domain/entities/book.dart';
import 'package:sqflite/sqflite.dart';

import 'book_local_data_source.dart';

class BookLocalDataSourceImpl extends BookLocalDataSource {

  final Database db;

  static const BOOK_TABLE = "Book";

  static const ID_FIELD = "id";

  static const TITLE_FIELD = "title";

  static const AUTHORS_FIELD = "authors";

  static const IMAGE_URL_FIELD = "image_url"; 

  static const DOWNLOAD_COUNT_FIELD = "download_count"; 

  static const BOOKSHELVES_FIELD = "bookshelves";

  static const E_BOOK_URL_FIELD = "e_book_url"; 

  BookLocalDataSourceImpl({
    required this.db
  });
    
   @override
  Future<void> cacheBooks(List<Book> books) async {
    List<Map<String, Object?>> entities = List.from(books.map((element) => element.toEntityMap()));
    await db.transaction((txn) async {
      for (var element in entities) { 
        await txn.insert(BOOK_TABLE, element); 
      }
    });
  }

  @override
  Future<List<Book>> getCachedBooks() async {
    final bookEntities = await db.query(BOOK_TABLE); 
    List<Book> books = List.from(bookEntities.map((element) => Book.fromEntityMap(element))); 
    
    return books;
  }
}
