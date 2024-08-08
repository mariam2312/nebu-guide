import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../data/Info_Bank_Data.dart';

class FirestoreDataBase extends ChangeNotifier {
  // fun gets the  infobank from database
  // Stream <DocumentSnapshot>infoBankStream(){
  //   String infoBankPath= "/InfoBankData/ChangeMargin";
  //   final DocumentReference<Map<String ,dynamic>?>infoBankDocumentReference= FirebaseFirestore.instance.doc(infoBankPath);
  // return infoBankDocumentReference.snapshots();
  // }
  Stream <QuerySnapshot>infoBankStream(){
    String infoBankPath= "/InfoBankData";
    final CollectionReference<Map<String, dynamic>> restrictionsCollectionReference =
    FirebaseFirestore.instance.collection(infoBankPath);
    return restrictionsCollectionReference.snapshots();
  }

  // Stream <DocumentSnapshot>restrictionsStream(){
  //   String restrictionsPath= "/RestrictionsData/NavigateToRegisterOldSystemWidget";
  //   final DocumentReference<Map<String ,dynamic>?>restrictionsDocumentReference= FirebaseFirestore.instance.doc(restrictionsPath);
  // return restrictionsDocumentReference.snapshots();
  // }

  Stream<QuerySnapshot> restrictionsStream() {
    final CollectionReference<Map<String, dynamic>> restrictionsCollectionReference =
    FirebaseFirestore.instance.collection('/RestrictionsData');
    return restrictionsCollectionReference.snapshots();
  }


}