
import 'package:delivery_app/components/my_quantity_selector.dart';
import 'package:delivery_app/global/models/cart_item.dart';
import 'package:delivery_app/global/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;

  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child ) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(8)
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // food image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        cartItem.food.imagePath, 
                        height: 100,
                        width: 100,
                      ),
                    ),
                    const SizedBox(width: 10),
                    // name and price
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                
                        Text(cartItem.food.name),
                
                        Text(
                          '\$${cartItem.food.price}',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary
                          ),
                        ),
                        const SizedBox(height: 10),
                         // increment or decrement quantity
                        MyQuantitySelector(
                          quantity: cartItem.quantity, 
                          food: cartItem.food, 
                          onDecrement: () {
                            restaurant.removeFromCart(cartItem);
                          },
                          onIncrement: () {
                            restaurant.addToCart(cartItem.food, cartItem.selectedAddons);
                          }, 
                        ),
                      ],
                    ),

                    const Spacer(),
                    
                  ],
                ),
              ),
              // addons
              SizedBox(
                height: cartItem.selectedAddons.isEmpty ? 0 : 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
                  children: cartItem.selectedAddons.map((addon) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: FilterChip(
                        backgroundColor: Theme.of(context).colorScheme.secondary,
                        shape: StadiumBorder(
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.primary
                          )
                        ),
                        labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontSize: 12
                        ),
                        label: Row(
                          children: [
                            // addon name
                            Text(addon.name),
                            // addon price
                            Text(' \$${addon.price}'),
                          ],
                        ), 
                        onSelected: (value) {}
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}