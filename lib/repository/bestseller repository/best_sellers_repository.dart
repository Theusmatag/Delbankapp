import 'package:delcred_app/model/best_sellers_list.dart';

abstract class BestSellersRepository {
  Future<List<BestSeller>> fetchbestseller();
}
