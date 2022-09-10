part of 'books_bloc.dart';

abstract class BooksEvent extends Equatable {
  const BooksEvent();

  @override
  List<Object> get props => [];
}

class GetAllBooks extends BooksEvent {}

class SearchBook extends BooksEvent {

  final String keyword;

  const SearchBook(this.keyword);

  @override
  List<Object> get props => [keyword];
}
