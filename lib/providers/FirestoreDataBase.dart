import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../data/Info_Bank_Data.dart';

class FirestoreDataBase extends ChangeNotifier {
  Stream<DocumentSnapshot> infoBankStream() {
    return FirebaseFirestore.instance.collection('InfoBankData').doc('AllInfoData')
        .snapshots();
  }


  Stream<DocumentSnapshot> allRestrictionsStream() {
    return FirebaseFirestore.instance.collection('RestrictionsData').doc('AllRestrictionsData').snapshots();
  }

  // Future<void> infoToFirestore() async {
  //   final CollectionReference restrictionsDataCollection =
  //   FirebaseFirestore.instance.collection('InfoBankData');
  //   final Map<String, dynamic> bigMap = {'info': {}};
  //
  //   for (var infoBank in infoBank.values.toList()) {
  //     final Map<String, dynamic> infoMap =
  //     infoBank.toMap(Path: 'InfoBankData/AllInfoData');
  //     bigMap['info'][infoBank.Tip_Title!] = infoMap;
  //   }
  //
  //   restrictionsDataCollection.doc('AllInfoData').set(bigMap);
  // }


}