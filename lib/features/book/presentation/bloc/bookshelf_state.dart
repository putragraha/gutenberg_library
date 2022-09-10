part of 'bookshelf_bloc.dart';

abstract class BookshelfState extends Equatable {
  const BookshelfState();
  
  @override
  List<Object> get props => [];
}

class BookshelfInitial extends BookshelfState {}

class LoadBookshelfSuccess extends BookshelfState {

  final List<Book> books;

  const LoadBookshelfSuccess(this.books);

  @override
  List<Object> get props => [books];}

class LoadingBookshelf extends BookshelfState {}

class LoadBookshelfFailed extends BookshelfState {}
