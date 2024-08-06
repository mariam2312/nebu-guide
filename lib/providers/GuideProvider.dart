import 'package:flutter/material.dart';

import '../models/Info.dart';

import '../models/Info.dart';
import '../models/Restriction.dart';

class GuideProvider extends ChangeNotifier {
  /// todo work with this provider as the main provider
  /// for state management of the app
  ///
  List<InfoBank> infoBankList = [];
  List<Restriction> restrictionsList = [];
  InfoBank? infobank;
  Restriction?restriction;


  void setRestrictionList({required List<Restriction> restrictionList}) {
    restrictionsList = restrictionList;
    notifyListeners();
  }


  void setInfoBankList({required List<InfoBank> infobankList}) {
    infoBankList = infobankList;
    notifyListeners();
  }

}