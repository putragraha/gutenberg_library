import 'package:equatable/equatable.dart';

class Book extends Equatable {

  final int id;
  final String title;
  final List<String> authors;
  final String imageUrl;
  final int downloadCount;
  final String eBookUrl;
  final List<String> bookshelves;

  const Book({
    required this.id,
    required this.title,
    required this.authors,
    required this.imageUrl,
    required this.downloadCount,
    required this.eBookUrl,
    required this.bookshelves,  
  });
  
  @override
  List<Object?> get props => [id, title, authors, imageUrl, downloadCount, eBookUrl, bookshelves];
}
