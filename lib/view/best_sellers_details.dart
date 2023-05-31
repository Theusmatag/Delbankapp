import 'package:cached_network_image/cached_network_image.dart';

import 'package:delcred_app/model/books.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:url_launcher/url_launcher.dart';

import '../controller/reviews_controller.dart';

class BestSellerDetails extends StatelessWidget {
  const BestSellerDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Books;
    ReviewController reviewController = Get.find();
    return LayoutBuilder(
      builder: (context, constraints) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        appBar: AppBar(title: const Text('Best Seller Details')),
        body: SizedBox(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: constraints.maxHeight * 0.40,
                  width: constraints.maxWidth,
                  color: Theme.of(context).colorScheme.onPrimary,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Hero(
                      tag: args.title,
                      child: SizedBox(
                        height: constraints.maxHeight * 0.30,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: CachedNetworkImage(
                            imageUrl: args.bookImage,
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 50, left: 25, right: 25, bottom: 20),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Title'), Text('Rank')],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: constraints.maxWidth * 0.7,
                            child: Text(args.title,
                                style: Theme.of(context).textTheme.bodySmall),
                          ),
                          Text(args.rank.toString(),
                              style: Theme.of(context).textTheme.bodySmall)
                        ],
                      ),
                      SizedBox(height: constraints.maxHeight * 0.009),
                      SizedBox(
                        height: constraints.maxHeight * 0.020,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Description')],
                      ),
                      SizedBox(
                        width: constraints.maxWidth * 0.90,
                        child: Text(
                            textAlign: TextAlign.justify,
                            args.description,
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.050,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Author'), Text('Publisher')],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: constraints.maxWidth * 0.5,
                            child: Text(args.author,
                                style: Theme.of(context).textTheme.bodySmall),
                          ),
                          Text(
                            args.publisher,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 80,
                        ),
                        child: Obx(
                          () => Row(
                            mainAxisAlignment:
                                reviewController.bookreviewlist.value.isEmpty
                                    ? MainAxisAlignment.center
                                    : MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: 50,
                                width: 160,
                                child: ElevatedButton(
                                    onPressed: () async {
                                      if (!await launchUrl(
                                          Uri.parse(args.amazonProductUrl),
                                          mode: LaunchMode
                                              .externalApplication)) {}
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Icon(Icons.shopping_cart),
                                        Text(
                                          '\$${args.price}',
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary),
                                        ),
                                      ],
                                    )),
                              ),
                              Obx(
                                () => Visibility(
                                  visible: reviewController
                                      .bookreviewlist.value.isNotEmpty,
                                  child: SizedBox(
                                    height: 50,
                                    width: 160,
                                    child: OutlinedButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushNamed('bookreviews');
                                      },
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'Reviews',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          Icon(
                                            Icons.arrow_right_sharp,
                                            color: Colors.black,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
