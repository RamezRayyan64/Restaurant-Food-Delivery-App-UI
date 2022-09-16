import 'package:flutter/material.dart';
import 'package:food_app/models/item_model.dart';
import 'package:food_app/screens/home_screens/main_screens/home_screen.dart';

class TabBarViewItems extends StatelessWidget {
  final List<ItemModel> itemsList;
  final Color color;

  const TabBarViewItems({
    Key? key,
    required this.itemsList,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
          children: List.generate(
        itemsList.length,
        (index) {
          return FoodItemWidgets(
            itemsList: itemsList,
            color: color,
            index: index,
          );
        },
      )),
    );
  }
}
