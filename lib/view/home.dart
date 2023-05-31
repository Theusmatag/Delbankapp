import 'package:delcred_app/controller/home_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/books_controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    BooksController booksController = Get.find();

    return LayoutBuilder(
        builder: (context, constraints) => Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Best Seller List',
                ),
              ),
              body: Obx(() => SizedBox(
                  height: constraints.maxHeight,
                  child: homeController.bestSellersList.value.isNotEmpty
                      ? ListView.builder(
                          itemCount:
                              homeController.bestSellersList.value.length,
                          itemBuilder: (context, index) {
                            var bestsellerlist = homeController.bestSellersList;
                            return InkWell(
                              onTap: () {
                                booksController.fetchBooksList(
                                  bestsellerlist
                                      .value[index].newestpublisheddate,
                                  homeController.bestSellersList.value[index]
                                      .listnameencoded,
                                );
                                Navigator.of(context).pushNamed(
                                  'bestsellers',
                                );
                              },
                              child: SizedBox(
                                height: constraints.maxHeight * 0.070,
                                child: Card(
                                  margin: const EdgeInsets.all(1),
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                  child: ListTile(
                                      title: Text(
                                    bestsellerlist.value[index].displayname,
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondary),
                                  )),
                                ),
                              ),
                            );
                          })
                      : const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        ))),
            ));
  }
}
