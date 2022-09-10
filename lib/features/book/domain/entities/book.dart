import 'package:equatable/equatable.dart';
import 'package:gutenberg_library/features/book/data/datasources/book_local_data_source_impl.dart';

import '../../data/models/book_results_model.dart';

class Book extends Equatable {

  final int id;
  final String title;
  final List<String> authors;
  final String? imageUrl;
  final int downloadCount;
  final String? eBookUrl;
  final List<String> bookshelves;

  const Book({
    required this.id,
    required this.title,
    required this.authors,
    required this.downloadCount,
    required this.bookshelves,
    this.imageUrl,
    this.eBookUrl,  
  });

  factory Book.fromBooksModel(BookResultsModel bookResultsModel) {
    return Book(
      id: bookResultsModel.id, 
      title: bookResultsModel.title, 
      authors: List.of(bookResultsModel.authors.map((e) => e.name)), 
      downloadCount: bookResultsModel.downloadCount, 
      bookshelves: bookResultsModel.bookshelves,
      imageUrl: bookResultsModel.formats.imageJpeg, 
      eBookUrl: bookResultsModel.formats.textHtmlUtf8, 
    );
  }

  factory Book.fromEntityMap(Map<String, Object?> entity) {
    return Book(
      id: entity[BookLocalDataSourceImpl.ID_FIELD] as int, 
      title: entity[BookLocalDataSourceImpl.TITLE_FIELD] as String, 
      authors: (entity[BookLocalDataSourceImpl.AUTHORS_FIELD] as String).split("|"), 
      downloadCount: entity[BookLocalDataSourceImpl.DOWNLOAD_COUNT_FIELD] as int, 
      bookshelves: (entity[BookLocalDataSourceImpl.BOOKSHELVES_FIELD] as String).split("|"),
      imageUrl: entity[BookLocalDataSourceImpl.IMAGE_URL_FIELD] as String,
      eBookUrl: entity[BookLocalDataSourceImpl.E_BOOK_URL_FIELD] as String,
    );
  }
  
  @override
  List<Object?> get props => [id, title, authors, imageUrl, downloadCount, eBookUrl, bookshelves];

  Map<String, Object?> toEntityMap() {
    return {
      BookLocalDataSourceImpl.ID_FIELD: id,
      BookLocalDataSourceImpl.TITLE_FIELD: title,
      BookLocalDataSourceImpl.AUTHORS_FIELD: authors.join("|"),
      BookLocalDataSourceImpl.DOWNLOAD_COUNT_FIELD: downloadCount,
      BookLocalDataSourceImpl.BOOKSHELVES_FIELD: bookshelves.join("|"),
      BookLocalDataSourceImpl.IMAGE_URL_FIELD: imageUrl,
      BookLocalDataSourceImpl.E_BOOK_URL_FIELD: eBookUrl,
    };
  }
}
