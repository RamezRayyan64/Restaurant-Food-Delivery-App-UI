import 'package:flutter/material.dart';
import 'package:restaurant_food_delivery_app_ui/constants/variables.dart';
import 'package:restaurant_food_delivery_app_ui/models/item_model.dart';

List<ItemModel> sushiFoodsList = [
  ItemModel.createItem(
      itemID: 1,
      itemImage: 'chicken_1',
      itemName: 'Sake Roll',
      isFavoriteItem: true,
      itemInfo: ['hot', 'delicious', 'small'],
      itemDescription:
          'Sake Roll is produces bt a leavining process and converting strach into sugar. It may sound sample, but the entire process can take a few months.',
      itemPrice: 3,
      itemCaloryCount: 130,
      itemCookTime: [25, 30],
      itemVotes: 4.9,
      itemWeight: 300,
      itemPurchaseCount: 0,
      itemTotalPurchasePrice: 0),
  ItemModel.createItem(
      itemID: 2,
      itemImage: 'soup_1',
      itemName: 'Plain Soup',
      isFavoriteItem: false,
      itemInfo: ['hot', 'delicious', 'small'],
      itemDescription:
          'Plain Soup is produces bt a leavining process and converting strach into sugar. It may sound sample, but the entire process can take a few months.',
      itemPrice: 3.5,
      itemCaloryCount: 110,
      itemCookTime: [20, 25],
      itemVotes: 4.6,
      itemWeight: 400,
      itemPurchaseCount: 0,
      itemTotalPurchasePrice: 0),
  ItemModel.createItem(
      itemID: 3,
      itemImage: 'sushi_1',
      itemName: 'Maguro',
      isFavoriteItem: false,
      itemInfo: ['hot', 'delicious', 'small'],
      itemDescription:
          'Maguro is produces bt a leavining process and converting strach into sugar. It may sound sample, but the entire process can take a few months.',
      itemPrice: 4,
      itemCaloryCount: 120,
      itemCookTime: [15, 20],
      itemVotes: 4.7,
      itemWeight: 350,
      itemPurchaseCount: 0,
      itemTotalPurchasePrice: 0),
];

List<ItemModel> soupFoodList = [
  ItemModel.createItem(
      itemID: 4,
      itemImage: 'chicken_1',
      itemName: 'Sake Roll',
      isFavoriteItem: true,
      itemInfo: ['hot', 'delicious', 'small'],
      itemDescription:
          'Sake Roll is produces bt a leavining process and converting strach into sugar. It may sound sample, but the entire process can take a few months.',
      itemPrice: 3,
      itemCaloryCount: 130,
      itemCookTime: [25, 30],
      itemVotes: 4.9,
      itemWeight: 300,
      itemPurchaseCount: 0,
      itemTotalPurchasePrice: 0),
  ItemModel.createItem(
      itemID: 5,
      itemImage: 'soup_1',
      itemName: 'Plain Soup',
      isFavoriteItem: false,
      itemInfo: ['hot', 'delicious', 'small'],
      itemDescription:
          'Plain Soup is produces bt a leavining process and converting strach into sugar. It may sound sample, but the entire process can take a few months.',
      itemPrice: 3.5,
      itemCaloryCount: 110,
      itemCookTime: [20, 25],
      itemVotes: 4.6,
      itemWeight: 400,
      itemPurchaseCount: 0,
      itemTotalPurchasePrice: 0),
  ItemModel.createItem(
      itemID: 6,
      itemImage: 'sushi_1',
      itemName: 'Maguro',
      isFavoriteItem: true,
      itemInfo: ['hot', 'delicious', 'small'],
      itemDescription:
          'Maguro is produces bt a leavining process and converting strach into sugar. It may sound sample, but the entire process can take a few months.',
      itemPrice: 4,
      itemCaloryCount: 120,
      itemCookTime: [15, 20],
      itemVotes: 4.7,
      itemWeight: 350,
      itemPurchaseCount: 0,
      itemTotalPurchasePrice: 0),
];

