import 'package:flutter/material.dart';
import 'package:food_app/constants/colors.dart';
import 'package:food_app/constants/lists.dart';
import 'package:food_app/constants/methods.dart';
import 'package:food_app/constants/modal_bottom_sheets.dart';
import 'package:food_app/constants/variables.dart';
import 'package:food_app/models/item_model.dart';
import 'package:food_app/screens/home_screens/sub_screens/home_item_details_screen.dart';
import 'package:food_app/screens/home_screens/sub_screens/my_cart_screen.dart';
import 'package:food_app/screens/home_screens/sub_screens/search_screen.dart';
import 'package:food_app/screens/home_screens/sub_screens/setting_screen.dart';
import 'package:food_app/utilities/size_config.dart';
import 'package:food_app/widgets/home_widgets/tab_bar_view_items.dart';

class HomeScreen extends StatefulWidget {
  static const id = '/home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var isOrientationPortrait = false;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: ((context, orientation) {
      isOrientationPortrait = orientation == Orientation.portrait;
      return WillPopScope(
          onWillPop: () {
            return Future.value(false);
          },
          child: SafeArea(
            child: DefaultTabController(
              length: homeTabsList.length,
              child: Scaffold(
                backgroundColor: kSecondaryColor,
                body: Column(
                  children: [
                    Container(
                      height: SizeConfig.setSizeVerticaly(10),
                      color: kBackgroundColor,
                    ),
                    Expanded(
                        flex: 7,
                        child: CustomScrollView(
                          slivers: [
                            SliverFillRemaining(
                              hasScrollBody: false,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: const [
                                        TextSerchBoxFilterButtonWidgets(),
                                        TabBarItemsWidget(),
                                        HomeTabBarViewWidget(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                    const Expanded(
                      flex: 1,
                      child: HomeBottomNavigation(),
                    ),
                  ],
                ),
              ),
            ),
          ));
    }));
  }
}

class TextSerchBoxFilterButtonWidgets extends StatelessWidget {
  const TextSerchBoxFilterButtonWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: kBackgroundColor),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.setSizeHorizonaly(20),
            vertical: SizeConfig.setSizeVerticaly(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeScreenTopTitleWidget(),
            SizedBox(height: SizeConfig.setSizeHorizonaly(25)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: SizeConfig.setSizeHorizonaly(300),
                  decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(SizeConfig.setSizeHorizonaly(15)),
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SearchScreen.id);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(SizeConfig.setSizeHorizonaly(5)),
                      child: SearchTextFieldWidget(
                        isEnabled: false,
                        textEditingController: TextEditingController(),
                        focusNode: FocusNode(),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: SizeConfig.setSizeHorizonaly(55),
                  height: SizeConfig.setSizeVerticaly(55),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        alignment: Alignment.center,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                SizeConfig.setSizeHorizonaly(15))),
                        primary: kPrimaryColor),
                    onPressed: () {},
                    child: const Icon(Icons.tune_outlined),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreenTopTitleWidget extends StatelessWidget {
  const HomeScreenTopTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Fast and',
          style: TextStyle(
              fontSize: SizeConfig.setSizeHorizonaly(36),
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: SizeConfig.setSizeVerticaly(5),
        ),
        Text(
          'Delicious Food',
          style: TextStyle(
              fontSize: SizeConfig.setSizeHorizonaly(36),
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class SearchTextFieldWidget extends StatelessWidget {
  final bool isEnabled;
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final onChange;

  const SearchTextFieldWidget({
    Key? key,
    required this.isEnabled,
    required this.textEditingController,
    required this.focusNode,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: isEnabled,
      onChanged: onChange,
      controller: textEditingController,
      focusNode: focusNode,
      cursorColor: kPrimaryColor,
      style: TextStyle(fontSize: SizeConfig.setSizeHorizonaly(24)),
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        prefixIcon: Icon(
          Icons.search_rounded,
          color: kGreyColor,
          size: SizeConfig.setSizeHorizonaly(30),
        ),
        hintText: 'Search here...',
        hintStyle: TextStyle(
          color: kGreyColor,
          fontSize: SizeConfig.setSizeHorizonaly(24),
        ),
      ),
    );
  }
}

class TabBarItemsWidget extends StatelessWidget {
  const TabBarItemsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.setSizeVerticaly(50),
      child: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        bottom: TabBar(
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
          tabs: homeTabsList,
        ),
      ),
    );
  }
}

class HomeTabBarViewWidget extends StatelessWidget {
  const HomeTabBarViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: SizeConfig.setSizeVerticaly(509.5),
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(SizeConfig.setSizeHorizonaly(50)),
          bottomRight: Radius.circular(SizeConfig.setSizeHorizonaly(50)),
        ),
      ),
      child: TabBarView(
        children: [
          TabBarViewItems(itemsList: sushiFoodsList, color: kSecondaryColor),
          TabBarViewItems(itemsList: soupFoodList, color: kSecondaryColor),
          TabBarViewItems(itemsList: chickenFoodsList, color: kSecondaryColor),
          TabBarViewItems(itemsList: pastaFoodsList, color: kSecondaryColor),
          TabBarViewItems(itemsList: kababFoodsList, color: kSecondaryColor),
          TabBarViewItems(itemsList: pizzaFoodsList, color: kSecondaryColor),
          TabBarViewItems(itemsList: soupFoodList, color: kSecondaryColor),
          TabBarViewItems(itemsList: meatFoodsList, color: kSecondaryColor),
        ],
      ),
    );
  }
}

