import 'package:flutter/material.dart';
import 'package:restaurant_food_delivery_app_ui/constants/colors.dart';
import 'package:restaurant_food_delivery_app_ui/constants/lists.dart';
import 'package:restaurant_food_delivery_app_ui/constants/variables.dart';
import 'package:restaurant_food_delivery_app_ui/screens/regestration_screens/login_sign_up_screen.dart';
import 'package:restaurant_food_delivery_app_ui/utilities/size_config.dart';
import 'package:restaurant_food_delivery_app_ui/widgets/regestration_widgets/rounded_elevated_button_widget.dart';

void forgotPasswordModalSheet(
  BuildContext context,
) {
  showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(SizeConfig.setSizeHorizonaly(40)),
        topRight: Radius.circular(SizeConfig.setSizeHorizonaly(40)),
      )),
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                SizeConfig.setSizeHorizonaly(20),
                SizeConfig.setSizeVerticaly(50),
                SizeConfig.setSizeHorizonaly(20),
                SizeConfig.setSizeHorizonaly(20)),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Forgot Password",
                    style: TextStyle(
                        color: kBlackColor,
                        fontSize: SizeConfig.setSizeHorizonaly(24),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: SizeConfig.setSizeVerticaly(20),
                  ),
                  TextFieldFormWidget(
                      titleText: 'Email',
                      hintText: 'Enter your email',
                      keyboardType: TextInputType.text,
                      onChange: (value) {},
                      isTextObsecure: false),
                  SizedBox(
                    height: SizeConfig.setSizeVerticaly(20),
                  ),
                  RoundedElevatedButtonWidget(
                      text: 'Send',
                      onPressed: () {
                        changePasswordModalSheet(context);
                      },
                      width: double.infinity)
                ],
              ),
            ),
          ),
        );
      });
}

void changePasswordModalSheet(BuildContext context) {
  showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(SizeConfig.setSizeHorizonaly(40)),
        topRight: Radius.circular(SizeConfig.setSizeHorizonaly(40)),
      )),
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                SizeConfig.setSizeHorizonaly(20),
                SizeConfig.setSizeVerticaly(50),
                SizeConfig.setSizeHorizonaly(20),
                SizeConfig.setSizeHorizonaly(20)),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Change Password",
                    style: TextStyle(
                        color: kBlackColor,
                        fontSize: SizeConfig.setSizeHorizonaly(24),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: SizeConfig.setSizeVerticaly(20),
                  ),
                  TextFieldFormWidget(
                      titleText: 'Old password',
                      hintText: 'Enter your old password',
                      keyboardType: TextInputType.text,
                      onChange: (value) {},
                      isTextObsecure: false),
                  SizedBox(
                    height: SizeConfig.setSizeVerticaly(10),
                  ),
                  TextFieldFormWidget(
                      titleText: 'Create new password',
                      hintText: 'Enter your new password',
                      keyboardType: TextInputType.text,
                      onChange: (value) {},
                      isTextObsecure: false),
                  SizedBox(
                    height: SizeConfig.setSizeVerticaly(10),
                  ),
                  TextFieldFormWidget(
                      titleText: 'Re-Enter new password',
                      hintText: 'Re-Enter your new password',
                      keyboardType: TextInputType.text,
                      onChange: (value) {},
                      isTextObsecure: false),
                  SizedBox(
                    height: SizeConfig.setSizeVerticaly(20),
                  ),
                  RoundedElevatedButtonWidget(
                      text: 'Save', onPressed: () {}, width: double.infinity)
                ],
              ),
            ),
          ),
        );
      });
}

void showProfileBottomSheet(BuildContext context) {
  showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(SizeConfig.setSizeHorizonaly(40)),
        topRight: Radius.circular(SizeConfig.setSizeHorizonaly(40)),
      )),
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                SizeConfig.setSizeHorizonaly(20),
                SizeConfig.setSizeVerticaly(50),
                SizeConfig.setSizeHorizonaly(20),
                SizeConfig.setSizeHorizonaly(20)),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: SizeConfig.setSizeVerticaly(150),
                    width: SizeConfig.setSizeHorizonaly(150),
                    child: Stack(fit: StackFit.expand, children: [
                      CircleAvatar(
                          backgroundImage:
                              AssetImage(userModel.getUserImagePath())),
                      Positioned(
                        bottom: SizeConfig.setSizeVerticaly(5),
                        right: SizeConfig.setSizeHorizonaly(5),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                              height: SizeConfig.setSizeVerticaly(35),
                              width: SizeConfig.setSizeHorizonaly(35),
                              decoration: BoxDecoration(
                                  border: Border.all(color: kPrimaryColor),
                                  color: kWhiteColor,
                                  borderRadius: BorderRadius.circular(
                                      SizeConfig.setSizeHorizonaly(50))),
                              child: Icon(
                                Icons.edit_rounded,
                                color: kPrimaryColor,
                                size: SizeConfig.setSizeHorizonaly(22),
                              )),
                        ),
                      )
                    ]),
                  ),
                  SizedBox(height: SizeConfig.setSizeVerticaly(15)),
                  Text(
                    userModel.getUserFullname(),
                    style: TextStyle(
                        fontSize: SizeConfig.setSizeHorizonaly(24),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: SizeConfig.setSizeVerticaly(30),
                  ),
                  Column(
                      children: List.generate(userProfileInfo.length, (index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: SizeConfig.setSizeVerticaly(10)),
                      child: ListTile(
                        leading: Container(
                            height: SizeConfig.setSizeVerticaly(50),
                            width: SizeConfig.setSizeHorizonaly(50),
                            decoration: BoxDecoration(
                                border: Border.all(color: kPrimaryColor),
                                borderRadius: BorderRadius.circular(20)),
                            child: Icon(
                              userProfileInfo[index]['icon'],
                              color: kPrimaryColor,
                            )),
                        title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(userProfileInfo[index]['title'],
                                  style: TextStyle(
                                      color: kGreyColor,
                                      fontSize:
                                          SizeConfig.setSizeHorizonaly(18))),
                              SizedBox(height: SizeConfig.setSizeVerticaly(10)),
                              Text(
                                userProfileInfo[index]['description'],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: SizeConfig.setSizeHorizonaly(18)),
                              ),
                            ]),
                        trailing: Container(
                          width: SizeConfig.setSizeHorizonaly(40),
                          height: SizeConfig.setSizeVerticaly(40),
                          decoration: BoxDecoration(
                            color: kSecondaryColor,
                            borderRadius: BorderRadius.circular(
                                SizeConfig.setSizeHorizonaly(20)),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.edit_rounded,
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                    );
                  })),
                  SizedBox(
                    height: SizeConfig.setSizeVerticaly(30),
                  ),
                  RoundedElevatedButtonWidget(
                      text: 'Log Out',
                      onPressed: () {},
                      width: double.infinity),
                ],
              ),
            ),
          ),
        );
      });
}
