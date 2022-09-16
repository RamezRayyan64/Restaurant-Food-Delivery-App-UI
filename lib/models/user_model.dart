class UserModel {
  late num _userID;
  late String _userImagePath;
  late String _userFullname;
  late String _userPhoneNumber;
  late String _userEmailAddress;
  late String _userPaymentMethod;
  late String _userAddress;

  UserModel.init();

  UserModel.create(
      {required num userID,
      required String userImagePath,
      required String userFullname,
      required String userPhoneNumber,
      required String userEmailAddress,
      required String userPaymentMethod,
      required String userAddress}) {
    _userID = userID;
    _userImagePath = 'assets/user_images/$userImagePath.jpg';
    _userFullname = userFullname;
    _userPhoneNumber = '+93 (0) $userPhoneNumber';
    _userEmailAddress = userEmailAddress;
    _userPaymentMethod = userPaymentMethod;
    _userAddress = userAddress;
  }

  UserModel.fromMap(Map<dynamic, dynamic> res)
      : _userID = res['userID'],
        _userImagePath = res['userImagePath'],
        _userFullname = res['userFullname'],
        _userPhoneNumber = res['userPhoneNumber'],
        _userEmailAddress = res['userEmailAddress'],
        _userPaymentMethod = res['userPaymentMethod'],
        _userAddress = res['userAddress'];

  Map<String, Object?> toMap() {
    return {
      'userID': getUserID(),
      'userImagePath': getUserImagePath(),
      'userFullname': getUserFullname(),
      'userPhoneNumber': getUserPhoneNumber(),
      'userEmailAddress': getUserEmailAddress(),
      'userPaymentMethod': getUserPaymentMethod(),
      'userAddress': getUserAddress()
    };
  }

  num getUserID() => _userID;

  String getUserImagePath() => _userImagePath;

  void setUserImagePath(String userImagePath) => _userImagePath = userImagePath;

  String getUserFullname() => _userFullname;

  void setUserFullname(String userFullname) => _userFullname = userFullname;

  String getUserPhoneNumber() => _userPhoneNumber;

  void setUserPhoneNumber(String userPhoneNumber) =>
      _userPhoneNumber = userPhoneNumber;

  String getUserEmailAddress() => _userEmailAddress;

  void setUserEmailAddress(String userEmailAddress) =>
      _userEmailAddress = userEmailAddress;

  String getUserPaymentMethod() => _userPaymentMethod;

  void setUserPaymentMethod(String userPaymentMethod) =>
      _userPaymentMethod = userPaymentMethod;

  String getUserAddress() => _userAddress;

  void setUserAddress(String userAddress) => _userAddress = userAddress;
}
