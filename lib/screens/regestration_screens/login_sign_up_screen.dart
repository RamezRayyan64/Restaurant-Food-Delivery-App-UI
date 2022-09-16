import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/constants/colors.dart';
import 'package:food_app/constants/lists.dart';
import 'package:food_app/constants/methods.dart';
import 'package:food_app/constants/modal_bottom_sheets.dart';
import 'package:food_app/screens/home_screens/main_screens/home_screen.dart';
import 'package:food_app/utilities/size_config.dart';
import 'package:food_app/widgets/regestration_widgets/rounded_elevated_button_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginSignUpScreen extends StatefulWidget {
  static const id = '/login_sign_up_screen';
  const LoginSignUpScreen({Key? key}) : super(key: key);

  @override
  State<LoginSignUpScreen> createState() => _LoginSignUpScreenState();
}

late TabController tabBarController;
String signUpfullname = '', signUpemail = '', signUpPassword = '';
String loginEmail = '', loginPassword = '';

class _LoginSignUpScreenState extends State<LoginSignUpScreen>
    with SingleTickerProviderStateMixin {
  var isOrientationPortrait = false;

  @override
  void initState() {
    super.initState();
    tabBarController =
        TabController(vsync: this, length: loginSignUpTabsList.length);
  }

  @override
  void dispose() {
    tabBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: ((context, orientation) {
      isOrientationPortrait = orientation == Orientation.portrait;
      return SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            body: Column(
              children: const [
                Expanded(
                  flex: 2,
                  child: ImageTabBarWidget(),
                ),
                Expanded(
                  flex: 3,
                  child: FormRegestrationWidget(),
                )
              ],
            ),
          ),
        ),
      );
    }));
  }
}

class FormRegestrationWidget extends StatelessWidget {
  const FormRegestrationWidget({
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
      child: TabBarView(
        controller: tabBarController,
        children: [
          LoginTabViewWidget(
            onChangeEmail: (value) {
              signUpemail = value;
            },
            onChangePassword: (value) {
              signUpPassword = value;
            },
            onPressedForgotPasswordButton: () {
              forgotPasswordModalSheet(context);
            },
            onPressedLoginButton: () async {
              SharedPreferences sharedPreferences =
                  await SharedPreferences.getInstance();
              sharedPreferences.setBool('user_logged_in_status', true);
              // ignore: use_build_context_synchronously
              Navigator.pushNamedAndRemoveUntil(
                  context, HomeScreen.id, (route) => false);
            },
          ),
          SignUpTabViewWidget(
            onChangeFullname: (value) {
              signUpfullname = value;
            },
            onChangeEmail: (value) {
              signUpemail = value;
            },
            onChangePassword: (value) {
              signUpPassword = value;
            },
            onPressedSignUpButton: () async {
              snackBarMessage(
                  context, 'Email verification link sent to your email');
              tabBarController.animateTo(0);
            },
          ),
        ],
      ),
    );
  }
}

class SignUpTabViewWidget extends StatelessWidget {
  final Function(String value) onChangeFullname;
  final Function(String value) onChangeEmail;
  final Function(String value) onChangePassword;
  final Function() onPressedSignUpButton;

  const SignUpTabViewWidget({
    Key? key,
    required this.onChangeFullname,
    required this.onChangeEmail,
    required this.onChangePassword,
    required this.onPressedSignUpButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              SizeConfig.setSizeHorizonaly(20),
              SizeConfig.setSizeHorizonaly(30),
              SizeConfig.setSizeHorizonaly(20),
              SizeConfig.setSizeHorizonaly(20)),
          child: Column(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                TextFieldFormWidget(
                    titleText: 'Fullname',
                    hintText: 'Enter your fullname',
                    keyboardType: TextInputType.text,
                    onChange: onChangeFullname,
                    isTextObsecure: false),
                SizedBox(
                  height: SizeConfig.setSizeVerticaly(10),
                ),
                TextFieldFormWidget(
                    titleText: 'Email',
                    hintText: 'Enter your email',
                    keyboardType: TextInputType.emailAddress,
                    onChange: onChangeEmail,
                    isTextObsecure: false),
                SizedBox(
                  height: SizeConfig.setSizeVerticaly(10),
                ),
                TextFieldFormWidget(
                    titleText: 'Password',
                    hintText: 'Enter your password',
                    keyboardType: TextInputType.text,
                    onChange: onChangePassword,
                    isTextObsecure: true),
              ]),
              SizedBox(
                height: SizeConfig.setSizeVerticaly(40),
              ),
              RoundedElevatedButtonWidget(
                  width: double.infinity,
                  text: 'Sign Up',
                  onPressed: onPressedSignUpButton)
            ],
          ),
        ));
  }
}

