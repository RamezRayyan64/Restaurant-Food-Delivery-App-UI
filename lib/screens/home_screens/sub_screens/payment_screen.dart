import 'package:flutter/material.dart';
import 'package:restaurant_food_delivery_app_ui/constants/colors.dart';
import 'package:restaurant_food_delivery_app_ui/constants/lists.dart';
import 'package:restaurant_food_delivery_app_ui/utilities/size_config.dart';
import 'package:restaurant_food_delivery_app_ui/widgets/home_widgets/app_bar_title_widget.dart';
import 'package:restaurant_food_delivery_app_ui/widgets/home_widgets/back_button_widget.dart';
import 'package:restaurant_food_delivery_app_ui/widgets/home_widgets/purchase_items_widget.dart';

class PaymentScreen extends StatefulWidget {
  static const id = '/payment_screen';

  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

int groupvalue = 0;
int radioButtonIndex = 0;
num totalPurchasePrice = 0;

class _PaymentScreenState extends State<PaymentScreen> {
  var isOrientationPortrait = false;
  // ignore: prefer_typing_uninitialized_variables
  var map;

  @override
  Widget build(BuildContext context) {
    map = ModalRoute.of(context)!.settings.arguments;
    totalPurchasePrice = map['totalPurchasePrice'];
    return OrientationBuilder(builder: ((context, orientation) {
      isOrientationPortrait = orientation == Orientation.portrait;
      return WillPopScope(
          onWillPop: () {
            Navigator.pop(context);
            groupvalue = 0;
            radioButtonIndex = 0;
            return Future.value(false);
          },
          child: SafeArea(
            child: Scaffold(
              backgroundColor: kSecondaryColor,
              appBar: AppBar(
                leading: BackIconButtonWidget(
                  onPressed: () {
                    Navigator.pop(context);
                    groupvalue = 0;
                    radioButtonIndex = 0;
                  },
                ),
                title: const AppBarTitleWidget(
                  titleText: 'Payment',
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: PaymentsListWidget(
                      paymentMethods: paymentMethods,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: PurchaseitemsWidget(
                      totalPrice: '\$$totalPurchasePrice',
                      buttonText: 'Order Now',
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ));
    }));
  }
}

class PaymentsListWidget extends StatefulWidget {
  final List paymentMethods;

  const PaymentsListWidget({
    Key? key,
    required this.paymentMethods,
  }) : super(key: key);

  @override
  State<PaymentsListWidget> createState() => _PaymentsListWidgetState();
}

class _PaymentsListWidgetState extends State<PaymentsListWidget> {
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
          children: [
            PaymentMethodWidgets(
              onChange: (int? value) {
                setState(() {
                  groupvalue = value!;
                });
              },
            ),
            SizedBox(height: SizeConfig.setSizeVerticaly(30)),
            const CoppucCodeWidget(),
            SizedBox(height: SizeConfig.setSizeVerticaly(100)),
            const TransactionWidget(),
          ],
        ),
      ),
    );
  }
}

class PaymentMethodWidgets extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final onChange;

  const PaymentMethodWidgets({Key? key, this.onChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(items.length, (index) {
        return PaymentsItemWidget(
          items: items,
          index: index,
          groupValue: groupvalue,
          onChanged: onChange,
        );
      }),
    );
  }
}

class PaymentsItemWidget extends StatelessWidget {
  final List items;
  final int index;
  final int groupValue;
  // ignore: prefer_typing_uninitialized_variables
  final onChanged;

  const PaymentsItemWidget({
    Key? key,
    required this.items,
    required this.index,
    required this.groupValue,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: SizeConfig.setSizeVerticaly(20),
          bottom:
              index == items.length - 1 ? SizeConfig.setSizeVerticaly(20) : 0),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: SizeConfig.setSizeHorizonaly(20)),
        child: Container(
          height: SizeConfig.setSizeVerticaly(75),
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.setSizeHorizonaly(20)),
          decoration: BoxDecoration(
            border: Border.all(
                width: SizeConfig.setSizeHorizonaly(0.5), color: kGreyColor),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: SizeConfig.setSizeHorizonaly(50),
                height: SizeConfig.setSizeVerticaly(50),
                decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius:
                      BorderRadius.circular(SizeConfig.setSizeHorizonaly(20)),
                ),
                child: Image.asset(
                    'assets/payment_methods/${paymentMethods[index]['paymentMethodImage']}'),
              ),
              SizedBox(
                width: SizeConfig.setSizeHorizonaly(30),
              ),
              Text(
                paymentMethods[index]['paymentMethodName'],
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.setSizeHorizonaly(22)),
              ),
              const Spacer(),
              Radio(
                value: index,
                groupValue: groupValue,
                onChanged: onChanged,
                fillColor: MaterialStateProperty.all(kPrimaryColor),
                overlayColor: MaterialStateProperty.all(kSecondaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CoppucCodeWidget extends StatelessWidget {
  const CoppucCodeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: SizeConfig.setSizeHorizonaly(25),
            ),
            Text(
              "Add cupoccino",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: SizeConfig.setSizeHorizonaly(24)),
            ),
          ],
        ),
        SizedBox(
          height: SizeConfig.setSizeVerticaly(10),
        ),
        Container(
          height: SizeConfig.setSizeVerticaly(75),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
                width: SizeConfig.setSizeHorizonaly(0.5), color: kGreyColor),
            borderRadius:
                BorderRadius.circular(SizeConfig.setSizeHorizonaly(20)),
            color: kSecondaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: SizeConfig.setSizeHorizonaly(20),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Copucc Code",
                    style:
                        TextStyle(fontSize: SizeConfig.setSizeHorizonaly(18)),
                  ),
                  SizedBox(
                    height: SizeConfig.setSizeVerticaly(10),
                  ),
                  Text(
                    "FastDelivery/3745",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.setSizeHorizonaly(20)),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(SizeConfig.setSizeHorizonaly(20)),
                  color: kBackgroundColor,
                ),
                height: SizeConfig.setSizeVerticaly(50),
                width: SizeConfig.setSizeHorizonaly(50),
                child: IconButton(
                  onPressed: () {},
                  color: kGreyColor,
                  icon: const Icon(Icons.calendar_today_rounded),
                ),
              ),
              SizedBox(
                width: SizeConfig.setSizeHorizonaly(20),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TransactionWidget extends StatelessWidget {
  const TransactionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: SizeConfig.setSizeHorizonaly(25),
        ),
        Text(
          "Transaction",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: SizeConfig.setSizeHorizonaly(24)),
        ),
        const Spacer(),
        Text(
          "\$$totalPurchasePrice",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: SizeConfig.setSizeHorizonaly(24)),
        ),
        SizedBox(
          width: SizeConfig.setSizeHorizonaly(25),
        ),
      ],
    );
  }
}
