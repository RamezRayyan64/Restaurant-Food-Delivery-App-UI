// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:restaurant_food_delivery_app_ui/constants/colors.dart';
import 'package:restaurant_food_delivery_app_ui/screens/home_screens/main_screens/home_screen.dart';
import 'package:restaurant_food_delivery_app_ui/screens/regestration_screens/login_sign_up_screen.dart';
import 'package:restaurant_food_delivery_app_ui/utilities/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  static const id = '/splash_screen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var isOrientationPortrait = false;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      showedScreensStatus(context);
    });
    super.initState();
  }

  Future<void> showedScreensStatus(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getBool('user_logged_in_status') == true) {
      Navigator.pushNamedAndRemoveUntil(
          context, HomeScreen.id, (route) => false);
    } else {
      Navigator.pushNamedAndRemoveUntil(
          context, LoginSignUpScreen.id, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: ((context, orientation) {
      isOrientationPortrait = orientation == Orientation.portrait;
      return WillPopScope(
          onWillPop: () {
            return Future.value(false);
          },
          child: Scaffold(
            body: Center(
              child: Text(
                'FOOD APP',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: SizeConfig.setSizeHorizonaly(50),
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ));
    }));
  }
}
