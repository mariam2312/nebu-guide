import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lottie/lottie.dart';

import '../data/Info_Bank_Data.dart';
import '../firebase_options.dart';import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/Info.dart';
import '../providers/FirestoreDataBase.dart';
import '../providers/GuideProvider.dart';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
class InfoSectionScreen extends StatefulWidget {
  List<Info?> info ;
   InfoSectionScreen({super.key,required this.info});

  @override
  State<InfoSectionScreen> createState() => _InfoSectionScreenState();
}

class _InfoSectionScreenState extends State<InfoSectionScreen> {
  List<Info> infoBanksList = [];

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
          Map<String, dynamic> bigMap = event.data() as Map<String, dynamic>;
          Map<String, dynamic> allRestrictionsData = bigMap['info'];

          List<Info> infoList = [];

          // Iterate over the allRestrictionsData map
          allRestrictionsData.forEach((key, value) {
            Info restriction = Info.fromMap(value);
            infoList.add(restriction);
          });

          setState(() {
            infoBanksList = infoList;
            guideProvider.setInfoBankList(infobankList: infoBanksList);
          });
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    // infoBankToFirestore();
    callStream();
  }
  Future<void> infoToFirestore() async {



    final CollectionReference restrictionsDataCollection = FirebaseFirestore.instance.collection('InfoBankData');
    final Map<String, dynamic> bigMap = {
      'info': {}
    };

    for (var infoBank in infoBankList) {
      final Map<String, dynamic> infoMap = infoBank.toMap(Path: 'InfoBankData/AllInfoData');
      bigMap['info'][infoBank.Tip_Title!] = infoMap;
    }

    restrictionsDataCollection.doc('AllInfoData').set(bigMap);
  }

  Future<void> deleteAllInfoToFirestore() async {
    final CollectionReference infoDataCollection = FirebaseFirestore.instance.collection('InfoBankData');

    // Get all documents in the collection
    QuerySnapshot snapshot = await infoDataCollection.get();

    // Loop through the documents and delete each one
    for (DocumentSnapshot document in snapshot.docs) {
      await document.reference.delete();
    }

    // Clear the restrictionsList in the GuideProvider
    var guideProvider = Provider.of<GuideProvider>(context, listen: false);
    guideProvider.clearInfoList();
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
            ElevatedButton(onPressed: (){infoToFirestore();}, child: Text("set")),
            ElevatedButton(onPressed: (){deleteAllInfoToFirestore();}, child: Text("delete")),
            (guideProvider.allInfo.isNotEmpty)?
    Expanded(
    child: GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2, // adjust the number of columns here
      mainAxisSpacing: 10, // space between rows
      crossAxisSpacing: 10, // adjust the number of columns here
    ),
    itemCount: guideProvider.allInfo.length, // number of items
    itemBuilder: (context, index) {
    Info infoBank = guideProvider.allInfo[index];
    return GestureDetector( onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InfoScreen(infoBank: infoBank),
        ),
      );
    },
      child: Container(
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
      ),
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
class InfoScreen extends StatefulWidget {
  final Info infoBank;

  InfoScreen({required this.infoBank});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}


class _InfoScreenState extends State<InfoScreen> {
  int _currentIndex = 0;
  CarouselSliderController? _carouselController ;
  final List<String> _images = [
    'assets/images/openaccount1.jpg',
    'assets/images/openaccount2.jpg',
    'assets/images/openaccount3.jpg',
  ];
  bool _isAutoPlay = true;

  @override
  void initState() {
    super.initState();
    if (widget.infoBank.Material_Path != "") {
    Future.delayed(Duration(milliseconds: 100), () {
      _startSliderAnimation();
    });}
  }

