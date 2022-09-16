class ItemModel {
  late num _itemID;
  late String _itemImage;
  late String _itemName;
  late bool _isFavoriteItem;
  late List<String> _itemInfo;
  late String _itemDescription;
  late num _itemPrice;
  late num _itemCaloryCount;
  late List<num> _itemCookTime;
  late num _itemVotes;
  late num _itemWeight;
  late num _itemPurchaseCount;
  late num _itemTotalPurchasePrice;

  ItemModel.init();

  ItemModel.createItem(
      {required num itemID,
      required String itemImage,
      required String itemName,
      required bool isFavoriteItem,
      required List<String> itemInfo,
      required String itemDescription,
      required num itemPrice,
      required num itemCaloryCount,
      required List<num> itemCookTime,
      required num itemVotes,
      required num itemWeight,
      required num itemPurchaseCount,
      required num itemTotalPurchasePrice}) {
    _itemID = itemID;
    _itemImage = 'assets/foods_images/$itemImage.png';
    _itemName = itemName;
    _isFavoriteItem = isFavoriteItem;
    _itemInfo = itemInfo;
    _itemDescription = itemDescription;
    _itemPrice = itemPrice;
    _itemCaloryCount = itemCaloryCount;
    _itemCookTime = itemCookTime;
    _itemVotes = itemVotes;
    _itemWeight = itemWeight;
    _itemPurchaseCount = itemPurchaseCount;
    _itemTotalPurchasePrice = itemTotalPurchasePrice;
  }

  ItemModel.addToCart(
      {required num itemID,
      required String itemImage,
      required String itemName,
      required bool isFavoriteItem,
      required List<String> itemInfo,
      required String itemDescription,
      required num itemPrice,
      required num itemCaloryCount,
      required List<num> itemCookTime,
      required num itemVotes,
      required num itemWeight,
      required num itemPurchaseCount,
      required num itemTotalPurchasePrice}) {
    _itemID = itemID;
    _itemImage = 'assets/foods_images/$itemImage.png';
    _itemName = itemName;
    _isFavoriteItem = isFavoriteItem;
    _itemInfo = itemInfo;
    _itemDescription = itemDescription;
    _itemPrice = itemPrice;
    _itemCaloryCount = itemCaloryCount;
    _itemCookTime = itemCookTime;
    _itemVotes = itemVotes;
    _itemWeight = itemWeight;
    _itemPurchaseCount = itemPurchaseCount;
    _itemTotalPurchasePrice = itemTotalPurchasePrice;
  }

  ItemModel.addToMyCartfromMap(Map<dynamic, dynamic> res)
      : _itemID = res['itemID'],
        _itemImage = res['itemImage'],
        _itemName = res['itemName'],
        _isFavoriteItem = res['isFavoriteItem'],
        _itemInfo = res['itemInfo'],
        _itemDescription = res['itemDescription'],
        _itemPrice = res['itemPrice'],
        _itemCaloryCount = res['itemCaloryCount'],
        _itemCookTime = res['itemCookTime'],
        _itemVotes = res['itemVotes'],
        _itemWeight = res['itemWeight'];

  ItemModel.addToMyCartListfromMap(Map<dynamic, dynamic> res)
      : _itemID = res['itemID'],
        _itemImage = res['itemImage'],
        _itemName = res['itemName'],
        _isFavoriteItem = res['isFavoriteItem'],
        _itemInfo = res['itemInfo'],
        _itemDescription = res['itemDescription'],
        _itemPrice = res['itemPrice'],
        _itemCaloryCount = res['itemCaloryCount'],
        _itemCookTime = res['itemCookTime'],
        _itemVotes = res['itemVotes'],
        _itemWeight = res['itemWeight'],
        _itemPurchaseCount = 1,
        _itemTotalPurchasePrice = 3;

  Map<String, Object?> toMap() {
    return {
      'itemID': getItemID(),
      'itemImage': getItemImage(),
      'itemName': getItemName(),
      'isFavoriteItem': getIsFavoriteItem(),
      'itemInfo': getItemInfo(),
      'itemDescription': getItemDescription(),
      'itemPrice': getItemPrice(),
      'itemCaloryCount': getItemCaloryCount(),
      'itemCookTime': getItemCookTime(),
      'itemVotes': getItemVotes(),
      'itemWeight': getItemWeight(),
    };
  }

  num getItemID() => _itemID;

  String getItemImage() => _itemImage;

  void setItemImage(String itemImage) => _itemImage = itemImage;

  String getItemName() => _itemName;

  void setItemName(String itemName) => _itemName = itemName;

  bool getIsFavoriteItem() => _isFavoriteItem;

  void setIsFavoriteItem(bool isFavoriteItem) =>
      _isFavoriteItem = isFavoriteItem;

  List<String> getItemInfo() => _itemInfo;

  void setItemInfo(List<String> itemInfo) => _itemInfo = itemInfo;

  String getItemDescription() => _itemDescription;

  void setItemDescription(String itemDescription) =>
      _itemDescription = itemDescription;

  num getItemPrice() => _itemPrice;

  void setItemPrice(num itemPrice) => _itemPrice = itemPrice;

  num getItemCaloryCount() => _itemCaloryCount;

  void setItemCaloryCount(num itemCaloryCount) =>
      _itemCaloryCount = itemCaloryCount;

  List<num> getItemCookTime() => _itemCookTime;

  void setItemCookTime(List<num> itemCookTime) => _itemCookTime = itemCookTime;

  num getItemVotes() => _itemVotes;

  void setItemVotes(num itemVotes) => _itemVotes = itemVotes;

  num getItemWeight() => _itemWeight;

  void setItemWeight(num itemWeight) => _itemWeight = itemWeight;

  num getItemPurchaseCount() => _itemPurchaseCount;

  void setItemPurchaseCount(num itemPurchaseCount) =>
      _itemPurchaseCount = itemPurchaseCount;

  num getItemTotalPurchasePrice() => _itemTotalPurchasePrice;

  void setItemTotalPurchasePrice(num itemTotalPurchasePrice) =>
      _itemTotalPurchasePrice = itemTotalPurchasePrice;
}
