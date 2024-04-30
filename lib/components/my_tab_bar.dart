import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/global/models/food.dart';

class MyTabBar extends StatelessWidget {

  final TabController tabController;

  const MyTabBar({
    super.key, 
    required this.tabController
  });
  
  List<Tab> _buildCategoryTabs() {
    return FoodCategory.values.map((category) {
      return Tab(
        text: category.toString().split('.').last,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: TabBar(
        controller: tabController,
        tabs: _buildCategoryTabs()
      ),
    );
  }
}