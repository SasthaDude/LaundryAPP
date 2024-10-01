import 'package:flutter/material.dart';

class AppDataProvider extends ChangeNotifier {

  // Theme Mode
  ThemeMode _themeMode = ThemeMode.light; // Default to Light Mode

  ThemeMode get themeMode => _themeMode;

  void setTheme(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }


  String _startTime = '08:00 AM';
  String _endTime = '05:00 PM';

  String get startTime => _startTime;
  String get endTime => _endTime;

  void setStartTime(String time) {
    _startTime = time;
    notifyListeners();
  }

  void setEndTime(String time) {
    _endTime = time;
    notifyListeners();
  }
  // Business Information
  String? _businessName;
  String? _businessAddress;
  String? _businessEstablishment;
  String? _businessPhoneNumber;
  String? _businessAlternativeNumber1;
  String? _businessWhatsappNumber;
  String? _businessEmailId;
  String? _businessPassword;
  String? _businessTiming;
  String? _businessDescription;
  String? _businessGST;
  String? _businessWebsite;
  String? _businessInstagram;
  String? _businessFacebook;
  String? _businessYoutube;
  String? _businessTwitter;

  // User Information
  String? _userName;
  String? _userPhoneNumber;
  String? _userEmailId;
  String? _userAddress;
  String? _userPassword;


  // Getters for Business Information
  String? get businessName => _businessName;
  String? get businessPhoneNumber => _businessPhoneNumber;
  String? get businessEmailId => _businessEmailId;
  String? get businessAddress => _businessAddress;
  String? get businessPassword => _businessPassword;
  String? get businessTiming => _businessTiming;
  String? get businessEstablishment => _businessEstablishment;
  String? get businessWhatsappNumber => _businessWhatsappNumber;
  String? get businessAlternativeNumber1 => _businessAlternativeNumber1;
  String? get businessDescription => _businessDescription;
  String? get businessGST => _businessGST;
  String? get businessWebsite => _businessWebsite;
  String? get businessInstagram => _businessInstagram;
  String? get businessFacebook => _businessFacebook;
  String? get businessYoutube => _businessYoutube;
  String? get businessTwitter => _businessTwitter;


  // Getters for User Information
  String? get userName => _userName;
  String? get userPhoneNumber => _userPhoneNumber;
  String? get userEmailId => _userEmailId;
  String? get userAddress => _userAddress;
  String? get userPassword => _userPassword;


  // Methods to update Business Information
  void updateBusinessName(String? newBusinessName) {
    if (newBusinessName != null && newBusinessName != _businessName) {
      _businessName = newBusinessName;
      notifyListeners();
    }
  }

  void updateBusinessPhoneNumber(String? newBusinessPhoneNumber) {
    if (newBusinessPhoneNumber != null && newBusinessPhoneNumber != _businessPhoneNumber) {
      _businessPhoneNumber = newBusinessPhoneNumber;
      notifyListeners();
    }
  }

  void updateBusinessEmailId(String? newBusinessEmailId) {
    if (newBusinessEmailId != null && newBusinessEmailId != _businessEmailId) {
      _businessEmailId = newBusinessEmailId;
      notifyListeners();
    }
  }

  void updateBusinessAddress(String? newBusinessAddress) {
    if (newBusinessAddress != null && newBusinessAddress != _businessAddress) {
      _businessAddress = newBusinessAddress;
      notifyListeners();
    }
  }

  void updateBusinessGST(String? newBusinessGST) {
    if (newBusinessGST != null && newBusinessGST != _businessGST) {
      _businessGST = newBusinessGST;
      notifyListeners();
    }
  }

  void updateBusinessPassword(String? newBusinessPassword) {
    if (newBusinessPassword != null && newBusinessPassword != _businessPassword) {
      _businessPassword = newBusinessPassword;
      notifyListeners();
    }
  }

  void updateBusinessTiming(String? newBusinessTiming) {
    if (newBusinessTiming != null && newBusinessTiming != _businessTiming) {
      _businessTiming = newBusinessTiming;
      notifyListeners();
    }
  }

