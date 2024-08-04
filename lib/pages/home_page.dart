import 'package:flutter/material.dart';
import 'package:shopping_mall/pages/cart_page.dart';
// // import 'package:google_fonts/google_fonts.dart';
// import 'package:shopping_mall/components/list_tile.dart';
// import 'package:shopping_mall/components/products.dart';
// import 'package:shopping_mall/pages/product_detail.dart';
// import 'package:shopping_mall/pages/product_tile.dart';
import 'package:shopping_mall/components/productlist_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  List<Widget> pages = [const ProductList(), const CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      // pages[currentPage],

      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        currentIndex: currentPage,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Cart")
        ],
      ),
    );
  }
}
