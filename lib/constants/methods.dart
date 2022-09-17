// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_food_delivery_app_ui/constants/colors.dart';
import 'package:restaurant_food_delivery_app_ui/constants/variables.dart';
import 'package:restaurant_food_delivery_app_ui/utilities/size_config.dart';

void snackBarMessage(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      elevation: 0,
      action: SnackBarAction(
          label: 'Close',
          textColor: kWhiteColor,
          onPressed: () {
            if (text.contains('Item added to your cart list')) {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              Navigator.pop(context);
            }
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          }),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      behavior: SnackBarBehavior.floating,
      backgroundColor: kPrimaryColor,
      content: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.setSizeHorizonaly(2.5),
            vertical: SizeConfig.setSizeVerticaly(5)),
        child: Text(
          text,
          style: TextStyle(
              fontSize: SizeConfig.setSizeHorizonaly(18),
              fontFamily: 'JosefinSans'),
        ),
      )));
}

Future<bool> createUserWithEmailAndPassword(BuildContext context,
    String fullname, String email, String password) async {
  try {
    await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .whenComplete(() {
      User? currentUser = firebaseAuth.currentUser!;
      currentUser.sendEmailVerification().whenComplete(() {
        currentUser.updateDisplayName(fullname);
      });
    });
    return true;
  } on FirebaseAuthException catch (e) {
    snackBarMessage(context, e.toString());
    return false;
  }
}

Future<bool> signInWithEmailAndPassword(
    BuildContext context, String emailAddress, String password) async {
  try {
    await firebaseAuth
        .signInWithEmailAndPassword(email: emailAddress, password: password)
        .whenComplete(() async {
      var user = firebaseAuth.currentUser;
      await user!.reload();
      if (!user.emailVerified) {
        snackBarMessage(context, 'Please verify your Email address');
        return;
      }
    });
    return true;
  } on FirebaseAuthException catch (e) {
    snackBarMessage(context, e.toString());
    return false;
  }
}

String getItemInfo(List itemsList, int index) {
  String itemInfo = '';
  for (int i = 0; i < itemsList.length; i++) {
    if (i != itemsList.length - 1) {
      itemInfo += '${itemsList[i]} ,';
      continue;
    }
    itemInfo += itemsList[i];
  }
  return itemInfo;
}
