import 'package:flutter/material.dart';
import 'package:restaurant_food_delivery_app_ui/constants/colors.dart';
import 'package:restaurant_food_delivery_app_ui/constants/lists.dart';
import 'package:restaurant_food_delivery_app_ui/constants/methods.dart';
import 'package:restaurant_food_delivery_app_ui/models/item_model.dart';
import 'package:restaurant_food_delivery_app_ui/screens/home_screens/sub_screens/payment_screen.dart';
import 'package:restaurant_food_delivery_app_ui/utilities/size_config.dart';
import 'package:restaurant_food_delivery_app_ui/widgets/home_widgets/app_bar_title_widget.dart';
import 'package:restaurant_food_delivery_app_ui/widgets/home_widgets/back_button_widget.dart';
import 'package:restaurant_food_delivery_app_ui/widgets/home_widgets/purchase_items_widget.dart';

class MyCartScreen extends StatefulWidget {
  static const id = '/my_cart_screen';

  const MyCartScreen({Key? key}) : super(key: key);

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

num _totalPurchasePrice = 0;

class _MyCartScreenState extends State<MyCartScreen> {
  var isOrientationPortrait = false;

  num getTotalPurchasePrice() {
    for (int i = 0; i < myCartList.length; i++) {
      _totalPurchasePrice += myCartList[i].getItemTotalPurchasePrice();
    }
    return _totalPurchasePrice;
  }

  @override
  void initState() {
    super.initState();
    getTotalPurchasePrice();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: ((context, orientation) {
      isOrientationPortrait = orientation == Orientation.portrait;
      return WillPopScope(
          onWillPop: () {
            Navigator.pop(context);
            _totalPurchasePrice = 0;
            return Future.value(false);
          },
          child: SafeArea(
            child: Scaffold(
              backgroundColor: kSecondaryColor,
              appBar: AppBar(
                leading: BackIconButtonWidget(
                  onPressed: () {
                    Navigator.pop(context);
                    _totalPurchasePrice = 0;
                  },
                ),
                title: const AppBarTitleWidget(
                  titleText: 'My Cart',
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: MyCartItemsListWidget(
                      onPressedDeleteIcon: () {
                        snackBarMessage(
                            context, 'Item Removed from your My Card list');
                        setState(() {});
                      },
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: PurchaseitemsWidget(
                      totalPrice: '\$$_totalPurchasePrice',
                      buttonText: 'Next',
                      onPressed: () {
                        Navigator.pushNamed(context, PaymentScreen.id,
                            arguments: {
                              'totalPurchasePrice': _totalPurchasePrice
                            });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ));
    }));
  }
}

class MyCartItemsListWidget extends StatelessWidget {
  final Function() onPressedDeleteIcon;

  const MyCartItemsListWidget({
    Key? key,
    required this.onPressedDeleteIcon,
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
          children: List.generate(myCartList.length, (index) {
            return MyCartItemWidget(
              items: myCartList,
              index: index,
              onPressedDeleteIcon: () {
                onPressedDeleteIcon();
              },
            );
          }),
        ),
      ),
    );
  }
}

class MyCartItemWidget extends StatelessWidget {
  final List items;
  final int index;
  final Function() onPressedDeleteIcon;

  const MyCartItemWidget({
    Key? key,
    required this.items,
    required this.index,
    required this.onPressedDeleteIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: SizeConfig.setSizeVerticaly(20),
          bottom:
              index == items.length - 1 ? SizeConfig.setSizeVerticaly(20) : 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: SizeConfig.setSizeHorizonaly(100),
            height: SizeConfig.setSizeVerticaly(100),
            decoration: BoxDecoration(
              color: kSecondaryColor,
              borderRadius:
                  BorderRadius.circular(SizeConfig.setSizeHorizonaly(20)),
            ),
            child: Padding(
              padding: EdgeInsets.all(SizeConfig.setSizeHorizonaly(15)),
              child: Image(
                image: AssetImage((items[index] as ItemModel).getItemImage()),
              ),
            ),
          ),
          Text('${(items[index] as ItemModel).getItemPurchaseCount()}x'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                (items[index] as ItemModel).getItemName(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.setSizeHorizonaly(18)),
              ),
              SizedBox(
                height: SizeConfig.setSizeVerticaly(5),
              ),
              Text(
                getItemInfo((items[index] as ItemModel).getItemInfo(), index),
                style: const TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: SizeConfig.setSizeHorizonaly(5),
              ),
              Text(
                '\$${(items[index] as ItemModel).getItemTotalPurchasePrice()}',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: SizeConfig.setSizeHorizonaly(18),
                ),
              ),
            ],
          ),
          Container(
            width: SizeConfig.setSizeHorizonaly(40),
            height: SizeConfig.setSizeVerticaly(40),
            decoration: BoxDecoration(
              color: kSecondaryColor,
              borderRadius:
                  BorderRadius.circular(SizeConfig.setSizeHorizonaly(20)),
            ),
            child: IconButton(
              onPressed: () {
                _totalPurchasePrice -=
                    myCartList.elementAt(index).getItemTotalPurchasePrice();
                myCartList.removeAt(index);
                onPressedDeleteIcon();
              },
              icon: const Icon(
                Icons.delete_outlined,
                color: kBlackColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
