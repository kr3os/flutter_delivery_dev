import 'package:flutter/material.dart';

import 'package:delivery_app/screens/cart/cart_core.dart';

class MySilverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;

  const MySilverAppBar({
    super.key, 
    required this.child, 
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      centerTitle: true,
      expandedHeight: 320,
      collapsedHeight: 120,
      actions: [
        /// Cart Button
        IconButton(
          onPressed: () {
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => const CartScreen() )
              );
            },
          icon: const Icon(Icons.shopping_cart)
        )
      ],
      backgroundColor: Theme.of(context).colorScheme.background,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text("Sunset Diner"),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: child,
        ),
        title: title,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}