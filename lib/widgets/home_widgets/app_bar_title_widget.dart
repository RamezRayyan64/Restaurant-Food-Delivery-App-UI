import 'package:flutter/material.dart';
import 'package:food_app/constants/colors.dart';
import 'package:food_app/utilities/size_config.dart';

class AppBarTitleWidget extends StatelessWidget {
  final String titleText;

  const AppBarTitleWidget({
    Key? key,
    required this.titleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      style: TextStyle(
          color: kBlackColor,
          fontSize: SizeConfig.setSizeHorizonaly(24),
          fontWeight: FontWeight.bold),
    );
  }
}
