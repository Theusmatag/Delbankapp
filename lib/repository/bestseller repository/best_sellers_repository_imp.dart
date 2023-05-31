import 'dart:io';

import 'package:delcred_app/model/best_sellers_list.dart';
import 'package:delcred_app/repository/bestseller%20repository/best_sellers_repository.dart';
import 'package:dio/dio.dart';

import '../../env/env.dart';

class BestSellersRepositoryImp implements BestSellersRepository {
  Dio dio = Dio();
  String youApiKey = Env.instance.get('your_api_key');

  @override
  Future<List<BestSeller>> fetchbestseller() async {
    try {
      var response = await dio.get(
          'https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=$youApiKey');
      if (response.statusCode == 200) {
        var bestsellerlist = response.data['results'] as List;

        return bestsellerlist.map((e) => BestSeller.fromMap(e)).toList();
      } else {
        return [];
      }
    } on Exception {
      throw const HttpException('Erro ao buscar Listas de bestsellers');
    }
  }
}