List<ItemModel> chickenFoodsList = [
  ItemModel.createItem(
      itemID: 7,
      itemImage: 'chicken_1',
      itemName: 'Sake Roll',
      isFavoriteItem: false,
      itemInfo: ['hot', 'delicious', 'small'],
      itemDescription:
          'Sake Roll is produces bt a leavining process and converting strach into sugar. It may sound sample, but the entire process can take a few months.',
      itemPrice: 3,
      itemCaloryCount: 130,
      itemCookTime: [25, 30],
      itemVotes: 4.9,
      itemWeight: 300,
      itemPurchaseCount: 0,
      itemTotalPurchasePrice: 0),
  ItemModel.createItem(
      itemID: 8,
      itemImage: 'soup_1',
      itemName: 'Plain Soup',
      isFavoriteItem: false,
      itemInfo: ['hot', 'delicious', 'small'],
      itemDescription:
          'Plain Soup is produces bt a leavining process and converting strach into sugar. It may sound sample, but the entire process can take a few months.',
      itemPrice: 3.5,
      itemCaloryCount: 110,
      itemCookTime: [20, 25],
      itemVotes: 4.6,
      itemWeight: 400,
      itemPurchaseCount: 0,
      itemTotalPurchasePrice: 0),
  ItemModel.createItem(
      itemID: 9,
      itemImage: 'sushi_1',
      itemName: 'Maguro',
      isFavoriteItem: false,
      itemInfo: ['hot', 'delicious', 'small'],
      itemDescription:
          'Maguro is produces bt a leavining process and converting strach into sugar. It may sound sample, but the entire process can take a few months.',
      itemPrice: 4,
      itemCaloryCount: 120,
      itemCookTime: [15, 20],
      itemVotes: 4.7,
      itemWeight: 350,
      itemPurchaseCount: 0,
      itemTotalPurchasePrice: 0),
];

List<ItemModel> pastaFoodsList = [
  ItemModel.createItem(
      itemID: 10,
      itemImage: 'chicken_1',
      itemName: 'Sake Roll',
      isFavoriteItem: true,
      itemInfo: ['hot', 'delicious', 'small'],
      itemDescription:
          'Sake Roll is produces bt a leavining process and converting strach into sugar. It may sound sample, but the entire process can take a few months.',
      itemPrice: 3,
      itemCaloryCount: 130,
      itemCookTime: [25, 30],
      itemVotes: 4.9,
      itemWeight: 300,
      itemPurchaseCount: 0,
      itemTotalPurchasePrice: 0),
  ItemModel.createItem(
      itemID: 11,
      itemImage: 'soup_1',
      itemName: 'Plain Soup',
      isFavoriteItem: false,
      itemInfo: ['hot', 'delicious', 'small'],
      itemDescription:
          'Plain Soup is produces bt a leavining process and converting strach into sugar. It may sound sample, but the entire process can take a few months.',
      itemPrice: 3.5,
      itemCaloryCount: 110,
      itemCookTime: [20, 25],
      itemVotes: 4.6,
      itemWeight: 400,
      itemPurchaseCount: 0,
      itemTotalPurchasePrice: 0),
  ItemModel.createItem(
      itemID: 12,
      itemImage: 'sushi_1',
      itemName: 'Maguro',
      isFavoriteItem: false,
      itemInfo: ['hot', 'delicious', 'small'],
      itemDescription:
          'Maguro is produces bt a leavining process and converting strach into sugar. It may sound sample, but the entire process can take a few months.',
      itemPrice: 4,
      itemCaloryCount: 120,
      itemCookTime: [15, 20],
      itemVotes: 4.7,
      itemWeight: 350,
      itemPurchaseCount: 0,
      itemTotalPurchasePrice: 0),
];

List<ItemModel> kababFoodsList = [
  ItemModel.createItem(
      itemID: 13,
      itemImage: 'chicken_1',
      itemName: 'Sake Roll',
      isFavoriteItem: false,
      itemInfo: ['hot', 'delicious', 'small'],
      itemDescription:
          'Sake Roll is produces bt a leavining process and converting strach into sugar. It may sound sample, but the entire process can take a few months.',
      itemPrice: 3,
      itemCaloryCount: 130,
      itemCookTime: [25, 30],
      itemVotes: 4.9,
      itemWeight: 300,
      itemPurchaseCount: 0,
      itemTotalPurchasePrice: 0),
  ItemModel.createItem(
      itemID: 14,
      itemImage: 'soup_1',
      itemName: 'Plain Soup',
      isFavoriteItem: true,
      itemInfo: ['hot', 'delicious', 'small'],
      itemDescription:
          'Plain Soup is produces bt a leavining process and converting strach into sugar. It may sound sample, but the entire process can take a few months.',
      itemPrice: 3.5,
      itemCaloryCount: 110,
      itemCookTime: [20, 25],
      itemVotes: 4.6,
      itemWeight: 400,
      itemPurchaseCount: 0,
      itemTotalPurchasePrice: 0),
  ItemModel.createItem(
      itemID: 15,
      itemImage: 'sushi_1',
      itemName: 'Maguro',
      isFavoriteItem: false,
      itemInfo: ['hot', 'delicious', 'small'],
      itemDescription:
          'Maguro is produces bt a leavining process and converting strach into sugar. It may sound sample, but the entire process can take a few months.',
      itemPrice: 4,
      itemCaloryCount: 120,
      itemCookTime: [15, 20],
      itemVotes: 4.7,
      itemWeight: 350,
      itemPurchaseCount: 0,
      itemTotalPurchasePrice: 0),
];

