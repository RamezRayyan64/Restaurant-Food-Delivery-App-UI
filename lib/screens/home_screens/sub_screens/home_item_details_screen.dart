import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/constants/colors.dart';
import 'package:food_app/constants/lists.dart';
import 'package:food_app/constants/methods.dart';
import 'package:food_app/models/item_model.dart';
import 'package:food_app/utilities/size_config.dart';
import 'package:food_app/widgets/home_widgets/purchase_items_widget.dart';

class HomeItemDetailsScreen extends StatefulWidget {
  static String id = "/home_item_details";

  const HomeItemDetailsScreen({Key? key}) : super(key: key);

  @override
  State<HomeItemDetailsScreen> createState() => _HomeItemDetailsScreenState();
}

num _totalPrice = 0;
num _totalItemPurchaseCount = 0;
bool _isItemFavorite = false;

class _HomeItemDetailsScreenState extends State<HomeItemDetailsScreen> {
  // ignore: prefer_typing_uninitialized_variables
  var map;
  ItemModel itemModel = ItemModel.init();

  @override
  Widget build(BuildContext context) {
    map = ModalRoute.of(context)!.settings.arguments;
    itemModel = map['itemModel'];
    _isItemFavorite = itemModel.getIsFavoriteItem();
    return SafeArea(
      child: Scaffold(
        backgroundColor: kSecondaryColor,
        body: Column(
          children: [
            Expanded(
              flex: 4,
              child: ItemDetailWidget(
                itemModel: itemModel,
                onPressedAddToFavorites: () {
                  setState(() {
                    _isItemFavorite = !_isItemFavorite;
                    itemModel.setIsFavoriteItem(_isItemFavorite);
                  });
                },
                onPressedMinimize: () {
                  setState(() {
                    if (_totalItemPurchaseCount != 0) {
                      _totalItemPurchaseCount -= 1;
                      _totalPrice -= itemModel.getItemPrice();
                    }
                  });
                },
                onPressedAdd: () {
                  setState(() {
                    if (_totalItemPurchaseCount != 100) {
                      _totalItemPurchaseCount += 1;
                      _totalPrice += itemModel.getItemPrice();
                    }
                  });
                },
                onPressedBack: () {
                  _isItemFavorite = false;
                  _totalItemPurchaseCount = 0;
                  _totalPrice = 0;
                  Navigator.pop(context);
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: PurchaseitemsWidget(
                totalPrice: '\$$_totalPrice',
                buttonText: 'Add to Cart',
                onPressed: () {
                  if (_totalItemPurchaseCount != 0) {
                    ItemModel currentItemModel =
                        ItemModel.addToMyCartfromMap(itemModel.toMap());
                    currentItemModel
                        .setItemPurchaseCount(_totalItemPurchaseCount);
                    currentItemModel.setItemTotalPurchasePrice(_totalPrice);
                    myCartList.add(currentItemModel);
                    snackBarMessage(context, 'Item added to your cart list');
                    _totalItemPurchaseCount = 0;
                    _totalPrice = 0;
                    return;
                  }
                  snackBarMessage(
                      context, 'Please say how many of this food do you want?');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemDetailWidget extends StatelessWidget {
  final Function() onPressedMinimize;
  final Function() onPressedAdd;
  final Function() onPressedAddToFavorites;
  final Function() onPressedBack;
  final ItemModel itemModel;

  const ItemDetailWidget({
    Key? key,
    required this.itemModel,
    required this.onPressedMinimize,
    required this.onPressedAdd,
    required this.onPressedAddToFavorites,
    required this.onPressedBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(60),
          bottomRight: Radius.circular(60),
        ),
      ),
      child: Column(
        children: [
          Column(
            children: [
              BackAndFavoriteIconsWidget(
                  onPressedAddToFavorite: onPressedAddToFavorites,
                  onPressedBack: onPressedBack),
              FoodTitleAndImageWidgets(itemModel: itemModel),
              SizedBox(height: SizeConfig.setSizeVerticaly(30)),
              PurchaseItemCountWidget(
                onPressedMinimize: onPressedMinimize,
                onPressedAdd: onPressedAdd,
              ),
              SizedBox(height: SizeConfig.setSizeVerticaly(30)),
              ItemInformationWidgets(itemModel: itemModel),
              SizedBox(height: SizeConfig.setSizeVerticaly(50)),
              ItemDescriptionWidget(itemModel: itemModel)
            ],
          ),
        ],
      ),
    );
  }
}

class BackAndFavoriteIconsWidget extends StatelessWidget {
  final Function() onPressedAddToFavorite;
  final Function() onPressedBack;

  const BackAndFavoriteIconsWidget(
      {Key? key,
      required this.onPressedAddToFavorite,
      required this.onPressedBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(SizeConfig.setSizeHorizonaly(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButtonItemDetailWidget(
            icon: Icons.arrow_back_ios_rounded,
            onPressed: onPressedBack,
            color: kBlackColor,
          ),
          IconButtonItemDetailWidget(
            icon: _isItemFavorite
                ? Icons.favorite_rounded
                : Icons.favorite_border_rounded,
            onPressed: onPressedAddToFavorite,
            color: _isItemFavorite ? kPrimaryColor : kBlackColor,
          ),
        ],
      ),
    );
  }
}

class IconButtonItemDetailWidget extends StatelessWidget {
  final IconData icon;
  final Function() onPressed;
  final Color color;

  const IconButtonItemDetailWidget({
    Key? key,
    required this.icon,
    required this.onPressed,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.all(
              Radius.circular(SizeConfig.setSizeHorizonaly(15)))),
      child: IconButton(
        icon: Icon(icon),
        onPressed: onPressed,
        color: color,
      ),
    );
  }
}

class FoodTitleAndImageWidgets extends StatelessWidget {
  final ItemModel itemModel;

  const FoodTitleAndImageWidgets({
    Key? key,
    required this.itemModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: Text(
            itemModel.getItemName(),
            style: TextStyle(
                fontSize: SizeConfig.setSizeHorizonaly(30),
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: SizeConfig.setSizeVerticaly(20)),
        Image(
          image: AssetImage(itemModel.getItemImage()),
          height: SizeConfig.setSizeVerticaly(150),
          width: SizeConfig.setSizeHorizonaly(150),
        )
      ],
    );
  }
}

class PurchaseItemCountWidget extends StatelessWidget {
  final Function() onPressedMinimize;
  final Function() onPressedAdd;

  const PurchaseItemCountWidget({
    Key? key,
    required this.onPressedMinimize,
    required this.onPressedAdd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ItemPurchaseCountActionWidget(
          icon: Icons.minimize_rounded,
          onTap: onPressedMinimize,
          alignment: Alignment.topCenter,
        ),
        SizedBox(width: SizeConfig.setSizeHorizonaly(15)),
        Text(
          '$_totalItemPurchaseCount',
          style: TextStyle(
            fontSize: SizeConfig.setSizeHorizonaly(18),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: SizeConfig.setSizeHorizonaly(15)),
        ItemPurchaseCountActionWidget(
          icon: Icons.add_rounded,
          onTap: onPressedAdd,
          alignment: Alignment.center,
        )
      ],
    );
  }
}

class ItemPurchaseCountActionWidget extends StatelessWidget {
  final IconData icon;
  final Function() onTap;
  final Alignment alignment;

  const ItemPurchaseCountActionWidget({
    Key? key,
    required this.icon,
    required this.onTap,
    required this.alignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: SizeConfig.setSizeHorizonaly(43),
        height: SizeConfig.setSizeVerticaly(43),
        alignment: alignment,
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(SizeConfig.setSizeHorizonaly(50)),
          border: Border.all(color: kGreyColor.shade300),
        ),
        child: Icon(
          icon,
        ),
      ),
    );
  }
}

class ItemInformationWidgets extends StatelessWidget {
  final ItemModel itemModel;

  const ItemInformationWidgets({
    Key? key,
    required this.itemModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ItemInformationWidget(
          itemModel: itemModel,
          imageName: 'flame_fire',
          itemInfoCount: '${itemModel.getItemCaloryCount()}',
          itemDetailType: ' cal',
        ),
        ItemInformationWidget(
          itemModel: itemModel,
          imageName: 'alarm_clock',
          itemInfoCount:
              '${itemModel.getItemCookTime()[0]}-${itemModel.getItemCookTime()[1]}',
          itemDetailType: ' min',
        ),
        ItemInformationWidget(
          itemModel: itemModel,
          imageName: 'eye_heart_emoji',
          itemInfoCount: '${itemModel.getItemVotes()}',
          itemDetailType: ' votes',
        ),
        ItemInformationWidget(
          itemModel: itemModel,
          imageName: 'weight_machine',
          itemInfoCount: '${itemModel.getItemWeight()}',
          itemDetailType: 'g',
        ),
      ],
    );
  }
}

class ItemInformationWidget extends StatelessWidget {
  final ItemModel itemModel;
  final String imageName;
  final String itemInfoCount;
  final String itemDetailType;

  const ItemInformationWidget({
    Key? key,
    required this.itemModel,
    required this.imageName,
    required this.itemDetailType,
    required this.itemInfoCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: SizeConfig.setSizeHorizonaly(25),
          height: SizeConfig.setSizeVerticaly(25),
          child: SvgPicture.asset(
            'assets/item_information/$imageName.svg',
            fit: BoxFit.fill,
            color: kPrimaryColor,
          ),
        ),
        SizedBox(
          height: SizeConfig.setSizeVerticaly(5),
        ),
        Padding(
          padding: EdgeInsets.only(left: SizeConfig.setSizeHorizonaly(5)),
          child: Text('$itemInfoCount$itemDetailType',
              style: TextStyle(fontSize: SizeConfig.setSizeHorizonaly(20))),
        ),
      ],
    );
  }
}

class ItemDescriptionWidget extends StatelessWidget {
  final ItemModel itemModel;

  const ItemDescriptionWidget({
    Key? key,
    required this.itemModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: SizeConfig.setSizeHorizonaly(30)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: TextStyle(
                fontSize: SizeConfig.setSizeHorizonaly(22),
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: SizeConfig.setSizeVerticaly(10)),
          Text(
            itemModel.getItemDescription(),
            style: TextStyle(
                color: kGreyColor, fontSize: SizeConfig.setSizeHorizonaly(20)),
          ),
        ],
      ),
    );
  }
}
