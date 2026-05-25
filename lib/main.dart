import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'portfolio_page.dart';
import 'screens/projects_page.dart';
import 'screens/products_page.dart';
import 'screens/sessions_page.dart';
import 'screens/reviews_page.dart';
import 'screens/hire_me_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shivam Gupta — Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFEF9F27),
          surface: const Color(0xFFFAFAFA),
        ),
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const PortfolioPage(),
        '/projects': (context) => const ProjectsPage(),
        '/products': (context) => const ProductsPage(),
        '/sessions': (context) => const SessionsPage(),
        '/reviews': (context) => const ReviewsPage(),
        '/hire': (context) => const HireMePage(),
      },
    );
  }
}
