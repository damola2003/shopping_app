import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopping_mall/components/cart_provider.dart';
// import 'package:shopping_mall/components/products.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;
    // final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];

          return ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(cartItem["imageUrl"] as String),
            ),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  // barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        "Delete Product",
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      content: Text(
                        "Are you sure you want to delete this item",
                        style: GoogleFonts.lato(
                          fontSize: 15,
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            context
                                .read<CartProvider>()
                                .removeProduct(cartItem);

                            Navigator.of(context).pop();
                          },
                          // style: TextButton.styleFrom(),
                          child: Text('Yes',
                              style: TextStyle(
                                  color: Colors.blue[600],
                                  fontWeight: FontWeight.bold)),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          // style: TextButton.styleFrom(),
                          child: Text(
                            'No',
                            style: TextStyle(
                                color: Colors.red[600],
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
            title: Text(
              cartItem["title"].toString(),
              style: GoogleFonts.lato(
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
            ),
            subtitle: Text(
              "Size: ${cartItem['sizes']}",
              style: GoogleFonts.lato(
                fontWeight: FontWeight.normal,
                fontSize: 16,
              ),
            ),
          );
        },
      ),
    );
  }
}
