import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreDataBase extends ChangeNotifier {
  // fun gets the  infobank from database
  Stream <DocumentSnapshot>infoBankStream(){
    String infoBankPath= "";
    final DocumentReference<Map<String ,dynamic>?>infoBankDocumentReference= FirebaseFirestore.instance.doc(infoBankPath);
  return infoBankDocumentReference.snapshots();
  }

  Stream <DocumentSnapshot>restrictionsStream(){
    String restrictionsPath= "/RestrictionsData/NavigateToRegisterOldSystemWidget";
    final DocumentReference<Map<String ,dynamic>?>restrictionsDocumentReference= FirebaseFirestore.instance.doc(restrictionsPath);
  return restrictionsDocumentReference.snapshots();
  }

}