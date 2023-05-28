import 'package:delcred_app/view/bestsellers.dart';
import 'package:delcred_app/view/bookreviews.dart';
import 'package:delcred_app/view/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: TextTheme(
            titleLarge: GoogleFonts.openSans(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
          )),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const Home(),
        'bestsellers': (context) => const BestSellers(),
        'bookreviews': (context) => const BookReviews()
      },
    );
  }
}
