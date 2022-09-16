import 'package:flutter/material.dart';
import 'package:food_app/constants/colors.dart';

class BackIconButtonWidget extends StatelessWidget {
  final Function() onPressed;

  const BackIconButtonWidget({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Icons.arrow_back_ios,
          color: kBlackColor,
        ));
  }
}
