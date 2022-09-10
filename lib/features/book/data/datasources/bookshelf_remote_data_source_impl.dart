import 'dart:convert';

import 'package:gutenberg_library/features/book/data/datasources/bookshelf_remote_data_source.dart';
import 'package:gutenberg_library/features/book/data/models/books_model.dart';
import 'package:http/http.dart' as http;

import '../../../../core/api/constants.dart';
import '../../../../core/error/exceptions.dart';

class BookshelfRemoteDataSourceImpl extends BookshelfRemoteDataSource {

  final http.Client client;

  BookshelfRemoteDataSourceImpl({
    required this.client
  });

  @override
  Future<BooksModel> open(String bookshelf, int pageNum) async {
    final Uri url = Uri.parse(
      Uri.encodeFull("${Constants.BASE_URL}books?topic=$bookshelf&page=$pageNum")
    );
    final response = await client.get(url); 
    
    if (response.statusCode == 200) {
      return BooksModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
