import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';
import 'dart:io';
import '../Widgets/Info_Manage_Widget.dart';
import '../data/Info_Bank_Data.dart';
import '../models/Info.dart';
import '../providers/GuideProvider.dart';
class InfoSectionScreen extends StatefulWidget {
  List<Info?> info;
  InfoSectionScreen({super.key, required this.info});

  @override
  State<InfoSectionScreen> createState() => _InfoSectionScreenState();
}

class _InfoSectionScreenState extends State<InfoSectionScreen> {
  final TextEditingController searchController = TextEditingController();
  List<Info?> filteredInfo = [];

  @override
  void initState() {
    super.initState();
    filteredInfo = widget.info;
  }

  void _searchInfo(String query) {
    if (query.toLowerCase() == 'new') {
      final searchedInfo = widget.info.where((info) => info!.Is_New == true).toList();
      setState(() {
        filteredInfo = searchedInfo;
      });
    } else {
      final searchedInfo = widget.info.where((info) {
        final title = info!.Tip_Title?.toLowerCase() ?? '';
        final section = info.Tip_Section?.toLowerCase() ?? '';
        final description = info.Tip_Description_Info?.toLowerCase() ?? '';
        final screen  = info. Related_Screen?.toLowerCase() ?? '';

        return title.contains(query.toLowerCase()) ||
            section.contains(query.toLowerCase()) ||screen.contains(query.toLowerCase()) ||
            description.contains(query.toLowerCase());
      }).toList();
      setState(() {
        filteredInfo = searchedInfo;
      });
    }
  }
  Future<void> infoToFirestore() async {
    final CollectionReference restrictionsDataCollection =
        FirebaseFirestore.instance.collection('InfoBankData');
    final Map<String, dynamic> bigMap = {'info': {}};

    for (var infoBank in infoBank.values.toList()) {
      final Map<String, dynamic> infoMap =
          infoBank.toMap(Path: 'InfoBankData/AllInfoData');
      bigMap['info'][infoBank.Tip_Title!] = infoMap;
      filteredInfo.add(infoBank);
    }

    restrictionsDataCollection.doc('AllInfoData').set(bigMap);


  }

