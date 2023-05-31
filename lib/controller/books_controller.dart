import 'package:delcred_app/repository/book%20repository/book_repository.dart';
import 'package:delcred_app/repository/book%20repository/book_repository_imp.dart';
import 'package:get/get.dart';

class BooksController {
  Rx<List> bestsellersbooks = Rx([]);
  BookRepository bookRepository = BookRepositoryImp();
  Future<void> fetchBooksList(String data, String name) async {
    bestsellersbooks.value = await bookRepository.fetchbooks(data, name);
  }
}
