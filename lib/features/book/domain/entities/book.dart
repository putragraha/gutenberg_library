import 'package:equatable/equatable.dart';

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
  
  @override
  List<Object?> get props => [id, title, authors, imageUrl, downloadCount, eBookUrl, bookshelves];

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
}
