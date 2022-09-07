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
  final FormatModel formats;
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

  factory BookResultsModel.fromJson(Map<String, dynamic> jsonMap) {
    final List<PersonModel> authors = List<PersonModel>.unmodifiable(
      jsonMap['authors'].map((e) => PersonModel.fromJson(e))
    );
    final List<PersonModel> translators = List<PersonModel>.unmodifiable(
      jsonMap['translators'].map((e) => PersonModel.fromJson(e))
    );
    final List<String> subjects = List<String>.unmodifiable(jsonMap['subjects']);
    final List<String> bookshelves = List<String>.unmodifiable(jsonMap['bookshelves']);
    final List<String> languages = List<String>.unmodifiable(jsonMap['languages']);
    final FormatModel formatModel = FormatModel.fromJson(jsonMap['formats']);

    return BookResultsModel(
      id: jsonMap['id'],
      title: jsonMap['title'],
      authors: authors,
      translators: translators,
      subjects: subjects,
      bookshelves: bookshelves,
      languages: languages,
      copyright: jsonMap['copyright'],
      mediaType: jsonMap['media_type'],
      formats: formatModel,
      downloadCount: jsonMap['download_count']
    );
  }
  
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
