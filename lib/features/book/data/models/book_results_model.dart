import 'package:equatable/equatable.dart';
import 'package:gutenberg_library/features/book/data/models/person_model.dart';
import 'package:gutenberg_library/features/book/data/models/format_model.dart';

class BookResultsModel extends Equatable {
  final int id;
  final String title;
  final List<PersonModel> authors;
  final List<String> subjects;
  final List<PersonModel> translators;
  final List<String> bookshelves;
  final List<String> languages;
  final String mediaType;
  final Format formats;
  final int downloadCount;
  final bool? copyright;

  const BookResultsModel({
    required this.id,
    required this.title,
    required this.authors,
    required this.subjects,
    required this.translators,
    required this.bookshelves,
    required this.languages,
    required this.mediaType,
    required this.formats,
    required this.downloadCount,
    this.copyright
  });
  
  @override
  List<Object?> get props => [
    id,
    title,
    authors,
    subjects,
    bookshelves,
    languages,
    mediaType,
    formats,
    downloadCount,
    copyright
  ];
}
