import 'package:delivery_app/global/models/restaurant.dart';
import 'package:flutter/material.dart';

import 'package:delivery_app/components/my_button.dart';
import 'package:delivery_app/global/models/food.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};

  DetailsScreen({
    super.key,
    required this.food,
  }) {
    /// Initialize selected addons to be false
    
    for (Addon addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
    
  }

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {


  // method to add to cart
  void addToCart(Food food, Map<Addon, bool> selectedAddons) {
    
    // close the current food page to go back to menu
    Navigator.pop(context);

    // format the selected addons
    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.food.availableAddons) {
      if (widget.selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }

    // add to cart
    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);

  }
  

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        // Scaffold UI
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
            
                /// Food Image
                Image.asset(
                  widget.food.imagePath, 
                  height: 350,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
            
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Food name
                      Text(
                        widget.food.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
            
                      /// Food price
                       Text(
                        '\$${widget.food.price.toString()}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.primary
                        ),
                      ),
                      const SizedBox(height: 10),
                      /// Food descrition
                      Text(widget.food.name),
                      const SizedBox(height: 10),
            
                      /// addons
                      Divider(color: Theme.of(context).colorScheme.secondary,),
            
                       const SizedBox(height: 10),
            
            
                      Text(
                        "Add-ons", 
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                        )
                      ),
                      
                      const SizedBox(height: 10),
                      
                     
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.tertiary
                          ),
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: widget.food.availableAddons.length,
                          itemBuilder: (context, index) {
                            // get individual addon
                            Addon addon = widget.food.availableAddons[index];
                                    
                            return CheckboxListTile(
                              title: Text(addon.name),
                              subtitle: Text(
                                '\$${addon.price.toString()}',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary
                                ),
                              ),
                              value: widget.selectedAddons[addon], 
                              onChanged: (bool? value){
                                setState(() {
                                  widget.selectedAddons[addon] = value!;
                                });
                              }
                            );
                          }
                        ),
                      )
                    ],
                  ),
                ),
            
                /// buton -> add to cart
                MyButton(
                  onTap: () => addToCart(widget.food, widget.selectedAddons),
                  text: 'Add to Cart'
                ),
        
                const SizedBox(height: 25,)
              ],
            ),
          ),
        ),
        
        /// Back button
        SafeArea(
          child: Opacity(
            opacity: 0.3,
            child: Container(
              margin: const EdgeInsets.only(left: 25),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle
              ),
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios_new_rounded)
              ),
            ),
          ),
        ),
      ],
    );
  }
}