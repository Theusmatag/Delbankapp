import 'dart:developer';

import 'package:delcred_app/model/best_sellers_list.dart';
import 'package:get/get.dart';
import '../repository/bestseller repository/best_sellers_repository.dart';
import '../repository/bestseller repository/best_sellers_repository_imp.dart';

class HomeController {
  HomeController() {
    fetchlist();
  }
  Rx<List<BestSeller>> bestSellersList = Rx([]);
  BestSellersRepository bestSellersRepository = BestSellersRepositoryImp();
  Future<void> fetchlist() async {
    bestSellersList.value = await bestSellersRepository.fetchbestseller();
    log('buscou bestsellerlist');
  }
}
