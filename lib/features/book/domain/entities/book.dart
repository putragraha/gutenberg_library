import 'package:equatable/equatable.dart';

class Book extends Equatable {

  final String id;
  final String name;
  final String imageUrl;
  final String downloadCount;
  final String eBookUrl;
  final List<String> bookshelves;

  const Book({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.downloadCount,
    required this.eBookUrl,
    required this.bookshelves,  
  });
  
  @override
  List<Object?> get props => [id, name, imageUrl, downloadCount, eBookUrl, bookshelves];
}
