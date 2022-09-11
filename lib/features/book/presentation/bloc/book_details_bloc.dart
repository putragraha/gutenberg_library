import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gutenberg_library/features/book/domain/usecases/open_bookshelf_use_case.dart';

import '../../domain/entities/book.dart';

part 'book_details_event.dart';
part 'book_details_state.dart';

class BookDetailsBloc extends Bloc<BookDetailsEvent, BookDetailsState> {
  final OpenBookshelfUseCase openBookshelfUseCase;

  int pageNum = 1;

  BookDetailsBloc({required this.openBookshelfUseCase})
      : super(BookshelfInitial()) {

    on<LoadBookshelf>((event, emit) async {
      emit(LoadingBookshelf());
      final result = await openBookshelfUseCase(
          OpenBookshelfParams(bookshelf: event.bookshelf, pageNum: pageNum));

      result.fold(
        (failure) => emit(LoadBookshelfFailed()), 
        (books) => emit(LoadBookshelfSuccess(books))
      );
    });
  }
}
