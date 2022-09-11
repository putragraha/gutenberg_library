part of 'book_details_bloc.dart';

abstract class BookDetailsEvent extends Equatable {
  const BookDetailsEvent();

  @override
  List<Object> get props => [];
}

class LoadBookshelf extends BookDetailsEvent {

  final String bookshelf;

  const LoadBookshelf(this.bookshelf);

  @override
  List<Object> get props => [bookshelf];
}
