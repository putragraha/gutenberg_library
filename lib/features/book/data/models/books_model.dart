import 'package:equatable/equatable.dart';
import 'package:gutenberg_library/features/book/data/models/book_results_model.dart';

class BooksModel extends Equatable {

  final int count;

  final String? next;

  final String? previous;

  final List<BookResultsModel> bookResultsModels;

  const BooksModel({
    required this.count,
    required this.bookResultsModels,
    this.next,
    this.previous
  });
  
  @override
  List<Object?> get props => [count, bookResultsModels, next, previous];

  factory BooksModel.fromJson(Map<String, dynamic> jsonMap) {
    final List<BookResultsModel> bookResultsModels = List<BookResultsModel>.unmodifiable(
      jsonMap['results'].map((e) => BookResultsModel.fromJson(e))
    );

    return BooksModel(
      count: jsonMap['count'],
      next: jsonMap['next'],
      previous: jsonMap['previous'], 
      bookResultsModels: bookResultsModels
    );
  }
 }
