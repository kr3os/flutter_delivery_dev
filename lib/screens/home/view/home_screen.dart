import 'package:flutter/material.dart';
import 'package:provider/provider.dart'
;
import 'package:delivery_app/components/my_description_box.dart';
import 'package:delivery_app/components/my_drawer.dart';
import 'package:delivery_app/components/my_food_tile.dart';
import 'package:delivery_app/components/my_sliver.dart';
import 'package:delivery_app/components/my_tab_bar.dart';
import 'package:delivery_app/screens/details/view/details_screen.dart';
import 'package:delivery_app/global/models/food.dart';
import 'package:delivery_app/global/models/restaurant.dart';
import 'package:delivery_app/components/my_current_location.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  /// TabBar controller
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: FoodCategory.values.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  /// Sort out and return list of food item that belong to a specific category
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  // return list of food in given category
  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {

      /// Get category menu
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);
      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          /// get individual food
          final food = categoryMenu[index];

          // return food tile UI
          return MyFoodTile(
            food: food,
            onTap: () => Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => DetailsScreen(food: food))
            ),
          );
      });
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySilverAppBar(
            title: MyTabBar(
              tabController: _tabController
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(indent: 25, endIndent: 25, color: Theme.of(context).colorScheme.secondary),
                /// My current Location
                const MyCurrentLocation(),
                /// Description Box
                const MyDescriptionBox(),
              ],
            ), 
          )
        ],
        body: Consumer<Restaurant>(
          builder: (context, restaurant, child) {
            return TabBarView(
              controller: _tabController,
              children: getFoodInThisCategory(restaurant.menu)
            );
          }
        )
      ),
    );
  }
}