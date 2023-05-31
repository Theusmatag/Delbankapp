import 'package:delcred_app/controller/reviews_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class BookReviewScreen extends StatelessWidget {
  const BookReviewScreen({super.key});
  @override
  Widget build(BuildContext context) {
    ReviewController reviewController = Get.find();
    return LayoutBuilder(
      builder: (context, constraints) => Scaffold(
        appBar: AppBar(title: const Text('Reviews List')),
        body: Obx(() => SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: reviewController.bookreviewlist.value.isNotEmpty
                ? ListView.builder(
                    itemCount: reviewController.bookreviewlist.value.length,
                    itemBuilder: (context, index) {
                      var reviews =
                          reviewController.bookreviewlist.value[index];
                      return SizedBox(
                        height: constraints.maxHeight * 0.070,
                        child: InkWell(
                          onTap: () async {
                            if (!await launchUrl(Uri.parse(reviews.url),
                                mode: LaunchMode.externalApplication)) {}
                          },
                          child: Card(
                            margin: const EdgeInsets.all(1),
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
                            child: ListTile(
                              title: Text(
                                reviews.byline,
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                    fontSize: 12),
                              ),
                              trailing: Text(
                                reviews.publicationdt,
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
                : const Center(child: Text('Review not found !')))),
      ),
    );
  }
}
