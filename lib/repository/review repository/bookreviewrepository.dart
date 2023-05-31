import 'package:delcred_app/model/review.dart';

abstract class BookReviewRepository {
  Future<List<ReviewBooks>> fetchreviews(String title);
}
