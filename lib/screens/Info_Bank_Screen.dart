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
  List<InfoBank> infoBanksList = [];

  //stream and subscription
  StreamSubscription<QuerySnapshot>? infoBankSubscription;
  Stream<QuerySnapshot>?infoBankStream;

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
      List <InfoBank>infoBankList = [];
      // listen
      infoBankSubscription = infoBankStream?.listen((event) {
        if (event.docs.isNotEmpty) {

          List<QueryDocumentSnapshot> documents = event.docs;
          infoBanksList = [];

          if (documents.isNotEmpty) {
            documents.forEach((element) {
              Map<String, dynamic> documentData = element.data() as Map<String, dynamic>;

              infoBankList.add(InfoBank.fromMap(documentData));
            });
          }
          setState(() {
            infoBanksList = infoBankList;
            guideProvider.setInfoBankList(infobankList: infoBankList);
          });
        }
      });
    });
  }
  Future<void> infoBankToFirestore() async {

    InfoBank infobank1=InfoBank(
      Material_Path: "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
      Material_Path_List: [],
      Tip_Title: " حسابات مفتوحة",
      Tip_Section: "حسابات",
      Related_Screen: "شاشة حسابات",
      Related_App_Screen: "openaccount_Screen",
Tip_Description_Idea: " الهدف من تصميم مؤشز تغيير المصنعية هو التسهيل علي المستخدم و ايضا منع الاخطاء الحسابية و منع الحسابات المكررة ",
      Tip_Description_Info: " هل تعلم ان متوسط وقت حساب اجمالي قيمة منتج  بالطريقة اليدوية هي ٤٥ ثانية اما عن طريق النظام  فهي ٥ ثوان فقط",
      Tip_Main_Description: "  يتم تغيير قيمة المصنعية عن طريق تغيير مكان المؤشر ، تحريكه يمينا تقل المصنعية ،اما يسارا فتزيد المصنعية مع تحديث السعر الاجمالي في نفس الوقت ",
      Tip_Tech_Details: " يمكن تغيير المصنعية حتي و ان اختفت ",
      Is_ComingSoon: false,
      Is_ForOwner: true,
      Is_For_Admin: true,
      Is_For_SalesTeam: true,
      Is_Take_Time: false,
      Is_Optional: false,
      Is_Required: true,
      Android_Ver: 133,
      IOS_Ver: 94,
      Tip_Order_Number: "1",
Is_Material_Lottie: true,
      Is_Material_Picture: false,
      Is_Material_YouTube: false,
      Is_Step_By_Step: false,
      Is_New: false,
      Is_Basic: true,
      Is_FAQ: false ,
      Is_Official: false,);
    final CollectionReference infobankReference = FirebaseFirestore.instance.collection('InfoBankData');
    infobankReference.doc('OpenAcoount').set( infobank1.toMap(Material_Path: 'InfoBankData/OpenAcoount'));


  }
  @override
  void initState() {
    super.initState();
    infoBankToFirestore();
    callStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Info Bank"),
    ),
    body:Consumer<GuideProvider>(builder: (context, guideProvider, child) {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            (guideProvider.infoBankList.isNotEmpty)?
    Expanded(
    child: GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2, // adjust the number of columns here
      mainAxisSpacing: 10, // space between rows
      crossAxisSpacing: 10, // adjust the number of columns here
    ),
    itemCount: guideProvider.infoBankList.length, // number of items
    itemBuilder: (context, index) {
    InfoBank infoBank = guideProvider.infoBankList[index];
    return Container(
    padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.black,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(20), // circular edge
      ),
    child: Center(child: Text("(${index+1})${infoBank.Tip_Title}",style: const TextStyle(color: Colors.amber,fontSize: 20,fontWeight: FontWeight.bold),)),
    );
    },
    ),
    ) : const Center(
      child: Text(
      'No Items Available for now',
      style: TextStyle(color: Colors.red),
      ),
    )]));
    })
    );}
}
