// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:delcred_app/controller/books_controller.dart';
import 'package:delcred_app/controller/reviews_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BestSellerScreen extends StatelessWidget {
  const BestSellerScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    BooksController booksController = Get.find();
    ReviewController reviewController = Get.find();
    return LayoutBuilder(
      builder: (context, constraints) => Scaffold(
        appBar: AppBar(title: const Text('Best Sellers')),
        body: Obx(() => SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: booksController.bestsellersbooks.value.isNotEmpty
                ? ListView.builder(
                    itemCount: booksController.bestsellersbooks.value.length,
                    itemBuilder: (context, index) {
                      var book = booksController.bestsellersbooks.value[index];
                      var navigator = Navigator.of(context);
                      return SizedBox(
                        height: constraints.maxHeight * 0.070,
                        child: InkWell(
                          onTap: () async {
                            await reviewController
                                .fetchBooksReviewsList(book.title);
                            navigator.pushNamed('bestsellersdetails',
                                arguments: book);
                          },
                          child: Card(
                            margin: const EdgeInsets.all(1),
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
                            child: ListTile(
                              leading: Hero(
                                tag: book.title,
                                child: CachedNetworkImage(
                                  imageUrl: book.bookImage,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    height: 50,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                              title: Text(
                                book.title,
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                    fontSize: 12),
                              ),
                              trailing: Text(
                                'Rank: ${book.rank.toString()}',
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                    fontSize: 10),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : const Center(
                    child: CircularProgressIndicator(
                    color: Colors.white,
                  )))),
      ),
    );
  }
}
