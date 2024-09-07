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
  int _selectedIndex = -1;  List<Restriction> restrictionsList = [];
  Info? infobank;
  Restriction? restriction;
  bool isTipsAlive = false;
  final ScrollController _scrollController = ScrollController();
  double _itemHeight = 100.0;
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
  void searchInfo(String query) {
    _selectedIndex = allInfo.indexWhere((info) => info.Tip_Title!.toLowerCase().contains(query.toLowerCase()));
    if (_selectedIndex != -1) {
      // Scroll to the selected item
      _scrollToIndex(_selectedIndex);
    }
  }

  void _scrollToIndex(int index) {
    // You'll need to get a reference to the GridView's ScrollController
    // You can do this by creating a ScrollController in your widget
    // and passing it to the GridView
    _scrollController.animateTo(
      index * _itemHeight, // You'll need to calculate the height of each item
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

}
