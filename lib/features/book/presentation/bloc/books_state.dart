part of 'books_bloc.dart';

abstract class BooksState extends Equatable {
  const BooksState();
  
  @override
  List<Object> get props => [];
}

class BooksInitial extends BooksState {}

class GetAllBooksSuccess extends BooksState {

  final List<Book> books;

  const GetAllBooksSuccess(this.books);

  @override
  List<Object> get props => [books];
}

class LoadGetAllBooks extends BooksState {}

class EmptyBooks extends BooksState {}

class GetAllBooksFailed extends BooksState {}
