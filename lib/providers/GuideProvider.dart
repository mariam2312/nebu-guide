import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/Info.dart';
import '../models/Restriction.dart';

class GuideProvider extends ChangeNotifier {
  /// todo work with this provider as the main provider
  /// for state management of the app
  ///
  List<Info> allInfo = [];

  List<Restriction> restrictionsList = [];
  Info? infobank;
  Restriction? restriction;
  bool isTipsAlive = false;

  bool isTitleAvailable = false;

  void setRestrictionList({required List<Restriction> restrictionList}) {
    restrictionsList = restrictionList;
    notifyListeners();
  }

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

  void setInfoBankList({required List<Info> infobankList}) {
    allInfo = infobankList;
    notifyListeners();
  }

  void clearRestrictionsList() {
    restrictionsList.clear();
    notifyListeners();
  }

  void clearInfoList() {
    allInfo.clear();
    notifyListeners();
  }

  // void updateInfoList(List<Info> newList) {
  //   allInfo = newList;
  //   notifyListeners(); // Notify the widgets that depend on this provider
  // }


}
