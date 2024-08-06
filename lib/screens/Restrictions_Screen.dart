import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import '../models/Info.dart';
import '../models/Restriction.dart';
import '../providers/FirestoreDataBase.dart';
import '../providers/GuideProvider.dart';
class RestrictionsScreen extends StatefulWidget {
  static String id = "RestrictionsScreen";

  @override
  State<RestrictionsScreen> createState() => _InfoBankScreenState();
}

class _InfoBankScreenState extends State<RestrictionsScreen> {

  //stream and subscription
  StreamSubscription<DocumentSnapshot>? restrictionsSubscription;
  Stream<DocumentSnapshot>?restrictionsStream;

  void cancelAllSubscriptions() {
    restrictionsSubscription?.cancel();
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
      restrictionsStream = database.restrictionsStream();
      // listen
      restrictionsSubscription = restrictionsStream?.listen((event) {
        if (event.exists) {
          // convet event to map
          Map<String, dynamic> data = event.data() as Map<String, dynamic>;
          // 1- convert data to Restriction
          List <Restriction>restrictionList = [];
          data.forEach((key, value) {
            Restriction restriction = Restriction.fromMap(value);
            restrictionList.add(restriction);
            print (restrictionList);
          });
          // 2- add data to Restriction list provider
          guideProvider.setRestrictionList(restrictionList: restrictionList);
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
    var guideProvider = Provider.of<GuideProvider>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: Text("Restrictions"),
        ),
        body:Consumer<GuideProvider>(builder: (context, guideProvider, child) {
          return Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [Text("VIP"),
                  Text("PRO"),
                  Text("BASIC"),]),
                Text("الامكانيات (${guideProvider.restrictionsList.length})"),],),
              Expanded(
                child: (guideProvider.restrictionsList.length > 0)
                    ?
                ListView.builder(
                  itemCount: guideProvider.restrictionsList.length, // number of items
                  itemBuilder: (context, index) {

                    Restriction restriction=guideProvider.restrictionsList[index];
                    return Container(width: 200,height: 300,color: Colors.black,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]!),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // shadow color
                            spreadRadius: 2, // spread radius
                            blurRadius: 5, // blur radius
                            offset: Offset(0, 3), // offset
                          ),
                        ],),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                        Text("($index)${restriction.Short_Description!}",style: TextStyle(color: Colors.yellow),),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                          Icon(restriction.Allowed_Plans!.contains("basic") ? Icons.check_circle : null),
                            Icon(restriction.Allowed_Plans!.contains("pro") ? Icons.check_circle : null),
                            Icon(restriction.Allowed_Plans!.contains("vip") ? Icons.check_circle : null)
                        ],)
                      ]),
                    );
                  },
                ) : const Text(
                  'No Items Available for now',
                  style: TextStyle(color: Colors.red),
                ),),
            ],
          );}));
  }
}
