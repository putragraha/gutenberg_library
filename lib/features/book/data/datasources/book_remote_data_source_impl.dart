import 'dart:convert';
import 'dart:io';

import 'package:gutenberg_library/core/api/constants.dart';
import 'package:gutenberg_library/core/error/exceptions.dart';
import 'package:gutenberg_library/features/book/data/datasources/book_remote_data_source.dart';
import 'package:gutenberg_library/features/book/data/models/books_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class BookRemoteDataSourceImpl extends BookRemoteDataSource {
  
  final http.Client client;

  BookRemoteDataSourceImpl({
    required this.client
  });

  @override
  Future<BooksModel> getBooks(int pageNum) async {
    final Uri url = Uri.parse("${Constants.BASE_URL}books?page=$pageNum");
    final response = await client.get(url); 
    
    if (response.statusCode == 200) {
      return BooksModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<BooksModel> searchBooks(String keyword, int pageNum) async {
    final Uri url = Uri.parse(
      Uri.encodeFull("http://gutendex.com//books?search=$keyword&page=$pageNum")
    );
    final response = await client.get(url); 
    
    if (response.statusCode == 200) {
      return BooksModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
