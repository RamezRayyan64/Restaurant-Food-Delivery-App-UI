import 'package:flutter/material.dart';
import 'package:restaurant_food_delivery_app_ui/constants/colors.dart';
import 'package:restaurant_food_delivery_app_ui/utilities/size_config.dart';

class RoundedElevatedButtonWidget extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final double width;

  const RoundedElevatedButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: SizeConfig.setSizeVerticaly(50),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(SizeConfig.setSizeHorizonaly(20)),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
              fontSize: SizeConfig.setSizeHorizonaly(20),
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