  void _startSliderAnimation() {
    if (widget.infoBank.Material_Path != "") {
      if (_isAutoPlay) {
        if (_carouselController != null) { // Check if it's not null
          _carouselController!.nextPage();
          Future.delayed(Duration(seconds: 3)).then((_) {
            if (_isAutoPlay) {
              _startSliderAnimation();
            }
          });
        }
      }
    }
  }

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
      _isAutoPlay = false; // Stop autoplay when a step is tapped
    });
    if (_carouselController != null) { // Check if it's not null
      _carouselController!.animateToPage(index);
    }
  }
  @override
  Widget build(BuildContext context) {
    String? urlString =widget.infoBank.Material_Path;
    Uri uri = Uri.parse(urlString!);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.infoBank.Tip_Title!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child:
        (widget.infoBank.Material_Path  !="")?
        ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Lottie.network(
                "${widget.infoBank.Material_Path}",
                width: 300,
                height: 500,
              );

            } else {
              return Container(
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text(widget.infoBank.Related_Screen ?? ''),
                        Text(widget.infoBank.Tip_Title ?? ''),
                      ],
                    ),
                    Container(height: 100,decoration: BoxDecoration(color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            Text("الشرح"),
                            Text(widget.infoBank.Tip_Description_Info ?? ''),
                          ],
                        )), SizedBox(height:5,),
                    Container(height: 100,decoration: BoxDecoration(color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            Text("الفكرة"),
                            Text(widget.infoBank.Tip_Description_Idea ?? ''),
                          ],
                        )), SizedBox(height:5),  Container(height: 100,decoration: BoxDecoration(color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            Text("هل تعلم"),
                            Text(widget.infoBank.Tip_Description_Info ?? ''),
                          ],
                        )),
                  ],
                ),
              );
            }
          },
        ):
        ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Stack(
                children: [
                  Image.asset(
                    'assets/images/iPhone.png',
                    width: 500,
                    height: 600,
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    bottom: 0,right: 0,
                    child: CarouselSlider(
                        items: _images.map((image) {
                          return ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            image,
                            fit: BoxFit.contain,
                          ));
                        }).toList(),
                      carouselController: _carouselController =
                          CarouselSliderController(),
                        options: CarouselOptions(
                          height: 548,
                          autoPlay: _isAutoPlay,
                          autoPlayInterval: Duration(seconds: 3),
                          enlargeCenterPage: true,
                          viewportFraction: 1.0,
                          aspectRatio: 1.0,
                          initialPage: 0,
                          reverse: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                        ),
                      ),
                    ),

                ],
              );
            } else {
              return Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.infoBank.Related_Screen ?? ''),
                        Text(widget.infoBank.Tip_Title ?? ''),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => _onTap(0),
                      child: Container(
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: _currentIndex == 0 ? Colors.green : Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Center(
                          child: Text("خطوة1"),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    GestureDetector(
                      onTap: () => _onTap(1),
                      child: Container(
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: _currentIndex == 1 ? Colors.green : Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Center(
                          child: Text("خطوة2"),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    GestureDetector(
                      onTap: () => _onTap(2),
                      child: Container(
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: _currentIndex == 2 ? Colors.green : Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Center(
                          child: Text("خطوة3"),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}


// class _InfoScreenState extends State<InfoScreen> {
//   int _currentIndex = 0;
//   Timer? _sliderTimer;
//   final List<String> _images = [
//     'assets/images/openaccount1.jpg','assets/images/openaccount2.jpg','assets/images/openaccount3.jpg',
//
//
//
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     _startSliderAnimation();
//   }
//
//   void _startSliderAnimation() {
//     _sliderTimer?.cancel(); // Cancel any existing timer
//     _sliderTimer = Timer.periodic(Duration(seconds: 3), (timer) {
//       setState(() {
//         _currentIndex = (_currentIndex + 1) % _images.length;
//       });
//     });
//   }
//
//
//   @override
//   void dispose() {
//     _sliderTimer?.cancel();
//     super.dispose();
//   }
//   void _onTap(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//     _sliderTimer?.cancel(); // Stop the timer immediately upon tap
//   }
//   @override
//   Widget build(BuildContext context) {
//     var url =widget.infoBank.Material_Path;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.infoBank.Tip_Title!),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child:
//         // (widget.infoBank.Material_Path!.isNotEmpty)?
//         // ListView.builder(
//         //   itemCount: 2,
//         //   itemBuilder: (context, index) {
//         //     if (index == 0) {
//         //       return Lottie.network(
//         //         "$url",
//         //         width: 300,
//         //         height: 300,
//         //       );
//         //
//         //     } else {
//         //       return Container(
//         //         child: Column(mainAxisAlignment: MainAxisAlignment.center,
//         //           children: [
//         //             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         //               children: [Text(widget.infoBank.Related_Screen ?? ''),
//         //                 Text(widget.infoBank.Tip_Title ?? ''),
//         //               ],
//         //             ),
//         //             Container(height: 100,decoration: BoxDecoration(color: Colors.grey,
//         //                 borderRadius: BorderRadius.all(Radius.circular(10))),
//         //                 child: Column(
//         //                   children: [
//         //                     Text("الشرح"),
//         //                     Text(widget.infoBank.Tip_Description_Info ?? ''),
//         //                   ],
//         //                 )), SizedBox(height:5,),
//         //             Container(height: 100,decoration: BoxDecoration(color: Colors.green,
//         //                 borderRadius: BorderRadius.all(Radius.circular(10))),
//         //                 child: Column(
//         //                   children: [
//         //                     Text("الفكرة"),
//         //                     Text(widget.infoBank.Tip_Description_Idea ?? ''),
//         //                   ],
//         //                 )), SizedBox(height:5),  Container(height: 100,decoration: BoxDecoration(color: Colors.grey,
//         //                 borderRadius: BorderRadius.all(Radius.circular(10))),
//         //                 child: Column(
//         //                   children: [
//         //                     Text("هل تعلم"),
//         //                     Text(widget.infoBank.Tip_Description_Info ?? ''),
//         //                   ],
//         //                 )),
//         //           ],
//         //         ),
//         //       );
//         //     }
//         //   },
//         // ):
//         ListView.builder(
//           itemCount: 2,
//           itemBuilder: (context, index) {
//             if (index == 0) {
//               return
//                 Container(
//                 height: 600,
//                 child: Stack(
//                   children: [
//                     Image.asset(
//                       'assets/images/iPhone.png', width: 500,
//                       height: 500,
//                     ),
//                     Positioned(
//                       top: 21,
//                       left: 72,
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(40),
//                         child: Image.asset(
//                           _images[_currentIndex],
//
//                           height: 453,
//                           fit: BoxFit.contain,
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               );
//             } else {
//               return Container(
//                 child: Column(mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [Text(widget.infoBank.Related_Screen ?? ''),
//                         Text(widget.infoBank.Tip_Title ?? ''),
//                       ],
//                     ),
//                     GestureDetector(            onTap: () => _onTap(0),
//
//
//                       child: Container(height: 100,width: double.infinity,
//                           decoration: BoxDecoration(color: Colors.grey,
//                           borderRadius: BorderRadius.all(Radius.circular(10))),
//                           child: Column(
//                             children: [
//                               Text("خطوة1"),
//
//                             ],
//                           )),
//                     ), SizedBox(height:5,),
//                 GestureDetector(             onTap: () => _onTap(1),
//                     child:  Container(height: 100,width: double.infinity,decoration: BoxDecoration(color: Colors.green,
//                         borderRadius: BorderRadius.all(Radius.circular(10))),
//                         child: Column(
//                           children: [
//                             Text("خطوة2"),
//                           ],
//                         ))), SizedBox(height:5),
//                 GestureDetector(             onTap: () => _onTap(2),
//             child:Container(height: 100,width: double.infinity,decoration: BoxDecoration(color: Colors.grey,
//                         borderRadius: BorderRadius.all(Radius.circular(10))),
//                         child: Column(
//                           children: [
//                             Text("خطوة3"),
//                           ],
//                         ))),
//                   ],
//                 ),
//               );
//             }
//           },
//         )
//       ),
//     );
//   }
// }