class ImageTabBarWidget extends StatelessWidget {
  const ImageTabBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(SizeConfig.setSizeHorizonaly(50)),
              bottomRight: Radius.circular(SizeConfig.setSizeHorizonaly(50))),
        ),
        child: Stack(
          children: [
            SvgPicture.asset(
              'assets/images/background.svg',
            ),
            Positioned(
              bottom: 0,
              left: 100,
              right: 100,
              child: SizedBox(
                height: SizeConfig.setSizeVerticaly(50),
                child: TabBar(
                  controller: tabBarController,
                  isScrollable: true,
                  labelStyle: TextStyle(
                      fontSize: SizeConfig.setSizeHorizonaly(20),
                      fontWeight: FontWeight.bold),
                  unselectedLabelStyle: TextStyle(
                      fontSize: SizeConfig.setSizeHorizonaly(20),
                      fontWeight: FontWeight.bold),
                  unselectedLabelColor: kGreyColor,
                  labelColor: kBlackColor,
                  indicatorColor: kPrimaryColor,
                  indicatorSize: TabBarIndicatorSize.values[1],
                  tabs: loginSignUpTabsList,
                ),
              ),
            )
          ],
        ));
  }
}

class LoginTabViewWidget extends StatelessWidget {
  final Function(String value) onChangeEmail;
  final Function(String value) onChangePassword;
  final Function() onPressedForgotPasswordButton;
  final Function() onPressedLoginButton;

  const LoginTabViewWidget({
    Key? key,
    required this.onChangeEmail,
    required this.onChangePassword,
    required this.onPressedLoginButton,
    required this.onPressedForgotPasswordButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              SizeConfig.setSizeHorizonaly(20),
              SizeConfig.setSizeHorizonaly(30),
              SizeConfig.setSizeHorizonaly(20),
              SizeConfig.setSizeHorizonaly(20)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TextFieldFormWidget(
                titleText: 'Email',
                hintText: 'Enter your email',
                isTextObsecure: false,
                keyboardType: TextInputType.text,
                onChange: onChangeEmail),
            SizedBox(
              height: SizeConfig.setSizeVerticaly(10),
            ),
            TextFieldFormWidget(
                titleText: 'Password',
                hintText: 'Enter your password',
                keyboardType: TextInputType.text,
                isTextObsecure: true,
                onChange: onChangePassword),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  onPressed: onPressedForgotPasswordButton,
                  child: Text(
                    'Forgot password',
                    style: TextStyle(
                      color: kGreyColor,
                      fontSize: SizeConfig.setSizeHorizonaly(24),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: SizeConfig.setSizeVerticaly(40),
            ),
            RoundedElevatedButtonWidget(
                width: double.infinity,
                text: 'Login',
                onPressed: onPressedLoginButton)
          ]),
        ));
  }
}

class RoundedTextFieldWidget extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  final bool isTextObsecure;
  final TextInputType keyboardType;

  const RoundedTextFieldWidget({
    Key? key,
    required this.hintText,
    required this.onChanged,
    required this.isTextObsecure,
    required this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: SizeConfig.setSizeVerticaly(10)),
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.setSizeHorizonaly(20),
          vertical: SizeConfig.setSizeVerticaly(5)),
      decoration: BoxDecoration(
          color: kSecondaryColor, borderRadius: BorderRadius.circular(20)),
      child: TextField(
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        obscureText: isTextObsecure,
        keyboardType: keyboardType,
        style: TextStyle(
            color: kBlackColor, fontSize: SizeConfig.setSizeHorizonaly(24)),
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
                color: kGreyColor, fontSize: SizeConfig.setSizeHorizonaly(24)),
            border: InputBorder.none),
      ),
    );
  }
}

class TextFieldFormWidget extends StatelessWidget {
  final String titleText;
  final String hintText;
  final bool isTextObsecure;
  final Function(String value) onChange;
  final TextInputType keyboardType;

  const TextFieldFormWidget({
    Key? key,
    required this.titleText,
    required this.hintText,
    required this.onChange,
    required this.isTextObsecure,
    required this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: SizeConfig.setSizeHorizonaly(10)),
          child: Text(
            titleText,
            style: TextStyle(
                color: kGreyColor, fontSize: SizeConfig.setSizeHorizonaly(24)),
          ),
        ),
        RoundedTextFieldWidget(
          hintText: hintText,
          isTextObsecure: isTextObsecure,
          keyboardType: keyboardType,
          onChanged: onChange,
        ),
      ],
    );
  }
}
