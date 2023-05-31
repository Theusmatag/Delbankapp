import 'package:delcred_app/repository/review%20repository/bookreviewrepository.dart';
import 'package:get/get.dart';
import '../model/review.dart';
import '../repository/review repository/bookreviewrepositoryimp.dart';
import 'dart:developer' as dev;

class ReviewController {
  Rx<List<ReviewBooks>> bookreviewlist = Rx([]);
  BookReviewRepository bookReviewRepository = BookReviewRepositoryImp();
  Future<void> fetchBooksReviewsList(String title) async {
    bookreviewlist.value = await bookReviewRepository.fetchreviews(title);
    dev.log('buscou book revieew');
  }
}
