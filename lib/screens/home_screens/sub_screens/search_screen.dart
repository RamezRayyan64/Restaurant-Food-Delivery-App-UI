import 'package:flutter/material.dart';
import 'package:food_app/constants/colors.dart';
import 'package:food_app/constants/lists.dart';
import 'package:food_app/models/item_model.dart';
import 'package:food_app/screens/home_screens/main_screens/home_screen.dart';
import 'package:food_app/utilities/size_config.dart';
import 'package:food_app/widgets/home_widgets/app_bar_title_widget.dart';
import 'package:food_app/widgets/home_widgets/back_button_widget.dart';
import 'package:food_app/widgets/home_widgets/tab_bar_view_items.dart';

class SearchScreen extends StatefulWidget {
  static const id = '/search_screen';
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

TextEditingController _textControllerSearch = TextEditingController();
FocusNode _focusNodeSearch = FocusNode();
List<ItemModel> result = [];

class _SearchScreenState extends State<SearchScreen> {
  var isOrientationPortrait = false;
  List<ItemModel> res = sushiFoodsList;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: ((context, orientation) {
      isOrientationPortrait = orientation == Orientation.portrait;
      return WillPopScope(
          onWillPop: () {
            setState(() {
              _focusNodeSearch.unfocus();
              _textControllerSearch.clear();
            });
            Navigator.pop(context);
            return Future.value(false);
          },
          child: SafeArea(
            child: Scaffold(
              backgroundColor: kSecondaryColor,
              appBar: AppBar(
                leading: BackIconButtonWidget(
                  onPressed: () {
                    setState(() {
                      _focusNodeSearch.unfocus();
                      _textControllerSearch.clear();
                    });
                    Navigator.pop(context);
                  },
                ),
                title: const AppBarTitleWidget(
                  titleText: 'Search',
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SearchBoxWidget(
                      onChange: (value) {
                        setState(() {
                          result = [];
                          for (int i = 0; i < sushiFoodsList.length; i++) {
                            if (sushiFoodsList[i]
                                .getItemName()
                                .toLowerCase()
                                .contains(value.toString().toLowerCase())) {
                              result.add(sushiFoodsList[i]);
                            }
                          }
                          res = result;
                        });
                      },
                    ),
                    TabBarViewItems(itemsList: res, color: kBackgroundColor),
                  ],
                ),
              ),
            ),
          ));
    }));
  }
}

class SearchBoxWidget extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final onChange;

  const SearchBoxWidget({
    Key? key,
    this.onChange,
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
      child: Container(
        padding: EdgeInsets.symmetric(vertical: SizeConfig.setSizeVerticaly(5)),
        margin: EdgeInsets.symmetric(
            horizontal: SizeConfig.setSizeHorizonaly(20),
            vertical: SizeConfig.setSizeVerticaly(20)),
        decoration: BoxDecoration(
            color: kSecondaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(SizeConfig.setSizeHorizonaly(15)),
            )),
        child: SearchTextFieldWidget(
          isEnabled: true,
          textEditingController: _textControllerSearch,
          focusNode: _focusNodeSearch,
          onChange: onChange,
        ),
      ),
    );
  }
}