class FoodItemWidgets extends StatelessWidget {
  final int index;

  const FoodItemWidgets({
    Key? key,
    required this.itemsList,
    required this.color,
    required this.index,
  }) : super(key: key);

  final List<ItemModel> itemsList;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, HomeItemDetailsScreen.id,
            arguments: {'itemModel': itemsList[index]});
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            SizeConfig.setSizeHorizonaly(20),
            SizeConfig.setSizeVerticaly(20),
            SizeConfig.setSizeHorizonaly(20),
            index == itemsList.length - 1
                ? SizeConfig.setSizeVerticaly(20)
                : 0),
        child: Container(
          width: double.infinity,
          padding:
              EdgeInsets.symmetric(vertical: SizeConfig.setSizeVerticaly(20)),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(
                Radius.circular(SizeConfig.setSizeHorizonaly(20))),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(
                image: AssetImage(itemsList[index].getItemImage()),
                height: SizeConfig.setSizeVerticaly(100),
                width: SizeConfig.setSizeHorizonaly(100),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    itemsList[index].getItemName(),
                    style: TextStyle(
                        fontSize: SizeConfig.setSizeHorizonaly(24),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: SizeConfig.setSizeVerticaly(10)),
                  Text(
                    getItemInfo(itemsList[index].getItemInfo(), index),
                    style: TextStyle(
                        fontSize: SizeConfig.setSizeHorizonaly(20),
                        color: kGreyColor),
                  ),
                  SizedBox(height: SizeConfig.setSizeVerticaly(20)),
                  Row(
                    children: [
                      Text(
                        '\$${itemsList[index].getItemPrice()}',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.setSizeHorizonaly(24)),
                      ),
                      SizedBox(
                        width: SizeConfig.setSizeHorizonaly(30),
                      ),
                      Container(
                          width: SizeConfig.setSizeHorizonaly(50),
                          height: SizeConfig.setSizeVerticaly(50),
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(
                                SizeConfig.setSizeHorizonaly(50)),
                          ),
                          child: IconButton(
                            onPressed: () async {
                              ItemModel itemModel =
                                  ItemModel.addToMyCartfromMap(
                                      itemsList[index].toMap());
                              for (int i = 0; i < myCartList.length; i++) {
                                if (myCartList.elementAt(i).getItemID() ==
                                    itemModel.getItemID()) {
                                  ItemModel currentItemModel =
                                      myCartList.elementAt(i);
                                  myCartList.remove(currentItemModel);
                                  currentItemModel.setItemPurchaseCount(
                                      currentItemModel.getItemPurchaseCount() +
                                          1);
                                  currentItemModel.setItemTotalPurchasePrice(
                                      currentItemModel
                                              .getItemTotalPurchasePrice() +
                                          currentItemModel.getItemPrice());
                                  myCartList.add(currentItemModel);
                                  return;
                                }
                              }
                              itemModel.setItemPurchaseCount(1);
                              itemModel.setItemTotalPurchasePrice(
                                  itemsList[index].getItemPrice());
                              myCartList.add(itemModel);
                              snackBarMessage(
                                  context, 'Item added tou your My Cart list');
                            },
                            color: kPrimaryColor,
                            icon: const Icon(
                              Icons.shopping_bag_outlined,
                              color: kWhiteColor,
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeBottomNavigation extends StatefulWidget {
  const HomeBottomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeBottomNavigation> createState() => _HomeBottomNavigationState();
}

class _HomeBottomNavigationState extends State<HomeBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kSecondaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BottomNavigationItemWidget(
            isCurrentSelectedItemHome: true,
            iconData: Icons.home_rounded,
            onPressed: () {},
          ),
          BottomNavigationItemWidget(
            isCurrentSelectedItemHome: false,
            iconData: Icons.shopping_cart_rounded,
            onPressed: () {
              Navigator.pushNamed(context, MyCartScreen.id);
            },
          ),
          BottomNavigationItemWidget(
            isCurrentSelectedItemHome: false,
            iconData: Icons.settings_rounded,
            onPressed: () {
              Navigator.pushNamed(context, SettingScreen.id);
            },
          ),
          ProfileImageWidget(
            onTap: () {
              showProfileBottomSheet(context);
            },
          ),
        ],
      ),
    );
  }
}

class BottomNavigationItemWidget extends StatelessWidget {
  final bool isCurrentSelectedItemHome;
  final Function() onPressed;
  final IconData iconData;

  const BottomNavigationItemWidget({
    Key? key,
    required this.isCurrentSelectedItemHome,
    required this.onPressed,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      color: isCurrentSelectedItemHome ? kPrimaryColor : kGreyColor,
      icon: Icon(iconData, size: SizeConfig.setSizeHorizonaly(35)),
    );
  }
}

class ProfileImageWidget extends StatelessWidget {
  final Function() onTap;

  const ProfileImageWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(
            bottom: SizeConfig.setSizeVerticaly(5),
            top: SizeConfig.setSizeVerticaly(5)),
        child: Container(
          width: SizeConfig.setSizeHorizonaly(35),
          height: SizeConfig.setSizeVerticaly(35),
          decoration: BoxDecoration(
            color: kBlackColor,
            borderRadius: BorderRadius.all(
              Radius.circular(SizeConfig.setSizeHorizonaly(50)),
            ),
            image: DecorationImage(
                image: AssetImage(userModel.getUserImagePath()),
                fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