  void updateBusinessDescription(String? newBusinessDescription) {
    if (newBusinessDescription != null && newBusinessDescription != _businessDescription) {
      _businessDescription = newBusinessDescription;
      notifyListeners();
    }
  }

  void updateEstablishment(String? newEstablishment) {
    if (newEstablishment != null && newEstablishment != _businessEstablishment) {
      _businessEstablishment = newEstablishment;
      notifyListeners();
    }
  }

  void updateWhatsAppNumber(String? newWhatsAppNumber) {
    if (newWhatsAppNumber != null && newWhatsAppNumber != _businessWhatsappNumber) {
      _businessWhatsappNumber = newWhatsAppNumber;
      notifyListeners();
    }
  }

  void updateAlternativeNumber1(String? newAlternativeNumber1) {
    if (newAlternativeNumber1 != null && newAlternativeNumber1 != _businessAlternativeNumber1) {
      _businessAlternativeNumber1 = newAlternativeNumber1;
      notifyListeners();
    }
  }

  void updateBusinessWebsite(String? newBusinessWebsite) {
    if (newBusinessWebsite != null && newBusinessWebsite != _businessWebsite) {
      _businessWebsite = newBusinessWebsite;
      notifyListeners();
    }
  }

  void updateBusinessInstagram(String? newBusinessInstagram) {
    if (newBusinessInstagram != null && newBusinessInstagram != _businessInstagram) {
      _businessInstagram = newBusinessInstagram;
      notifyListeners();
    }
  }

  void updateBusinessFacebook(String? newBusinessFacebook) {
    if (newBusinessFacebook != null && newBusinessFacebook != _businessFacebook) {
      _businessFacebook = newBusinessFacebook;
      notifyListeners();
    }
  }

  void updateBusinessYoutube(String? newBusinessYoutube) {
    if (newBusinessYoutube != null && newBusinessYoutube != _businessYoutube) {
      _businessYoutube = newBusinessYoutube;
      notifyListeners();
    }
  }

  void updateBusinessTwitter(String? newBusinessTwitter) {
    if (newBusinessTwitter != null && newBusinessTwitter != _businessTwitter) {
      _businessTwitter = newBusinessTwitter;
      notifyListeners();
    }
  }



  // Methods to update User Information
  void updateUserName(String? newUserName) {
    if (newUserName != null && newUserName != _userName) {
      _userName = newUserName;
      notifyListeners();
    }
  }

  void updateUserPhoneNumber(String? newUserPhoneNumber) {
    if (newUserPhoneNumber != null && newUserPhoneNumber != _userPhoneNumber) {
      _userPhoneNumber = newUserPhoneNumber;
      notifyListeners();
    }
  }

  void updateUserEmailId(String? newUserEmailId) {
    if (newUserEmailId != null && newUserEmailId != _userEmailId) {
      _userEmailId = newUserEmailId;
      notifyListeners();
    }
  }

  void updateUserAddress(String? newUserAddress) {
    if (newUserAddress != null && newUserAddress != _userAddress) {
      _userAddress = newUserAddress;
      notifyListeners();
    }
  }

  void updateUserPassword(String? newUserPassword) {
    if (newUserPassword != null && newUserPassword != _userPassword) {
      _userPassword = newUserPassword;
      notifyListeners();
    }
  }

  //lead provider
  String _leadName = '';
  String _leadPhone = '';
  String _leadService = '';
  String _leadStatus = '';
  String _leadReview = '';

  String get leadName => _leadName;
  String get leadPhone => _leadPhone;
  String get leadService => _leadService;
  String get leadStatus => _leadStatus;
  String get leadReview => _leadReview;

  void updateEntry({
  required String newName,
  required String newPhone,
  required String newService,
  required String newStatus,
  required String newReview,
  }) {
  _leadName = newName;
  _leadPhone = newPhone;
  _leadService = newService;
  _leadStatus = newStatus;
  _leadReview = newReview;
  notifyListeners();
  }

  // void clearEntry() {
  // _leadName = '';
  // _leadPhone = '';
  // _leadService = '';
  // _leadStatus = '';
  // _leadReview = '';
   //notifyListeners();
  //}


}



