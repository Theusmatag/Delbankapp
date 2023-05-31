import 'dart:io';

import 'package:delcred_app/model/books.dart';
import 'package:delcred_app/repository/book%20repository/book_repository.dart';
import 'package:dio/dio.dart';

import '../../env/env.dart';

class BookRepositoryImp implements BookRepository {
  Dio dio = Dio();
  List<Books> bestSellerbooklist = [];
  String youApiKey = Env.instance.get('your_api_key');
  @override
  Future<List<Books>> fetchbooks(String data, String name) async {
    try {
      var response = await dio.get(
          'https://api.nytimes.com/svc/books/v3/lists/$data/$name.json?api-key=$youApiKey');
      if (response.statusCode == 200) {
        var bookreviews = response.data['results']['books'] as List;
        bestSellerbooklist = bookreviews.map((e) => Books.fromMap(e)).toList();
        return bestSellerbooklist;
      } else {
        return [];
      }
    } on Exception {
      throw const HttpException('Erro ao buscar Livros');
    }
  }
}
