part of 'book_details_bloc.dart';

abstract class BookDetailsState extends Equatable {
  const BookDetailsState();
  
  @override
  List<Object> get props => [];
}

class SuccessLoadBookshelf extends BookDetailsState {

  final List<Book> books;

  const SuccessLoadBookshelf(this.books);

  @override
  List<Object> get props => [books];
}

class LoadingBookshelf extends BookDetailsState {}

class FailedLoadBookshelf extends BookDetailsState {}
