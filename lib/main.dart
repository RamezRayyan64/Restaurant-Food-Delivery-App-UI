import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_food_delivery_app_ui/constants/colors.dart';
import 'package:restaurant_food_delivery_app_ui/screens/home_screens/sub_screens/home_item_details_screen.dart';
import 'package:restaurant_food_delivery_app_ui/screens/home_screens/main_screens/home_screen.dart';
import 'package:restaurant_food_delivery_app_ui/screens/home_screens/sub_screens/my_cart_screen.dart';
import 'package:restaurant_food_delivery_app_ui/screens/home_screens/sub_screens/payment_screen.dart';
import 'package:restaurant_food_delivery_app_ui/screens/home_screens/sub_screens/search_screen.dart';
import 'package:restaurant_food_delivery_app_ui/screens/home_screens/sub_screens/setting_screen.dart';
import 'package:restaurant_food_delivery_app_ui/screens/initial_screens/splash_screen.dart';
import 'package:restaurant_food_delivery_app_ui/screens/regestration_screens/login_sign_up_screen.dart';
import 'package:restaurant_food_delivery_app_ui/utilities/size_config.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: kBackgroundColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: kBackgroundColor,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: kBackgroundColor));
  runApp(LayoutBuilder(builder: (context, constraints) {
    return OrientationBuilder(builder: ((context, orientation) {
      SizeConfig().init(constraints, orientation);
      return const MyApp();
    }));
  }));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'JosefinSans',
          appBarTheme: const AppBarTheme(
            backgroundColor: kBackgroundColor,
            elevation: 0,
            centerTitle: true,
          ),
          scaffoldBackgroundColor: kBackgroundColor),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        LoginSignUpScreen.id: (context) => const LoginSignUpScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        MyCartScreen.id: (context) => const MyCartScreen(),
        SearchScreen.id: (context) => const SearchScreen(),
        PaymentScreen.id: (context) => const PaymentScreen(),
        SettingScreen.id: (context) => const SettingScreen(),
        HomeItemDetailsScreen.id: (context) => const HomeItemDetailsScreen(),
      },
    );
  }
}
