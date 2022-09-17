import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:restaurant_food_delivery_app_ui/models/user_model.dart';

final referenceDatabase = FirebaseDatabase.instance.ref();
final firebaseAuth = FirebaseAuth.instance;

final UserModel userModel = UserModel.create(
    userID: 1,
    userImagePath: 'profile_pic',
    userFullname: 'Ramez A. Rayyan',
    userPhoneNumber: '786811941',
    userEmailAddress: 'Ramez.Rayyan64@gmail.com',
    userPaymentMethod: 'Master Card',
    userAddress: 'Herat, Bagh Azadi');
