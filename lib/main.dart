import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_mall/components/cart_provider.dart';
import 'package:shopping_mall/pages/cart_page.dart';
// import 'package:shopping_mall/components/products.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_mall/pages/home_page.dart';
// import 'package:shopping_mall/pages/product_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(254, 206, 1, 1),
            primary: const Color.fromRGBO(254, 206, 1, 1),
          ),
        ),
        home: const HomePage(),
        routes: {
          "/home_page": (context) => const HomePage(),
          "/cart_page": (context) => const CartPage(),
        },
        // ProductDetailsPage(
        //   product: products[0],
        // ),
      ),
    );
  }
}
