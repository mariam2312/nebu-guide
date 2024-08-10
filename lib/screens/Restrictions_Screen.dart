import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import '../models/Restriction.dart';
import '../providers/FirestoreDataBase.dart';
import '../providers/GuideProvider.dart';
class RestrictionsScreen extends StatefulWidget {
  static String id = "RestrictionsScreen";

  const RestrictionsScreen({super.key});

  @override
  State<RestrictionsScreen> createState() => _InfoBankScreenState();
}

class _InfoBankScreenState extends State<RestrictionsScreen> {
  List<Restriction> restrictionsList = [];
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //stream and subscription
  StreamSubscription<QuerySnapshot>? restrictionsSubscription;
  Stream<QuerySnapshot>?restrictionsStream;

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
      List <Restriction>restrictionList = [];
      // listen
      restrictionsSubscription = restrictionsStream?.listen((event) {
        if (event.docs.isNotEmpty) {
          List<QueryDocumentSnapshot> documents = event.docs;
          restrictionsList = [];

          if (documents.isNotEmpty) {
            documents.forEach((element) {
              Map<String, dynamic> documentData = element.data() as Map<String, dynamic>;

              restrictionList.add(Restriction.fromMap(documentData));
            });
          }
          setState(() {
            restrictionsList = restrictionList;
            guideProvider.setRestrictionList(restrictionList: restrictionList);
          });
        }
      });
    });
  }
  Future<void> restrictionsToFirestore() async {
    Restriction restriction1 =Restriction(
      Short_Description: "Main Operations",
      Description: "To go to the migration from an old system to save the codes",
      Short_Description_Ar:" لتسجيل الاكواد بالنظام السابق الي النظام الجديد ",
      Description_Ar: " الذهاب الي تسجيل النظام السابق ",
      Role_Permission: [
      "Owner",
      "Manager",
      "Purchaser",
      "Accountant",
      ],
      Allowed_Plans: [  "vip"],
      Store_Type: ["Retail",],
      Material_Type: ["Gold_Silver" ,"Gold", "Silver"],
      Photo_Url: "",
      Visible: true,
      Blurred: true,
      Dev_Mode: false,
    );


    final CollectionReference restrictionsDataCollection = FirebaseFirestore.instance.collection('RestrictionsData');
    restrictionsDataCollection.doc('MainOperations').set(restriction1.toMap(Material_Path: 'RestrictionsData/MainOperations'));

  }
  Future<void> deleteRestrictionsToFirestore() async {
    final CollectionReference restrictionsDataCollection = FirebaseFirestore.instance.collection('RestrictionsData');
    restrictionsDataCollection.doc('MainOperations').delete();

  }
  @override
  void initState() {
    super.initState();
    restrictionsToFirestore();
    deleteRestrictionsToFirestore();
    callStream();
  }

  @override
  Widget build(BuildContext context) {
    var guideProvider = Provider.of<GuideProvider>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Restrictions"),
        ),
        body:Consumer<GuideProvider>(builder: (context, guideProvider, child) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Container(decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                 color: Colors.black12
                ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 150, // specify a width for the inner Row
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("VIP",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                            Spacer(flex: 2), // add space between VIP and PRO
                            Text("PRO",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                            Spacer(flex: 2), // add space between PRO and BASIC
                            Text("BASIC",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                             Spacer(flex: 2),
                          ],
                        ),
                      ),
                      Text("الامكانيات (${guideProvider.restrictionsList.length})",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                (guideProvider.restrictionsList.isNotEmpty)
                    ?
                Expanded(
                    child:  ListView.builder(
                      itemCount: guideProvider.restrictionsList.length, // number of items
                      itemBuilder: (context, index) {

                        Restriction restriction=guideProvider.restrictionsList[index];
                        return
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 140, // specify a width for the inner Row
                                child: Row(
                                  children: [
                                    restriction.Allowed_Plans!.contains("vip") ? const Icon(Icons.check_circle,color: Colors.green)
                                        : Container(width: 20,),
                                    const Spacer(flex: 2), // add space between VIP and PRO
                                    restriction.Allowed_Plans!.contains("pro") ? const Icon(Icons.check_circle,color: Colors.green,)
                                        :Container(width: 20,),
                                    const Spacer(flex: 2), // add space between PRO and BASIC
                                    restriction.Allowed_Plans!.contains("basic") ? const Icon(Icons.check_circle,color: Colors.green)
                                        : Container(width: 20,),
                                    const Spacer(flex: 2),
                                  ],
                                ),
                              ),
                              Text("${restriction.Short_Description}(${index+1})"),
                            ],
                          );
                      },
                    ) ): const Center(
                      child: Text(
                  'No Items Available for now',
                  style: TextStyle(color: Colors.red),
                ),
                    ),
              ],
            ),
          );}));
  }
}
