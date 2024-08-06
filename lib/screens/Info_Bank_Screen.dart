import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import '../models/Info.dart';
import '../providers/FirestoreDataBase.dart';
import '../providers/GuideProvider.dart';

class InfoBankScreen extends StatefulWidget {
  static String id = "InfoBankScreen";

  @override
  State<InfoBankScreen> createState() => _InfoBankScreenState();
}

class _InfoBankScreenState extends State<InfoBankScreen> {


  //stream and subscription
  StreamSubscription<DocumentSnapshot>? infoBankSubscription;
  Stream<DocumentSnapshot>?infoBankStream;

  void cancelAllSubscriptions() {
    infoBankSubscription?.cancel();
    debugPrint(" Cancel Subscriptions !!! ");
  }
  @override
  void dispose() {
    cancelAllSubscriptions();
    super.dispose();
  }
  @override
  void deactivate() {
    cancelAllSubscriptions();
    super.deactivate();
  }
  void callStream() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //get data from database as stream
      var database = Provider.of<FirestoreDataBase>(context, listen: false);
      var guideProvider = Provider.of<GuideProvider>(context, listen: false);
// stream
      infoBankStream = database.infoBankStream();
      // listen
      infoBankSubscription = infoBankStream?.listen((event) {
        if (event.exists) {
          // convet event to map
          Map<String, dynamic> data = event.data() as Map<String, dynamic>;
          // 1- convert data to InfoBank
          List <InfoBank>infoBankList = [];
          data.forEach((key, value) {
            InfoBank infoBank = InfoBank.fromMap(value);
            infoBankList.add(infoBank);
          });
          // 2- add data to infobank list provider
          guideProvider.setInfoBankList(infobankList: infoBankList);
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    callStream();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Info Bank"),
      ),
      body:Consumer<GuideProvider>(builder: (context, guideProvider, child) {
      return Expanded(
          child: (guideProvider.infoBankList.length > 0)
              ?
      GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2, // 2 items per row
    childAspectRatio: 1, // aspect ratio of each item
    ),
    itemCount: guideProvider.infoBankList.length, // number of items
    itemBuilder: (context, index) {

      InfoBank infobank=guideProvider.infoBankList[index];
    return Container(width: 200,height: 300,color: Colors.black,
    decoration: BoxDecoration(
    border: Border.all(color: Colors.grey),

      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5), // shadow color
          spreadRadius: 2, // spread radius
          blurRadius: 5, // blur radius
          offset: Offset(0, 3), // offset
        ),
      ],),
    child: Center(child: Text(infobank.Tip_Title!,style: TextStyle(color: Colors.yellow),)),
    );
    },
    ) : const Text(
            'No Items Available for now',
            style: TextStyle(color: Colors.red),
          ),);}));
  }
}
