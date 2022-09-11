import 'package:get_it/get_it.dart';
import 'package:gutenberg_library/core/network/network_info.dart';
import 'package:gutenberg_library/core/network/network_info_impl.dart';
import 'package:gutenberg_library/features/book/data/datasources/book_local_data_source.dart';
import 'package:gutenberg_library/features/book/data/datasources/book_local_data_source_impl.dart';
import 'package:gutenberg_library/features/book/data/datasources/book_remote_data_source.dart';
import 'package:gutenberg_library/features/book/data/datasources/book_remote_data_source_impl.dart';
import 'package:gutenberg_library/features/book/data/datasources/bookshelf_remote_data_source.dart';
import 'package:gutenberg_library/features/book/data/datasources/bookshelf_remote_data_source_impl.dart';
import 'package:gutenberg_library/features/book/data/repositories/book_repository_impl.dart';
import 'package:gutenberg_library/features/book/data/repositories/bookshelf_repository_impl.dart';
import 'package:gutenberg_library/features/book/domain/repositories/book_repository.dart';
import 'package:gutenberg_library/features/book/domain/repositories/bookshelf_repository.dart';
import 'package:gutenberg_library/features/book/domain/usecases/get_books_use_case.dart';
import 'package:gutenberg_library/features/book/domain/usecases/open_bookshelf_use_case.dart';
import 'package:gutenberg_library/features/book/domain/usecases/search_books_use_case.dart';
import 'package:gutenberg_library/features/book/presentation/bloc/books_bloc.dart';
import 'package:gutenberg_library/features/book/presentation/bloc/book_details_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final sl = GetIt.instance;

Future<void> init() async {

  // BLoC
  sl.registerFactory(() => BooksBloc(
    getBooksUseCase: sl(), 
    searchBooksUseCase: sl()
  ));
  sl.registerFactory(() => BookDetailsBloc(openBookshelfUseCase: sl()));

  // Usecase
  sl.registerLazySingleton(() => GetBooksUseCase(sl()));
  sl.registerLazySingleton(() => SearchBooksUseCase(sl()));
  sl.registerLazySingleton(() => OpenBookshelfUseCase(sl()));

  // Repository
  sl.registerLazySingleton<BookRepository>(() => BookRepositoryImpl(
    remoteDataSource: sl(), 
    localDataSource: sl(), 
    networkInfo: sl()
  ));
  sl.registerLazySingleton<BookshelfRepository>(() => BookshelfRepositoryImpl(
    remoteDataSource: sl(), 
    networkInfo: sl()
  ));

  // Data Source
  sl.registerLazySingleton<BookRemoteDataSource>(() => BookRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<BookLocalDataSource>(() => BookLocalDataSourceImpl(db: sl()));
  sl.registerLazySingleton<BookshelfRemoteDataSource>(() => BookshelfRemoteDataSourceImpl(client: sl()));

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(connectionChecker: sl()));

  // External
  sl.registerLazySingleton(() => http.Client());
  final db = await openDatabase(
    join(await getDatabasesPath(), "gutenberg.db"), 
    version: 1, 
    onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE Book (
          id INTEGER PRIMARY KEY,
          title TEXT,
          authors TEXT,
          image_url TEXT,
          download_count INTEGER,
          bookshelves TEXT,
          e_book_url TEXT
        )
      ''');
    }
  );
  sl.registerLazySingleton<Database>(() => db);
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