  Future<void> deleteAllInfoToFirestore() async {
    final CollectionReference infoDataCollection =
        FirebaseFirestore.instance.collection('InfoBankData');

    // Get all documents in the collection
    QuerySnapshot snapshot = await infoDataCollection.get();

    // Loop through the documents and delete each one
    for (DocumentSnapshot document in snapshot.docs) {
      await document.reference.delete();
    }

    // Clear the infosList in the GuideProvider
    var guideProvider = Provider.of<GuideProvider>(context, listen: false);
    guideProvider.clearInfoList();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Info Bank"),
          actions: [TextButton(onPressed: (){

            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      InfoAddDetails(infoBank:
                      Info(Material_Path: '',
                          Tip_Title: '', Related_Screen: '', Related_App_Screen: '', Tip_Section: '', Is_ForOwner: null, Is_For_Admin: null, Android_Ver: null, Is_For_SalesTeam: null, IOS_Ver: null))),
            );

          }, child:const Text ("add"),),

            ],
        ),
        body: Consumer<GuideProvider>(builder: (context, guideProvider, child) {
          return Padding(
              padding: const EdgeInsets.all(10),
              child: ListView(children: [
                  TextField(
                  controller: searchController,
                  decoration: const InputDecoration(
                    labelText: 'Search in Info Bank',
                    prefixIcon: Icon(Icons.search),

                  ),
                    onChanged: (query) => _searchInfo(query),
                  ),
                ElevatedButton(
                    onPressed: () {
                      infoToFirestore();
                    },
                    child: const Text("set")),
                ElevatedButton(
                    onPressed: () {
                      deleteAllInfoToFirestore();
                    },
                    child: const Text("delete")),
                // (guideProvider.allInfo.isNotEmpty)
                    // ? Expanded(
                    //     child: GridView.builder(
                    //       gridDelegate:
                    //           const SliverGridDelegateWithFixedCrossAxisCount(
                    //         crossAxisCount:
                    //             2, // adjust the number of columns here
                    //         mainAxisSpacing: 10, // space between rows
                    //         crossAxisSpacing:
                    //             10, // adjust the number of columns here
                    //       ),
                    //       itemCount:
                    //           guideProvider.allInfo.length, // number of items
                    //       itemBuilder: (context, index) {
                    //         Info infoBank = guideProvider.allInfo[index];
                    //         return GestureDetector(
                    //           onTap: () {
                    //             Navigator.push(
                    //               context,
                    //               MaterialPageRoute(
                    //                 builder: (context) =>
                    //                     InfoScreen(infoBank: infoBank),
                    //               ),
                    //             );
                    //           },
                    //           child:
                    //           Stack(
                    //               children:[ Container(
                    //                   padding: const EdgeInsets.all(10),
                    //                   decoration: BoxDecoration(
                    //                     color: Colors.black,
                    //                     boxShadow: [
                    //                       BoxShadow(
                    //                         color: Colors.grey.withOpacity(0.5),
                    //                         spreadRadius: 2,
                    //                         blurRadius: 7,
                    //                         offset: const Offset(
                    //                             0, 3), // changes position of shadow
                    //                       ),
                    //                     ],
                    //                     borderRadius: BorderRadius.circular(
                    //                         20), // circular edge
                    //                   ),
                    //                   child:Column(children: [
                    //                     Center(
                    //                         child: Text(
                    //                           "(${index + 1})${infoBank.Tip_Title}",
                    //                           style: const TextStyle(
                    //                               color: Colors.amber,
                    //                               fontSize: 20,
                    //                               fontWeight: FontWeight.bold),
                    //                         )),
                    //                     Text("l:${infoBank.Is_Material_Lottie}",style: const TextStyle(
                    //                         color: Colors.amber,
                    //                         fontSize: 20,
                    //                         fontWeight: FontWeight.bold),),
                    //                     Text("P:${infoBank.Is_Material_Picture}",style: const TextStyle(
                    //                         color: Colors.amber,
                    //                         fontSize: 20,
                    //                         fontWeight: FontWeight.bold),),
                    //
                    //                   ],)
                    //               ),
                    //         Positioned(
                    //         top: 0,
                    //         right: 0,
                    //         child: IconButton(
                    //         icon: const Icon(
                    //         Icons.delete,
                    //         color: Colors.red,
                    //         ), onPressed: () {
                    //         showDialog(
                    //         context: context,
                    //         builder: (BuildContext context) {
                    //         return AlertDialog(
                    //         title: const Text("حذف العنصر"),
                    //         content: const Text("هل انت متاكد من حذف هذا العنصر؟"),
                    //         actions: [
                    //         TextButton(
                    //         child: const Text("الغاء"),
                    //         onPressed: () {
                    //         Navigator.of(context).pop();
                    //         },
                    //         ),
                    //         TextButton(
                    //         child: const Text("حذف"),
                    //         onPressed: () async {
                    //         // Remove item from allInfo
                    //         guideProvider.allInfo.removeAt(index);
                    //
                    //         // Create a map to store the updated data
                    //         final Map<String, dynamic> bigMap = {'info': {}};
                    //         // Populate the bigMap with the updated infoBank values
                    //         for (var infoBankValue in guideProvider.allInfo) {
                    //         final Map<String, dynamic> infoMap = infoBankValue.toMap(Path: 'InfoBankData/AllInfoData');
                    //         bigMap['info'][infoBankValue.Tip_Title!] = infoMap;
                    //         }
                    //
                    //         // Update the Firebase Firestore document with the new map
                    //         final CollectionReference restrictionsDataCollection =
                    //         FirebaseFirestore.instance.collection('InfoBankData');
                    //         await restrictionsDataCollection.doc('AllInfoData').set(bigMap);
                    //
                    //         setState(() {}); // Update the UI
                    //         Navigator.of(context).pop();
                    //         ScaffoldMessenger.of(context).showSnackBar(
                    //         const SnackBar(content: Text('Item deleted successfully!')),
                    //         );
                    //         },
                    //         ),
                    //         ],
                    //         );
                    //         },
                    //         );
                    //         },))
                    //         ]
                    //
                    //           ),
                    //         );
                    //       },
                    //     ),
                    //   )  // (guideProvider.allInfo.isNotEmpty)
                  (filteredInfo.isNotEmpty)
                    ? SizedBox(
                    height: MediaQuery.of(context).size.height ,
                    child: ReorderableGridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,

                  onReorder: (int oldIndex, int newIndex) {
                      if (oldIndex < newIndex) {
                        newIndex -= 1;
                      }
                      final Info? item = filteredInfo.removeAt(oldIndex);
                      filteredInfo.insert(newIndex, item);
                  },
                  children: List.generate(
                      filteredInfo.length,
                          (index) {
                        Info? infoBank = filteredInfo[index];
                        return GestureDetector(
                          key: Key('info-${index}'), // Add a unique key here

                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => InfoScreen(
                                  infoBank: infoBank!,
                                ),
                              ),
                            );
                          },
                          child: Stack(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Color(0xff212D45),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 7,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  children: [
                                    Center(
                                      child: Text(
                                        "(${index + 1})${infoBank!.Tip_Title}",
                                        style: const TextStyle(
                                          color: Colors.amber,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "l:${infoBank.Is_Material_Lottie}",
                                      style: const TextStyle(
                                        color: Colors.amber,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "P:${infoBank.Is_Material_Picture}",
                                      style: const TextStyle(
                                        color: Colors.amber,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text("حذف العنصر"),
                                          content: const Text("هل انت متاكد من حذف هذا العنصر؟"),
                                          actions: [
                                            TextButton(
                                              child: const Text("الغاء"),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                            TextButton(
                                              child: const Text("حذف"),
                                              onPressed: () async {
                                                // Remove item from allInfo
                                                guideProvider.allInfo.removeAt(index);
                                                // Remove item from filteredInfo
                                                setState(() {
                                                  filteredInfo.removeAt(index);
                                                });

                                                // Create a map to store the updated data
                                                final Map<String, dynamic> bigMap = {'info': {}};
                                                // Populate the bigMap with the updated infoBank values
                                                for (var infoBankValue in guideProvider.allInfo) {
                                                  final Map<String, dynamic> infoMap = infoBankValue.toMap(Path: 'InfoBankData/AllInfoData');
                                                  bigMap['info'][infoBankValue.Tip_Title!] = infoMap;
                                                }

                                                // Update the Firebase Firestore document with the new map
                                                final CollectionReference restrictionsDataCollection =
                                                FirebaseFirestore.instance.collection('InfoBankData');
                                                await restrictionsDataCollection.doc('AllInfoData').set(bigMap);

                                                setState(() {}); // Update the UI
                                                Navigator.of(context).pop();
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  const SnackBar(content: Text('Item deleted successfully!')),
                                                );
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                  ),
                ),
                    )
                    :
                  const Center(
                  child: Text(
                    'No Items Available for now',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
              ),
          );
        },
        ),
    );

  }
}

class InfoScreen extends StatefulWidget {
  final Info infoBank;

  const InfoScreen({super.key, required this.infoBank});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  int _currentIndex = 0;
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  bool _isAutoPlay = true;


  void onTap(int index) {
    setState(() {
      _currentIndex = index;
      _isAutoPlay = false; // Stop autoplay when a step is tapped
    });
    _carouselController.animateToPage(index);
  }
  @override
  void initState() {
    super.initState();
    // widget.infoBank.Material_Path_List = widget.infoBank.Material_Path_List!.map((path) => File(path)).toList();
  }
  @override
  Widget build(BuildContext context) {

    final icons = [
      Icons.looks_one,
      Icons.looks_two,
      Icons.looks_3, Icons.looks_4, Icons.looks_5, Icons.looks_6,
      // Add more icons here if needed
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.infoBank.Tip_Title!),
        actions: [TextButton(onPressed: (){
          Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
            InfoEditDetails(infoBank: widget.infoBank,)
          ),
        );}, child: const Text("edit")),],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child:
        //TextButton(onPressed: (){}, child: Text("edit")),
          (widget.infoBank.Is_Material_Lottie == true &&
            widget.infoBank.Material_Path !=
                "" &&
            widget.infoBank.Material_Path !=
                null)
            ? ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Lottie.network(
                "${widget.infoBank.Material_Path}",
                width: 300,
                height: 500,
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.infoBank.Related_Screen ?? ''),
                      Text(widget.infoBank.Tip_Title ?? ''),
                    ],
                  ),
                  Container(
                      height: 100,
                      decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius:
                          BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        children: [
                          const Text("الشرح"),
                          Text(
                              widget.infoBank.Tip_Description_Info ?? ''),
                        ],
                      )),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                      height: 100,
                      decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius:
                          BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        children: [
                          const Text("الفكرة"),
                          Text(
                              widget.infoBank.Tip_Description_Idea ?? ''),
                        ],
                      )),
                  const SizedBox(height: 5),
                  Container(
                      height: 100,
                      decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius:
                          BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        children: [
                          const Text("هل تعلم"),
                          Text(
                              widget.infoBank.Tip_Description_Info ?? ''),
                        ],
                      )),
                ],
              );
            }
          },
        )
            : ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {

              return Column(
                children: [
                  Row(mainAxisSize: MainAxisSize.min,
                    children: [

                      Flexible(flex:4,
                        child:
                        Stack(
                          children: [
                            Positioned(
                                top: 0,
                                left: 0,
                                bottom: 20,
                                right: 0,
                                child: CarouselSlider(
                                  items: widget.infoBank.Material_Path_List?.map((image) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(40),
                                      child: image is String
                                          ? image.startsWith('assets/')
                                          ? Image.asset(image)
                                          : Image.file(File(image),height: 250,  fit: BoxFit.cover, // Add a height to resize the image
                                        width: 250,)
                                          : Image.file(image as File, fit: BoxFit.cover,  height: 250, // Add a height to resize the image
                                   width: 250,),
                                      // Image.file(
                                      //   File(image),
                                      //   fit: BoxFit.cover,
                                      //   height: 250, // Add a height to resize the image
                                      //   width: 250,
                                      //
                                      // ),
                                    );
                                  }).toList(),
                                  carouselController: _carouselController,
                                  options: CarouselOptions(
                                    height: 550,
                                    autoPlay: _isAutoPlay,
                                    autoPlayInterval: const Duration(seconds: 2),
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
                                )),
                            Center(
                              child: Image.asset(
                                'assets/images/mobleIphone.png',
                                 fit: BoxFit.cover,
                                 //width: 600,
                                height:600,

                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex:1,
                        child: EasyStepper(

                          activeStep: _currentIndex,
    steps: List.generate(widget.infoBank.Material_Path_List!.length, (index) {
    return EasyStep(
    icon: const Icon(Icons.add),
    finishIcon: const Icon(Icons.done),
      activeIcon: Icon(icons[index % icons.length]), // Use the index to access the icon
    title: 'خطوة${index + 1}',
    );}),
                          // steps: const [
                          //   EasyStep(
                          //     icon: Icon(Icons.add), // required icon for this step
                          //     finishIcon: Icon(Icons.done), // icon to display when this step is finished
                          //     activeIcon: Icon(Icons.looks_one), // icon to display when this step is active
                          //     title: 'خطوة1', // title of this step
                          //   ), EasyStep(
                          //     icon: Icon(Icons.add), // required icon for this step
                          //     finishIcon: Icon(Icons.done), // icon to display when this step is finished
                          //     activeIcon: Icon(Icons.looks_two), // icon to display when this step is active
                          //     title: 'خطوة2', // title of this step
                          //   ), EasyStep(
                          //     icon: Icon(Icons.add), // required icon for this step
                          //     finishIcon: Icon(Icons.done), // icon to display when this step is finished
                          //     activeIcon: Icon(Icons.looks_3), // icon to display when this step is active
                          //     title: 'خطوة3', // title of this step
                          //   ),
                          //
                          // ],
                          lineType: LineType.dotted,
                          enableStepTapping: true,
                          direction: Axis.vertical,
                          onStepReached: (index) {
                            setState(() {
                              _currentIndex = index;
                              onTap(index);
                            });
                          },
                          unreachedStepBackgroundColor: Colors.transparent,
                          unreachedStepTextColor: const Color.fromRGBO(189, 189, 189, 1),
                          unreachedStepIconColor: const Color.fromRGBO(189, 189, 189, 1),
                          unreachedStepBorderColor: const Color.fromRGBO(189, 189, 189, 1),
                          activeStepTextColor: Colors.green,
                          activeStepIconColor: Colors.white,
                          activeStepBackgroundColor: Colors.green,
                          activeStepBorderColor: Colors.green,
                          finishedStepTextColor: Colors.black,
                          finishedStepBackgroundColor: Colors.green,
                          finishedStepBorderColor: Colors.black,
                          finishedStepIconColor: Colors.white,
                          lineColor: Colors.grey,
                          stepRadius: 30,
                          steppingEnabled: true,
                          disableScroll: true,
                          showTitle: true,
                          alignment: Alignment.center,
                          lineLength: 50,
                          lineDotRadius: 1,
                          lineSpace: 5,
                          padding: 0,
                          stepReachedAnimationEffect: Curves.bounceOut,
                          stepReachedAnimationDuration: const Duration(seconds: 1),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(

                        height:
                        150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color:Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,

                            children: [
                              Center(child: Text("${widget.infoBank.Tip_Main_Description}")),
                            ],
                          ),
                        )),
                  )
                ],
              );


          },
        ),

      ),
    );
  }
}



