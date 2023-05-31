import 'package:delcred_app/factory/inject.dart';
import 'package:delcred_app/view/best_sellers.dart';
import 'package:delcred_app/view/best_sellers_details.dart';
import 'package:delcred_app/view/book_reviews.dart';
import 'package:delcred_app/view/home.dart';
import 'package:delcred_app/view/themes/themes.dart';
import 'package:flutter/material.dart';

import 'env/env.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Env.instance.load();
  Inject.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: ligththeme,
      darkTheme: darktheme,
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const Home(),
        'bestsellers': (context) => const BestSellerScreen(),
        'bestsellersdetails': (context) => const BestSellerDetails(),
        'bookreviews': (context) => const BookReviewScreen(),
      },
    );
  }
}