List<ItemModel> pizzaFoodsList = [
  ItemModel.createItem(
      itemID: 16,
      itemImage: 'chicken_1',
      itemName: 'Sake Roll',
      isFavoriteItem: true,
      itemInfo: ['hot', 'delicious', 'small'],
      itemDescription:
          'Sake Roll is produces bt a leavining process and converting strach into sugar. It may sound sample, but the entire process can take a few months.',
      itemPrice: 3,
      itemCaloryCount: 130,
      itemCookTime: [25, 30],
      itemVotes: 4.9,
      itemWeight: 300,
      itemPurchaseCount: 0,
      itemTotalPurchasePrice: 0),
  ItemModel.createItem(
      itemID: 17,
      itemImage: 'soup_1',
      itemName: 'Plain Soup',
      isFavoriteItem: true,
      itemInfo: ['hot', 'delicious', 'small'],
      itemDescription:
          'Plain Soup is produces bt a leavining process and converting strach into sugar. It may sound sample, but the entire process can take a few months.',
      itemPrice: 3.5,
      itemCaloryCount: 110,
      itemCookTime: [20, 25],
      itemVotes: 4.6,
      itemWeight: 400,
      itemPurchaseCount: 0,
      itemTotalPurchasePrice: 0),
  ItemModel.createItem(
      itemID: 18,
      itemImage: 'sushi_1',
      itemName: 'Maguro',
      isFavoriteItem: true,
      itemInfo: ['hot', 'delicious', 'small'],
      itemDescription:
          'Maguro is produces bt a leavining process and converting strach into sugar. It may sound sample, but the entire process can take a few months.',
      itemPrice: 4,
      itemCaloryCount: 120,
      itemCookTime: [15, 20],
      itemVotes: 4.7,
      itemWeight: 350,
      itemPurchaseCount: 0,
      itemTotalPurchasePrice: 0),
];

List<ItemModel> saladFoodsList = [
  ItemModel.createItem(
      itemID: 19,
      itemImage: 'chicken_1',
      itemName: 'Sake Roll',
      isFavoriteItem: false,
      itemInfo: ['hot', 'delicious', 'small'],
      itemDescription:
          'Sake Roll is produces bt a leavining process and converting strach into sugar. It may sound sample, but the entire process can take a few months.',
      itemPrice: 3,
      itemCaloryCount: 130,
      itemCookTime: [25, 30],
      itemVotes: 4.9,
      itemWeight: 300,
      itemPurchaseCount: 0,
      itemTotalPurchasePrice: 0),
  ItemModel.createItem(
      itemID: 20,
      itemImage: 'soup_1',
      itemName: 'Plain Soup',
      isFavoriteItem: false,
      itemInfo: ['hot', 'delicious', 'small'],
      itemDescription:
          'Plain Soup is produces bt a leavining process and converting strach into sugar. It may sound sample, but the entire process can take a few months.',
      itemPrice: 3.5,
      itemCaloryCount: 110,
      itemCookTime: [20, 25],
      itemVotes: 4.6,
      itemWeight: 400,
      itemPurchaseCount: 0,
      itemTotalPurchasePrice: 0),
  ItemModel.createItem(
      itemID: 21,
      itemImage: 'sushi_1',
      itemName: 'Maguro',
      isFavoriteItem: false,
      itemInfo: ['hot', 'delicious', 'small'],
      itemDescription:
          'Maguro is produces bt a leavining process and converting strach into sugar. It may sound sample, but the entire process can take a few months.',
      itemPrice: 4,
      itemCaloryCount: 120,
      itemCookTime: [15, 20],
      itemVotes: 4.7,
      itemWeight: 350,
      itemPurchaseCount: 0,
      itemTotalPurchasePrice: 0),
];

List<ItemModel> meatFoodsList = [
  ItemModel.createItem(
      itemID: 22,
      itemImage: 'chicken_1',
      itemName: 'Sake Roll',
      isFavoriteItem: true,
      itemInfo: ['hot', 'delicious', 'small'],
      itemDescription:
          'Sake Roll is produces bt a leavining process and converting strach into sugar. It may sound sample, but the entire process can take a few months.',
      itemPrice: 3,
      itemCaloryCount: 130,
      itemCookTime: [25, 30],
      itemVotes: 4.9,
      itemWeight: 300,
      itemPurchaseCount: 0,
      itemTotalPurchasePrice: 0),
  ItemModel.createItem(
      itemID: 23,
      itemImage: 'soup_1',
      itemName: 'Plain Soup',
      isFavoriteItem: false,
      itemInfo: ['hot', 'delicious', 'small'],
      itemDescription:
          'Plain Soup is produces bt a leavining process and converting strach into sugar. It may sound sample, but the entire process can take a few months.',
      itemPrice: 3.5,
      itemCaloryCount: 110,
      itemCookTime: [20, 25],
      itemVotes: 4.6,
      itemWeight: 400,
      itemPurchaseCount: 0,
      itemTotalPurchasePrice: 0),
  ItemModel.createItem(
      itemID: 24,
      itemImage: 'sushi_1',
      itemName: 'Maguro',
      isFavoriteItem: true,
      itemInfo: ['hot', 'delicious', 'small'],
      itemDescription:
          'Maguro is produces bt a leavining process and converting strach into sugar. It may sound sample, but the entire process can take a few months.',
      itemPrice: 4,
      itemCaloryCount: 120,
      itemCookTime: [15, 20],
      itemVotes: 4.7,
      itemWeight: 350,
      itemPurchaseCount: 0,
      itemTotalPurchasePrice: 0),
];

