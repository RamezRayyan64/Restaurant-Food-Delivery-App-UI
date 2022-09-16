import 'package:flutter/material.dart';
import 'package:food_app/constants/colors.dart';
import 'package:food_app/constants/lists.dart';
import 'package:food_app/screens/regestration_screens/login_sign_up_screen.dart';
import 'package:food_app/utilities/size_config.dart';
import 'package:food_app/widgets/home_widgets/app_bar_title_widget.dart';
import 'package:food_app/widgets/home_widgets/back_button_widget.dart';
import 'package:food_app/widgets/regestration_widgets/rounded_elevated_button_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatefulWidget {
  static const id = '/setting_screen';
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  var isOrientationPortrait = false;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: ((context, orientation) {
      isOrientationPortrait = orientation == Orientation.portrait;
      return WillPopScope(
          onWillPop: () {
            Navigator.pop(context);
            return Future.value(false);
          },
          child: SafeArea(
            child: Scaffold(
              backgroundColor: kSecondaryColor,
              appBar: AppBar(
                leading: BackIconButtonWidget(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                title: const AppBarTitleWidget(
                  titleText: 'Setting',
                ),
                centerTitle: true,
              ),
              body: Column(
                children: const [
                  Expanded(
                    flex: 4,
                    child: SettingItemsWidget(),
                  ),
                  Expanded(
                    flex: 1,
                    child: LogOutButtonWidget(),
                  ),
                ],
              ),
            ),
          ));
    }));
  }
}

class SettingItemsWidget extends StatelessWidget {
  const SettingItemsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(SizeConfig.setSizeHorizonaly(50)),
          bottomRight: Radius.circular(SizeConfig.setSizeHorizonaly(50)),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(settingItemsList.length, (index) {
            return GestureDetector(
                onTap: () {},
                child: SettingItemWidget(
                  index: index,
                ));
          }),
        ),
      ),
    );
  }
}

class SettingItemWidget extends StatelessWidget {
  final int index;

  const SettingItemWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: SizeConfig.setSizeHorizonaly(20),
        top: SizeConfig.setSizeVerticaly(20),
        bottom: index == settingItemsList.length - 1
            ? SizeConfig.setSizeVerticaly(20)
            : 0,
        right: SizeConfig.setSizeHorizonaly(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: SizeConfig.setSizeHorizonaly(50),
            height: SizeConfig.setSizeVerticaly(50),
            decoration: BoxDecoration(
              color: kSecondaryColor,
              borderRadius:
                  BorderRadius.circular(SizeConfig.setSizeHorizonaly(20)),
            ),
            child: Padding(
              padding: EdgeInsets.all(SizeConfig.setSizeHorizonaly(15)),
              child: Icon(
                settingItemsList[index]['itemIcon'],
                color: kPrimaryColor,
              ),
            ),
          ),
          SizedBox(
            width: SizeConfig.setSizeHorizonaly(20),
          ),
          Text(
            settingItemsList[index]['itemName'],
            style: TextStyle(fontSize: SizeConfig.setSizeHorizonaly(22)),
          ),
          const Spacer(),
          Container(
            width: SizeConfig.setSizeHorizonaly(40),
            height: SizeConfig.setSizeVerticaly(40),
            decoration: BoxDecoration(
              color: kSecondaryColor,
              borderRadius:
                  BorderRadius.circular(SizeConfig.setSizeHorizonaly(20)),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward_ios_rounded,
                color: kPrimaryColor,
                size: SizeConfig.setSizeHorizonaly(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LogOutButtonWidget extends StatelessWidget {
  const LogOutButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: SizeConfig.setSizeHorizonaly(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RoundedElevatedButtonWidget(
            width: double.infinity,
            text: 'Log out',
            onPressed: () async {
              SharedPreferences sharedPreferences =
                  await SharedPreferences.getInstance();
              sharedPreferences.setBool('user_logged_in_status', true);
              // ignore: use_build_context_synchronously
              Navigator.pushNamedAndRemoveUntil(
                  context, LoginSignUpScreen.id, (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
