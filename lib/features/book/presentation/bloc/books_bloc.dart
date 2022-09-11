import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gutenberg_library/features/book/domain/usecases/get_books_use_case.dart';
import 'package:gutenberg_library/features/book/domain/usecases/search_books_use_case.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/book.dart';

part 'books_event.dart';
part 'books_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  final GetBooksUseCase getBooksUseCase;

  final SearchBooksUseCase searchBooksUseCase;

  final pageNum = 1;

  BooksBloc({required this.getBooksUseCase, required this.searchBooksUseCase})
      : super(LoadingBooks()) {
    on<GetAllBooks>((event, emit) async {
      emit(LoadingBooks());
      final result = await getBooksUseCase(GetBooksParams(pageNum: pageNum));

      result.fold((failure) => emit(FailedGetBooks()), (books) {
        if (books.isEmpty) {
          emit(EmptyBooks());
        } else {
          emit(SuccessGetBooks(books));
        }
      });
    });

    on<SearchBook>((event, emit) async {
      emit(LoadingBooks());
      Either<Failure, List<Book>> result;

      if (event.keyword.isEmpty) {
        result = await getBooksUseCase(GetBooksParams(pageNum: pageNum));
      } else {
        result = await searchBooksUseCase(
            SearchBooksParams(keyword: event.keyword, pageNum: pageNum));
      }

      result.fold((failure) => emit(FailedGetBooks()), (books) {
        if (books.isEmpty) {
          emit(EmptyBooks());
        } else {
          emit(SuccessGetBooks(books));
        }
      });
    });
  }
}
