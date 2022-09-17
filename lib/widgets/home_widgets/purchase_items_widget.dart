import 'package:flutter/material.dart';
import 'package:restaurant_food_delivery_app_ui/constants/colors.dart';
import 'package:restaurant_food_delivery_app_ui/utilities/size_config.dart';
import 'package:restaurant_food_delivery_app_ui/widgets/regestration_widgets/rounded_elevated_button_widget.dart';

class PurchaseitemsWidget extends StatelessWidget {
  final String totalPrice;
  final String buttonText;
  final Function() onPressed;

  const PurchaseitemsWidget({
    Key? key,
    required this.totalPrice,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Total Price',
              style: TextStyle(
                  color: kBlackColor,
                  fontSize: SizeConfig.setSizeHorizonaly(18)),
            ),
            SizedBox(
              height: SizeConfig.setSizeVerticaly(10),
            ),
            Text(
              totalPrice,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: SizeConfig.setSizeHorizonaly(25)),
            ),
          ],
        ),
        RoundedElevatedButtonWidget(
          width: SizeConfig.setSizeHorizonaly(180),
          text: buttonText,
          onPressed: onPressed,
        ),
      ],
    );
  }
}
