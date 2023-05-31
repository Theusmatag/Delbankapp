import 'package:delcred_app/model/books.dart';

abstract class BookRepository {
  Future<List<Books>> fetchbooks(String data, String name);
}
