import '../../domain/entities/book.dart';

abstract class BookLocalDataSource {

  /// Store last fetched books on success get books from API
  Future<void> cacheBooks(List<Book> books);

  /// Get last fetched books from latest success books API response
  /// Used in Main Screen to help engage users and keep users on apps on network not connected
  Future<List<Book>> getCachedBooks();
}