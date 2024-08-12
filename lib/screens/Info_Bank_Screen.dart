import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../main.dart';
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
  Stream<DocumentSnapshot>? infoBankStream;

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
          List<Info> infoBankList = [];
          data.forEach((key, value) {
            Info infoBank = Info.fromMap(value);
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
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
                // Info.resetAllInfo();
                // Info.setInfoAlive();
              }),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, MyHomePage.id);
              },
              icon: const Icon(Icons.home),
            ),
          ],
          centerTitle: true,
          backgroundColor: const Color(0xff212D45),
          title: Text("Info",
              style: GoogleFonts.cairo(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
        body: ListView(
          children: [
            Consumer<GuideProvider>(builder: (context, guide, child) {
              if (guide.allInfo != []) {
                List<Info> allInfo = guide.allInfo;

                List<Info?> basicInfo = allInfo.map((e) {
                  if (e.Is_Basic == true) {
                    return e;
                  } else {
                    print("Not basic Info ");
                  }
                }).toList();

                List<Info?> forOwnerInfo = allInfo.map((e) {
                  if (e.Is_ForOwner == true) {
                    return e;
                  } else {
                    print("Not basic Info ");
                  }
                }).toList();

                List<Info?> whatsNewInfo = allInfo.map((e) {
                  if (e.Is_New == true) {
                    return e;
                  } else {
                    print("Not basic Info ");
                  }
                }).toList();

                List<Info?> stepByStepInfo = allInfo.map((e) {
                  if (e.Is_Step_By_Step == true) {
                    return e;
                  } else {
                    print("Not basic Info ");
                  }
                }).toList();

                whatsNewInfo.removeWhere((element) => element == null);
                forOwnerInfo.removeWhere((element) => element == null);
                basicInfo.removeWhere((element) => element == null);
                stepByStepInfo.removeWhere((element) => element == null);

                return Column(
                  children: [
                    GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(4)),
                                            color: const Color(0xff212D45),
                                            // image: DecorationImage(
                                            //   fit: BoxFit.fill,
                                            //   image: AssetImage(
                                            //       "assets/images/InfoBG.jpg"),
                                            // ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                                spreadRadius: 3,
                                                blurRadius: 2,
                                                offset: const Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ]),
                                        height:
                                            MediaQuery.of(context).size.height /
                                                3,
                                      ),
                                    ),
                                    Lottie.asset(
                                      "assets/NEBU_logo_animation.json",
                                      width: 250,
                                      height: 250,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Center(
                                      child: Text(
                                    " شرح للعمليات الاساسية ",
                                    style: GoogleFonts.cairo(
                                        color: Colors.yellow[700],
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return InfoSectionsScreen(Info: allInfo);
                        // }));
                      },
                    ),

                    // whats new & how to start
                    Row(
                      children: [
                        // What's new
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (context) {
                              //   return InfoDetailsScreen(
                              //     Info: stepByStepInfo,
                              //     isForAppOfficialFAQ: false,
                              //     isForAppOfficialInfoTip: false,
                              //     isForAppInfo: true,
                              //   );
                              // }));
                            },
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Stack(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(8)),
                                                  color:
                                                      const Color(0xff212D45),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.5),
                                                      spreadRadius: 3,
                                                      blurRadius: 2,
                                                      offset: const Offset(0,
                                                          3), // changes position of shadow
                                                    ),
                                                  ]),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  4.5,
                                            ),
                                            Lottie.asset(
                                              "assets/setpByStep.json",
                                              width: 180,
                                              height: 180,
                                            ),
                                          ],
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10.0, bottom: 10),
                                  child: Center(
                                      child: Text(
                                    "البداية خطوة بخطوة",
                                    style: GoogleFonts.cairo(
                                        color: Colors.yellow[700],
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // What's new
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (context) {
                              //   return InfoDetailsScreen(
                              //       isForAppInfo: true,
                              //       isForAppOfficialInfoTip: false,
                              //       isForAppOfficialFAQ: false,
                              //       Info: whatsNewInfo);
                              // }));
                            },
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Stack(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(8)),
                                                  color:
                                                      const Color(0xff212D45),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.5),
                                                      spreadRadius: 3,
                                                      blurRadius: 2,
                                                      offset: const Offset(0,
                                                          3), // changes position of shadow
                                                    ),
                                                  ]),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  4.5,
                                            ),
                                            Lottie.asset(
                                              "assets/whatsnew.json",
                                              width: 150,
                                              height: 150,
                                            ),
                                          ],
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10.0, bottom: 10),
                                  child: Center(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        " تعرف علي كل جديد ",
                                        style: GoogleFonts.cairo(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.yellow[700],
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (context) {
                              //   return InfoDetailsScreen(
                              //       isForAppInfo: false,
                              //       isForAppOfficialInfoTip: true,
                              //       isForAppOfficialFAQ: false,
                              //       Info: Info.allInfo);
                              // }));
                            },
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Stack(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(8)),
                                                  color:
                                                      const Color(0xff212D45),
                                                  // image: DecorationImage(
                                                  //   fit: BoxFit.cover,
                                                  //   image: AssetImage(
                                                  //       "assets/images/darkBG.jpg"),
                                                  // ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.5),
                                                      spreadRadius: 3,
                                                      blurRadius: 2,
                                                      offset: const Offset(0,
                                                          3), // changes position of shadow
                                                    ),
                                                  ]),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  4.5,
                                            ),
                                            Lottie.asset(
                                              "assets/official.json",
                                              width: 150,
                                              height: 150,
                                            ),
                                          ],
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Center(
                                      child: Text(
                                    " الاخبار الرسمية ",
                                    style: GoogleFonts.cairo(
                                        color: Colors.yellow[700],
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (context) {
                              //   return InfoDetailsScreen(
                              //       isForAppInfo: false,
                              //       isForAppOfficialInfoTip: false,
                              //       isForAppOfficialFAQ: true,
                              //       Info: Info.allInfo);
                              // }));
                            },
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Stack(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(8)),
                                                  color:
                                                      const Color(0xff212D45),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.5),
                                                      spreadRadius: 3,
                                                      blurRadius: 2,
                                                      offset: const Offset(0,
                                                          3), // changes position of shadow
                                                    ),
                                                  ]),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  4.5,
                                            ),
                                            Lottie.asset(
                                              "assets/faq.json",
                                              width: 140,
                                              height: 140,
                                            ),
                                          ],
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10.0, bottom: 10),
                                  child: Center(
                                      child: Text(
                                    " اسئلة و اجوبة ",
                                    style: GoogleFonts.cairo(
                                        color: Colors.yellow[700],
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: Text(
                    " .... ",
                    style: TextStyle(color: Colors.black),
                  ),
                );
              }
            }),
          ],
        ));
    ;
  }
}
