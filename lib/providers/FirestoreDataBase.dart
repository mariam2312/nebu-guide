import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../data/Info_Bank_Data.dart';

class FirestoreDataBase extends ChangeNotifier {
  Stream<DocumentSnapshot> infoBankStream() {
    return FirebaseFirestore.instance.collection('InfoBankData').doc('AllInfoData')
        .snapshots();
  }
  // Stream <QuerySnapshot>infoBankStream(){
  //   String infoBankPath= "/InfoBankData";
  //   final CollectionReference<Map<String, dynamic>> restrictionsCollectionReference =
  //   FirebaseFirestore.instance.collection(infoBankPath);
  //   return restrictionsCollectionReference.snapshots();
  // }

  Stream<DocumentSnapshot> allRestrictionsStream() {
    return FirebaseFirestore.instance.collection('RestrictionsData').doc('AllRestrictionsData').snapshots();
  }

  // Stream<QuerySnapshot> restrictionsStream() {
  //   final CollectionReference<Map<String, dynamic>> restrictionsCollectionReference =
  //   FirebaseFirestore.instance.collection('/RestrictionsData');
  //   return restrictionsCollectionReference.snapshots();
  // }


}