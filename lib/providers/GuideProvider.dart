import 'package:flutter/material.dart';

import '../models/Info.dart';
import '../models/Restriction.dart';

class GuideProvider extends ChangeNotifier {
  /// todo work with this provider as the main provider
  /// for state management of the app
  ///
  List<Info> infoBankList = [];
  List<Restriction> restrictionsList = [];
  Info? infobank;
  Restriction? restriction;

  List<Info> allInfo = [];

  bool isTipsAlive = false;

  bool isTitleAvailable = false;

  void setAllTips({required List<Info> value}) {
    allInfo = value;
    notifyListeners();
  }

  void resetAllTips() {
    allInfo = [];
    notifyListeners();
  }

  void setTitleAvailability({required bool value}) {
    isTitleAvailable = value;
    notifyListeners();
  }

  void setTipsAlive() {
    isTipsAlive = false;
    notifyListeners();
  }

  void setRestrictionList({required List<Restriction> restrictionList}) {
    restrictionsList = restrictionList;
    notifyListeners();
  }

  void setInfoBankList({required List<Info> infobankList}) {
    infoBankList = infobankList;
    notifyListeners();
  }
}
