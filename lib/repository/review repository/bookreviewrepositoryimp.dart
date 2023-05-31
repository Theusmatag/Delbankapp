import 'dart:io';

import 'package:delcred_app/model/review.dart';
import 'package:dio/dio.dart';
import '../../env/env.dart';
import 'bookreviewrepository.dart';

class BookReviewRepositoryImp implements BookReviewRepository {
  Dio dio = Dio();
  String youApiKey = Env.instance.get('your_api_key');
  @override
  Future<List<ReviewBooks>> fetchreviews(String title) async {
    try {
      var response = await dio.get(
          'https://api.nytimes.com/svc/books/v3/reviews.json?title=$title&api-key=$youApiKey');

      if (response.statusCode == 200) {
        var booksreviewslist = response.data['results'] as List;
        return booksreviewslist.map((e) => ReviewBooks.fromMap(e)).toList();
      } else {
        return [];
      }
    } on Exception {
      throw const HttpException('Erro ao buscar reviews');
    }
  }
}
