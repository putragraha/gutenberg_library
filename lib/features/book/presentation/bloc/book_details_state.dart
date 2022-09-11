part of 'book_details_bloc.dart';

abstract class BookDetailsState extends Equatable {
  const BookDetailsState();
  
  @override
  List<Object> get props => [];
}

class BookshelfInitial extends BookDetailsState {}

class LoadBookshelfSuccess extends BookDetailsState {

  final List<Book> books;

  const LoadBookshelfSuccess(this.books);

  @override
  List<Object> get props => [books];}

class LoadingBookshelf extends BookDetailsState {}

class LoadBookshelfFailed extends BookDetailsState {}
