import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:delivery_app/components/my_button.dart';
import 'package:delivery_app/components/my_cart_title.dart';

import 'package:delivery_app/screens/payment/payment_core.dart';

import 'package:delivery_app/global/models/restaurant.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child) {
      
      // cart 
      final userCart = restaurant.cart;

      // scaffold UI
      return Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            // clear all cart
            IconButton(
              onPressed: () {
                showDialog(
                  context: context, 
                  builder: (context) => AlertDialog(
                    title: const Text("Are you sure you want to clear the cart?"),
                    actions: [
                      // cancel button
                      TextButton(
                        onPressed: () => Navigator.pop(context), 
                        child: const Text('Cancel')
                      ),
                      // yes button
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          restaurant.clearCart();
                        }, 
                        child: const Text('Yes')
                      ),
                    ],
                  )
                );
              }, 
              icon: const Icon(Icons.delete)
            ),
          ],
        ),
        body: Column(
          children: [

            // List of Cart
            Expanded(
              child: Column(
                children: [
                  userCart.isEmpty 
                    ? const Expanded(
                      child: Center(
                        child: Text('Cart is empty')
                        )
                      ) 
                    : Expanded(
                    child: ListView.builder(
                      itemCount: userCart.length,
                      itemBuilder: (context, index) {
                    
                        // get individual cart item
                        final cartItem = userCart[index];
                    
                        // return cat title UI
                        return MyCartTile(cartItem: cartItem);
                      }
                    )
                  )
                ],
              ),
            ),
            // button to pay
            MyButton(
              onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => const PaymentScreen())
              ),
              text: 'Go to checkout'
            ),

            const SizedBox(height: 25)
          ],
        ),
      );
    });
  }
}