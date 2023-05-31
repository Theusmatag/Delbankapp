import 'package:delcred_app/controller/books_controller.dart';
import 'package:delcred_app/controller/home_controller.dart';
import 'package:delcred_app/controller/reviews_controller.dart';
import 'package:get/get.dart';

class Inject {
  static init() {
    Get.put(HomeController());
    Get.put(BooksController());
    Get.put(ReviewController());
  }
}
