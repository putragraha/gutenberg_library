part of 'bookshelf_bloc.dart';

abstract class BookshelfEvent extends Equatable {
  const BookshelfEvent();

  @override
  List<Object> get props => [];
}

class LoadBookshelf extends BookshelfEvent {

  final String bookshelf;

  const LoadBookshelf(this.bookshelf);

  @override
  List<Object> get props => [bookshelf];
}
