part of 'books_bloc.dart';

abstract class BooksState extends Equatable {
  const BooksState();
  
  @override
  List<Object> get props => [];
}

class SuccessGetBooks extends BooksState {

  final List<Book> books;

  const SuccessGetBooks(this.books);

  @override
  List<Object> get props => [books];
}

class LoadingBooks extends BooksState {}

class EmptyBooks extends BooksState {}

class FailedGetBooks extends BooksState {}