List<ItemModel> items = [
  ItemModel.createItem(
      itemID: 25,
      itemImage: 'chicken_1',
      itemName: 'Sake Roll',
      isFavoriteItem: false,
      itemInfo: ['hot', 'delicious', 'small'],
      itemDescription:
          'Sake Roll is produces bt a leavining process and converting strach into sugar. It may sound sample, but the entire process can take a few months.',
      itemPrice: 3,
      itemCaloryCount: 130,
      itemCookTime: [25, 30],
      itemVotes: 4.9,
      itemWeight: 300,
      itemPurchaseCount: 0,
      itemTotalPurchasePrice: 0),
  ItemModel.createItem(
      itemID: 26,
      itemImage: 'soup_1',
      itemName: 'Plain Soup',
      isFavoriteItem: false,
      itemInfo: ['hot', 'delicious', 'small'],
      itemDescription:
          'Plain Soup is produces bt a leavining process and converting strach into sugar. It may sound sample, but the entire process can take a few months.',
      itemPrice: 3.5,
      itemCaloryCount: 110,
      itemCookTime: [20, 25],
      itemVotes: 4.6,
      itemWeight: 400,
      itemPurchaseCount: 0,
      itemTotalPurchasePrice: 0),
  ItemModel.createItem(
      itemID: 27,
      itemImage: 'sushi_1',
      itemName: 'Maguro',
      isFavoriteItem: false,
      itemInfo: ['hot', 'delicious', 'small'],
      itemDescription:
          'Maguro is produces bt a leavining process and converting strach into sugar. It may sound sample, but the entire process can take a few months.',
      itemPrice: 4,
      itemCaloryCount: 120,
      itemCookTime: [15, 20],
      itemVotes: 4.7,
      itemWeight: 350,
      itemPurchaseCount: 0,
      itemTotalPurchasePrice: 0),
];

const List settingItemsList = [
  {
    'itemName': 'Favorite',
    'itemIcon': Icons.favorite_rounded,
  },
  {
    'itemName': 'Payment Methods',
    'itemIcon': Icons.credit_card_rounded,
  },
  {
    'itemName': 'My Order',
    'itemIcon': Icons.shopping_bag_rounded,
  },
  {
    'itemName': 'History',
    'itemIcon': Icons.history_rounded,
  },
  {
    'itemName': 'Complain',
    'itemIcon': Icons.mode_comment_rounded,
  },
  {
    'itemName': 'Privacy Policy',
    'itemIcon': Icons.insert_drive_file_rounded,
  },
];

final List<Tab> loginSignUpTabsList = [
  const Tab(text: 'Login'),
  const Tab(text: 'Sign Up'),
];

final List<Tab> homeTabsList = [
  const Tab(text: 'Sushi'),
  const Tab(text: 'Soup'),
  const Tab(text: 'Chicken'),
  const Tab(text: 'Pasta'),
  const Tab(text: 'Kabab'),
  const Tab(text: 'Pizza'),
  const Tab(text: 'Salad'),
  const Tab(text: 'Meat'),
];

final List<ItemModel> myCartList = [
  ItemModel.addToMyCartListfromMap(sushiFoodsList[0].toMap())
];

List userProfileInfo = [
  {
    'icon': Icons.phone_rounded,
    'title': 'Phone number',
    'description': userModel.getUserPhoneNumber(),
  },
  {
    'icon': Icons.email_rounded,
    'title': 'Email',
    'description': userModel.getUserEmailAddress(),
  },
  {
    'icon': Icons.credit_card_rounded,
    'title': 'Payment Methods',
    'description': userModel.getUserPaymentMethod(),
  },
  {
    'icon': Icons.location_on_rounded,
    'title': 'Address',
    'description': userModel.getUserAddress(),
  },
];

List paymentMethods = [
  {'paymentMethodName': 'Credit Card', 'paymentMethodImage': 'master_card.svg'},
  {'paymentMethodName': 'PayPal', 'paymentMethodImage': 'paypal.svg'},
  {'paymentMethodName': 'Google Pay', 'paymentMethodImage': 'google_pay.svg'},
];
