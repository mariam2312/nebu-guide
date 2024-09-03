import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart'; // Import the image_picker package
import 'dart:io';
import '../data/Info_Bank_Data.dart';
import '../models/Info.dart';
import '../providers/GuideProvider.dart';

class InfoSectionScreen extends StatefulWidget {
  List<Info?> info;
  InfoSectionScreen({required this.info});

  @override
  State<InfoSectionScreen> createState() => _InfoSectionScreenState();
}

class _InfoSectionScreenState extends State<InfoSectionScreen> {
  Future<void> infoToFirestore() async {
    final CollectionReference restrictionsDataCollection =
        FirebaseFirestore.instance.collection('InfoBankData');
    final Map<String, dynamic> bigMap = {'info': {}};

    for (var infoBank in infoBank.values.toList()) {
      final Map<String, dynamic> infoMap =
          infoBank!.toMap(Path: 'InfoBankData/AllInfoData');
      bigMap['info'][infoBank.Tip_Title!] = infoMap;
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
        body: Consumer<GuideProvider>(builder: (context, guideProvider, child) {
          return Padding(
              padding: const EdgeInsets.all(10),
              child: Column(children: [
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
                (guideProvider.allInfo.isNotEmpty)
                    ? Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                2, // adjust the number of columns here
                            mainAxisSpacing: 10, // space between rows
                            crossAxisSpacing:
                                10, // adjust the number of columns here
                          ),
                          itemCount:
                              guideProvider.allInfo.length, // number of items
                          itemBuilder: (context, index) {
                            Info infoBank = guideProvider.allInfo[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        InfoScreen(infoBank: infoBank),
                                  ),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 7,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(
                                      20), // circular edge
                                ),
                                child:Column(children: [
                                  Center(
                                    child: Text(
                                      "(${index + 1})${infoBank.Tip_Title}",
                                      style: const TextStyle(
                                          color: Colors.amber,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  Text("lottiefile:${infoBank.Is_Material_Lottie}",style: const TextStyle(
                                      color: Colors.amber,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),),
                                  Text("Picture:${infoBank.Is_Material_Picture}",style: const TextStyle(
                                      color: Colors.amber,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),),
                                  // Text("youtupe:${infoBank.Is_Material_YouTube}",style: const TextStyle(
                                  //     color: Colors.amber,
                                  //     fontSize: 20,
                                  //     fontWeight: FontWeight.bold),),
                                ],)
                              ),
                            );
                          },
                        ),
                      )
                    : const Center(
                        child: Text(
                          'No Items Available for now',
                          style: TextStyle(color: Colors.red),
                        ),
                      )
              ]));
        }));
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
  // final List<String> _images = [
  //   'assets/images/openaccount1.jpg',
  //   'assets/images/openaccount2.jpg',
  //   'assets/images/openaccount3.jpg',
  // ];

  void onTap(int index) {
    setState(() {
      _currentIndex = index;
      _isAutoPlay = false; // Stop autoplay when a step is tapped
    });
    _carouselController.animateToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.infoBank.Tip_Title!),
        actions: [TextButton(onPressed: (){
          Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
            InfoDetails(infoBank: widget.infoBank,)
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
          itemCount: 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Stack(
                children: [
                  Positioned(
                      top: 0,
                      left: 0,
                      bottom: 10,
                      right: 0,
                      child: CarouselSlider(
                        items: widget.infoBank.Material_Path_List?.map((image) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image.asset(
                              image,
                              fit: BoxFit.contain,
                            ),
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
                      width: 500,
                      height: 600,
                    ),
                  ),
                ],
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
                  GestureDetector(
                    onTap: () => onTap(0),
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: _currentIndex == 0
                            ? Colors.green
                            : Colors.grey,
                        borderRadius:
                        const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: const Center(
                        child: Text("خطوة1"),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  GestureDetector(
                    onTap: () => onTap(1),
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: _currentIndex == 1
                            ? Colors.green
                            : Colors.grey,
                        borderRadius:
                        const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: const Center(
                        child: Text("خطوة2"),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  GestureDetector(
                    onTap: () => onTap(2),
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: _currentIndex == 2
                            ? Colors.green
                            : Colors.grey,
                        borderRadius:
                        const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: const Center(
                        child: Text("خطوة3"),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),

      ),
    );
  }
}

class InfoDetails extends StatefulWidget {
  final Info infoBank;

  const InfoDetails({super.key, required this.infoBank});

  @override
  State<InfoDetails> createState() => _InfoDetailsState();
}

class _InfoDetailsState extends State<InfoDetails> {

  late TextEditingController _titleController;
  late TextEditingController _sectionController;
  late TextEditingController _relatedScreenController;
  late TextEditingController _orderNumberController;
  late TextEditingController _mainDescriptionController;
  late TextEditingController _descriptionIdeaController;
  late TextEditingController _descriptionInfoController;
  late TextEditingController _techDetailsController;
  late TextEditingController _isBasicController;
  late TextEditingController _isNewController;
  late TextEditingController _isFAQController;
  late TextEditingController _isOfficialController;
  late TextEditingController _isStepByStepController;
  late TextEditingController _isMaterialLottieController;
  late TextEditingController _isMaterialPictureController;
  late TextEditingController _isMaterialYouTubeController;
  late TextEditingController _relatedAppScreenController;
  late TextEditingController _materialPathController;
  late TextEditingController _materialPathListController;
  late TextEditingController _androidVerController;
  late TextEditingController _iosVerController;
  late TextEditingController _isOptionalController;
  late TextEditingController _isRequiredController;
  late TextEditingController _isTakeTimeController;
  late TextEditingController _isComingSoonController;
  late TextEditingController _isForAdminController;
  late TextEditingController _isForSalesTeamController;
  late TextEditingController _isForOwnerController;
  List<File> _selectedImages = []; // List to store selected images

  final ImagePicker _picker = ImagePicker();
  @override
  void initState() {
    super.initState();

    // Initialize controllers with the infoBank values
    _titleController = TextEditingController(text: widget.infoBank.Tip_Title ?? '');
    _sectionController = TextEditingController(text: widget.infoBank.Tip_Section ?? '');
    _relatedScreenController = TextEditingController(text: widget.infoBank.Related_Screen ?? '');
    _orderNumberController = TextEditingController(text: widget.infoBank.Tip_Order_Number ?? '');
    _mainDescriptionController = TextEditingController(text: widget.infoBank.Tip_Main_Description ?? '');
    _descriptionIdeaController = TextEditingController(text: widget.infoBank.Tip_Description_Idea ?? '');
    _descriptionInfoController = TextEditingController(text: widget.infoBank.Tip_Description_Info ?? '');
    _techDetailsController = TextEditingController(text: widget.infoBank.Tip_Tech_Details ?? '');
    _isBasicController = TextEditingController(text: widget.infoBank.Is_Basic.toString());
    _isNewController = TextEditingController(text: widget.infoBank.Is_New.toString());
    _isFAQController = TextEditingController(text: widget.infoBank.Is_FAQ.toString());
    _isOfficialController = TextEditingController(text: widget.infoBank.Is_Official.toString());
    _isStepByStepController = TextEditingController(text: widget.infoBank.Is_Step_By_Step.toString());
    _isMaterialLottieController = TextEditingController(text: widget.infoBank.Is_Material_Lottie.toString());
    _isMaterialPictureController = TextEditingController(text: widget.infoBank.Is_Material_Picture.toString());
    _isMaterialYouTubeController = TextEditingController(text: widget.infoBank.Is_Material_YouTube.toString());
    _relatedAppScreenController = TextEditingController(text: widget.infoBank.Related_App_Screen ?? '');
    _materialPathController = TextEditingController(text: widget.infoBank.Material_Path ?? '');
    _materialPathListController = TextEditingController(text: widget.infoBank.Material_Path_List .toString()?? '');
    _androidVerController = TextEditingController(text: widget.infoBank.Android_Ver.toString() ?? '');
    _iosVerController = TextEditingController(text: widget.infoBank.IOS_Ver .toString()?? '');
    _isOptionalController = TextEditingController(text: widget.infoBank.Is_Optional.toString());
    _isRequiredController = TextEditingController(text: widget.infoBank.Is_Required.toString());
    _isTakeTimeController = TextEditingController(text: widget.infoBank.Is_Take_Time.toString());
    _isComingSoonController = TextEditingController(text: widget.infoBank.Is_ComingSoon.toString());
    _isForAdminController = TextEditingController(text: widget.infoBank.Is_For_Admin.toString());
    _isForSalesTeamController = TextEditingController(text: widget.infoBank.Is_For_SalesTeam.toString());
    _isForOwnerController = TextEditingController(text: widget.infoBank.Is_ForOwner.toString());
  }

  @override
  void dispose() {
    _titleController.dispose();
    _sectionController.dispose();
    _relatedScreenController.dispose();
    _orderNumberController.dispose();
    _mainDescriptionController.dispose();
    _descriptionIdeaController.dispose();
    _descriptionInfoController.dispose();
    _techDetailsController.dispose();
    _isBasicController.dispose();
    _isNewController.dispose();
    _isFAQController.dispose();
    _isOfficialController.dispose();
    _isStepByStepController.dispose();
    _isMaterialLottieController.dispose();
    _isMaterialPictureController.dispose();
    _isMaterialYouTubeController.dispose();
    _relatedAppScreenController.dispose();
    _materialPathController.dispose();
    _materialPathListController.dispose();
    _androidVerController.dispose();
    _iosVerController.dispose();
    _isOptionalController.dispose();
    _isRequiredController.dispose();
    _isTakeTimeController.dispose();
    _isComingSoonController.dispose();
    _isForAdminController.dispose();
    _isForSalesTeamController.dispose();
    _isForOwnerController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImages.add(File(pickedFile.path));
      });
    }
  }
  Future<void> _removeImage(int index) async {
    setState(() {
      _selectedImages.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.infoBank.Tip_Title ?? 'Info Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save) ,
            onPressed: () {

                _saveChanges();

            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildTextField('Tip_Title', _titleController),
          _buildTextField('Tip_Section', _sectionController),
          _buildTextField('Related_Screen', _relatedScreenController),
          _buildTextField('Tip_Order_Number', _orderNumberController),
          _buildTextField('Tip_Main_Description', _mainDescriptionController),
          _buildTextField('Tip_Description_Idea', _descriptionIdeaController),
          _buildTextField('Tip_Description_Info', _descriptionInfoController),
          _buildTextField('Tip_Tech_Details', _techDetailsController),
          _buildTextField('Is_Basic', _isBasicController,),
          _buildTextField('Is_New', _isNewController, ),
          _buildTextField('Is_FAQ', _isFAQController, ),
          _buildTextField('Is_Official', _isOfficialController, ),
          _buildTextField('Is_Step_By_Step', _isStepByStepController, ),
          _buildTextField('Is_Material_Lottie', _isMaterialLottieController, ),
          _buildTextField('Is_Material_Picture', _isMaterialPictureController, ),
          _buildTextField('Is_Material_YouTube', _isMaterialYouTubeController, ),
          _buildTextField('Related_App_Screen', _relatedAppScreenController),
          _buildTextField('Material_Path', _materialPathController),
          _buildTextField('Material_Path_List', _materialPathListController,isPicutreList:true),
          _selectedImages.isEmpty
              ? const Center(child: Text('No images selected'))
              : SizedBox(
            height:400,

            child: ReorderableListView(
              onReorder: (oldIndex, newIndex) {
                // Update the list of images based on the reorder
                if (oldIndex < newIndex) {
                  newIndex -= 1;
                }
                final item = _selectedImages.removeAt(oldIndex);
                _selectedImages.insert(newIndex, item);
              },
              children: List.generate(_selectedImages.length, (index) {
                final image = _selectedImages[index];
                return Dismissible(
                  key: ValueKey(image.path), // Use unique key for each item
                  onDismissed: (direction) {
                    _removeImage(index);
                  },
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(8.0),
                    leading: Image.file(
                      image,
                      height: 200,
                      width: 100,
                    //  fit: BoxFit.cover,
                    ),
                    title: Text('Image ${index + 1}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.remove_circle, color: Colors.red),
                      onPressed: () {
                        _removeImage(index);
                      },
                    ),
                  ),
                );
              }),
         )
          ),
          _buildTextField('Android_Ver', _androidVerController,isNumeric: true),
          _buildTextField('IOS_Ver', _iosVerController,isNumeric: true),
          _buildTextField('Is_Optional', _isOptionalController, ),
          _buildTextField('Is_Required', _isRequiredController, ),
          _buildTextField('Is_Take_Time', _isTakeTimeController, ),
          _buildTextField('Is_ComingSoon', _isComingSoonController, ),
          _buildTextField('Is_For_Admin', _isForAdminController, ),
          _buildTextField('Is_For_SalesTeam', _isForSalesTeamController,),
          _buildTextField('Is_ForOwner', _isForOwnerController, ),
        ],
      ),
    );
  }
  Future<void> _saveChanges() async {


        widget.infoBank. Tip_Title = _titleController.text;
        widget.infoBank.  Tip_Section = _sectionController.text;
        widget.infoBank.   Related_Screen = _relatedScreenController.text;
        widget.infoBank.  Tip_Order_Number = _orderNumberController.text;
        widget.infoBank. Tip_Main_Description = _mainDescriptionController.text;
        widget.infoBank.Tip_Description_Idea = _descriptionIdeaController.text;
        widget.infoBank.  Tip_Description_Info = _descriptionInfoController.text;
        widget.infoBank. Tip_Tech_Details =_techDetailsController.text;

    // Convert string values to boolean if necessary
        widget.infoBank.Is_Basic =_isBasicController.text.toLowerCase() == 'true';
        widget.infoBank.Is_New = _isNewController.text.toLowerCase() == 'true';
        widget.infoBank.  Is_FAQ = _isFAQController.text.toLowerCase() == 'true';
        widget.infoBank.   Is_Official = _isOfficialController.text.toLowerCase() == 'true';
        widget.infoBank. Is_Step_By_Step = _isStepByStepController.text.toLowerCase() == 'true';
        widget.infoBank.   Is_Material_Lottie = _isMaterialLottieController.text.toLowerCase() == 'true';
        widget.infoBank.Is_Material_Picture = _isMaterialPictureController.text.toLowerCase() == 'true';
        widget.infoBank. Is_Material_YouTube = _isMaterialYouTubeController.text.toLowerCase() == 'true';

        widget.infoBank.Related_App_Screen = _relatedAppScreenController.text;
        widget.infoBank.Material_Path = _materialPathController.text;
    // Save image paths in Material_Path_List
    List<String> imagePaths = _selectedImages.map((image) => image.path).toList();
    widget.infoBank.Material_Path_List = imagePaths;
    widget.infoBank.Android_Ver = int.tryParse(_androidVerController.text);
    widget.infoBank.IOS_Ver = int.tryParse(_iosVerController.text);


    widget.infoBank.Is_Optional = _isOptionalController.text.toLowerCase() == 'true';
    widget.infoBank.Is_Required = _isRequiredController.text.toLowerCase() == 'true';
    widget.infoBank.Is_Take_Time = _isTakeTimeController.text.toLowerCase() == 'true';
    widget.infoBank.Is_ComingSoon = _isComingSoonController.text.toLowerCase() == 'true';
    widget.infoBank.Is_For_Admin = _isForAdminController.text.toLowerCase() == 'true';
    widget.infoBank.Is_For_SalesTeam = _isForSalesTeamController.text.toLowerCase() == 'true';
    widget.infoBank.Is_ForOwner = _isForOwnerController.text.toLowerCase() == 'true';
    // // Save changes to Firestore
    // final docRef = FirebaseFirestore.instance.collection('InfoBankData').doc('AllInfoData');
    // await docRef.update({
    //   'info.${widget.infoBank.Tip_Title}': widget.infoBank.toMap(Path: 'InfoBankData/AllInfoData')
    // });
    //
    //
    // // Update GuideProvider
    // var guideProvider = Provider.of<GuideProvider>(context, listen: false);
    // guideProvider.updateInfo(widget.infoBank);  // Ensure updateInfo method is implemented in GuideProvider


    // Optional: Show confirmation or feedback to the user
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Changes saved successfully!')),
    );

  }

  Widget _buildTextField(String label, TextEditingController controller, {bool isNumeric = false,bool isPicutreList = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: isNumeric ? TextInputType.number : TextInputType.text,

        decoration: InputDecoration(
          labelText: label,
          suffixIcon: (isPicutreList==true)?IconButton(
            icon: Icon(Icons.add_a_photo),
            onPressed: _pickImage,
          ):null,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}



//
// import 'dart:async';
//
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:ntp/ntp.dart';
// import 'package:provider/provider.dart';
// import 'package:image_picker/image_picker.dart'; // Import the image_picker package
// import 'dart:io';
// import '../data/Info_Bank_Data.dart';
// import '../models/Info.dart';
// import '../providers/FirestoreDataBase.dart';
// import '../providers/GuideProvider.dart';
//
// class InfoSectionScreen extends StatefulWidget {
//   List<Info?> info;
//   InfoSectionScreen({required this.info});
//
//   @override
//   State<InfoSectionScreen> createState() => _InfoSectionScreenState();
// }
//
// class _InfoSectionScreenState extends State<InfoSectionScreen> {
//   Future<void> infoToFirestore() async {
//     final CollectionReference restrictionsDataCollection =
//     FirebaseFirestore.instance.collection('InfoBankData');
//     final Map<String, dynamic> bigMap = {'info': {}};
//
//     for (var infoBank in infoBank.values.toList()) {
//       final Map<String, dynamic> infoMap =
//       infoBank!.toMap(Path: 'InfoBankData/AllInfoData');
//       bigMap['info'][infoBank.Tip_Title!] = infoMap;
//     }
//
//     restrictionsDataCollection.doc('AllInfoData').set(bigMap);
//   }
//
//   Future<void> deleteAllInfoToFirestore() async {
//     final CollectionReference infoDataCollection =
//     FirebaseFirestore.instance.collection('InfoBankData');
//
//     // Get all documents in the collection
//     QuerySnapshot snapshot = await infoDataCollection.get();
//
//     // Loop through the documents and delete each one
//     for (DocumentSnapshot document in snapshot.docs) {
//       await document.reference.delete();
//     }
//
//     // Clear the restrictionsList in the GuideProvider
//     var guideProvider = Provider.of<GuideProvider>(context, listen: false);
//     guideProvider.clearInfoList();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text("Info Bank"),
//         ),
//         body: Consumer<GuideProvider>(builder: (context, guideProvider, child) {
//           return Padding(
//               padding: const EdgeInsets.all(10),
//               child: Column(children: [
//                 ElevatedButton(
//                     onPressed: () {
//                       infoToFirestore();
//                     },
//                     child: const Text("set")),
//                 ElevatedButton(
//                     onPressed: () {
//                       deleteAllInfoToFirestore();
//                     },
//                     child: const Text("delete")),
//                 (guideProvider.allInfo.isNotEmpty)
//                     ? Expanded(
//                   child: GridView.builder(
//                     gridDelegate:
//                     const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount:
//                       2, // adjust the number of columns here
//                       mainAxisSpacing: 10, // space between rows
//                       crossAxisSpacing:
//                       10, // adjust the number of columns here
//                     ),
//                     itemCount:
//                     guideProvider.allInfo.length, // number of items
//                     itemBuilder: (context, index) {
//                       Info infoBank = guideProvider.allInfo[index];
//                       return GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) =>
//                                   InfoScreen(infoBank: infoBank),
//                             ),
//                           );
//                         },
//                         child: Container(
//                             padding: const EdgeInsets.all(10),
//                             decoration: BoxDecoration(
//                               color: Colors.black,
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.grey.withOpacity(0.5),
//                                   spreadRadius: 2,
//                                   blurRadius: 7,
//                                   offset: const Offset(
//                                       0, 3), // changes position of shadow
//                                 ),
//                               ],
//                               borderRadius: BorderRadius.circular(
//                                   20), // circular edge
//                             ),
//                             child:Column(children: [
//                               Center(
//                                   child: Text(
//                                     "(${index + 1})${infoBank.Tip_Title}",
//                                     style: const TextStyle(
//                                         color: Colors.amber,
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold),
//                                   )),
//                               Text("lottiefile:${infoBank.Is_Material_Lottie}",style: const TextStyle(
//                                   color: Colors.amber,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold),),
//                               Text("Picture:${infoBank.Is_Material_Picture}",style: const TextStyle(
//                                   color: Colors.amber,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold),),
//                               // Text("youtupe:${infoBank.Is_Material_YouTube}",style: const TextStyle(
//                               //     color: Colors.amber,
//                               //     fontSize: 20,
//                               //     fontWeight: FontWeight.bold),),
//                             ],)
//                         ),
//                       );
//                     },
//                   ),
//                 )
//                     : const Center(
//                   child: Text(
//                     'No Items Available for now',
//                     style: TextStyle(color: Colors.red),
//                   ),
//                 )
//               ]));
//         }));
//   }
// }
//
// class InfoScreen extends StatefulWidget {
//   final Info infoBank;
//
//   const InfoScreen({super.key, required this.infoBank});
//
//   @override
//   State<InfoScreen> createState() => _InfoScreenState();
// }
//
// class _InfoScreenState extends State<InfoScreen> {
//   int _currentIndex = 0;
//   final CarouselSliderController _carouselController =
//   CarouselSliderController();
//   bool _isAutoPlay = true;
//   // final List<String> _images = [
//   //   'assets/images/openaccount1.jpg',
//   //   'assets/images/openaccount2.jpg',
//   //   'assets/images/openaccount3.jpg',
//   // ];
//
//   void onTap(int index) {
//     setState(() {
//       _currentIndex = index;
//       _isAutoPlay = false; // Stop autoplay when a step is tapped
//     });
//     _carouselController.animateToPage(index);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.infoBank.Tip_Title!),
//         actions: [TextButton(onPressed: (){
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) =>
//                     InfoDetails(infoBank: widget.infoBank,)
//             ),
//           );}, child: const Text("edit")),],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child:
//         //TextButton(onPressed: (){}, child: Text("edit")),
//         (widget.infoBank.Is_Material_Lottie == true &&
//             widget.infoBank.Material_Path !=
//                 "" &&
//             widget.infoBank.Material_Path !=
//                 null)
//             ? ListView.builder(
//           itemCount: 2,
//           itemBuilder: (context, index) {
//             if (index == 0) {
//               return Lottie.network(
//                 "${widget.infoBank.Material_Path}",
//                 width: 300,
//                 height: 500,
//               );
//             } else {
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(widget.infoBank.Related_Screen ?? ''),
//                       Text(widget.infoBank.Tip_Title ?? ''),
//                     ],
//                   ),
//                   Container(
//                       height: 100,
//                       decoration: const BoxDecoration(
//                           color: Colors.grey,
//                           borderRadius:
//                           BorderRadius.all(Radius.circular(10))),
//                       child: Column(
//                         children: [
//                           const Text("الشرح"),
//                           Text(
//                               widget.infoBank.Tip_Description_Info ?? ''),
//                         ],
//                       )),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   Container(
//                       height: 100,
//                       decoration: const BoxDecoration(
//                           color: Colors.green,
//                           borderRadius:
//                           BorderRadius.all(Radius.circular(10))),
//                       child: Column(
//                         children: [
//                           const Text("الفكرة"),
//                           Text(
//                               widget.infoBank.Tip_Description_Idea ?? ''),
//                         ],
//                       )),
//                   const SizedBox(height: 5),
//                   Container(
//                       height: 100,
//                       decoration: const BoxDecoration(
//                           color: Colors.grey,
//                           borderRadius:
//                           BorderRadius.all(Radius.circular(10))),
//                       child: Column(
//                         children: [
//                           const Text("هل تعلم"),
//                           Text(
//                               widget.infoBank.Tip_Description_Info ?? ''),
//                         ],
//                       )),
//                 ],
//               );
//             }
//           },
//         )
//             : ListView.builder(
//           itemCount: 2,
//           itemBuilder: (context, index) {
//             if (index == 0) {
//               return Stack(
//                 children: [
//                   Positioned(
//                       top: 0,
//                       left: 0,
//                       bottom: 10,
//                       right: 0,
//                       child: CarouselSlider(
//                         items: widget.infoBank.Material_Path_List?.map((image) {
//                           return ClipRRect(
//                             borderRadius: BorderRadius.circular(40),
//                             child: Image.asset(
//                               image,
//                               fit: BoxFit.contain,
//                             ),
//                           );
//                         }).toList(),
//                         carouselController: _carouselController,
//                         options: CarouselOptions(
//                           height: 550,
//                           autoPlay: _isAutoPlay,
//                           autoPlayInterval: const Duration(seconds: 2),
//                           enlargeCenterPage: true,
//                           viewportFraction: 1.0,
//                           aspectRatio: 1.0,
//                           initialPage: 0,
//                           reverse: true,
//                           onPageChanged: (index, reason) {
//                             setState(() {
//                               _currentIndex = index;
//                             });
//                           },
//                         ),
//                       )),
//                   Center(
//                     child: Image.asset(
//                       'assets/images/mobleIphone.png',
//                       width: 500,
//                       height: 600,
//                     ),
//                   ),
//                 ],
//               );
//             } else {
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(widget.infoBank.Related_Screen ?? ''),
//                       Text(widget.infoBank.Tip_Title ?? ''),
//                     ],
//                   ),
//                   GestureDetector(
//                     onTap: () => onTap(0),
//                     child: Container(
//                       height: 100,
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         color: _currentIndex == 0
//                             ? Colors.green
//                             : Colors.grey,
//                         borderRadius:
//                         const BorderRadius.all(Radius.circular(10)),
//                       ),
//                       child: const Center(
//                         child: Text("خطوة1"),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 5),
//                   GestureDetector(
//                     onTap: () => onTap(1),
//                     child: Container(
//                       height: 100,
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         color: _currentIndex == 1
//                             ? Colors.green
//                             : Colors.grey,
//                         borderRadius:
//                         const BorderRadius.all(Radius.circular(10)),
//                       ),
//                       child: const Center(
//                         child: Text("خطوة2"),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 5),
//                   GestureDetector(
//                     onTap: () => onTap(2),
//                     child: Container(
//                       height: 100,
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         color: _currentIndex == 2
//                             ? Colors.green
//                             : Colors.grey,
//                         borderRadius:
//                         const BorderRadius.all(Radius.circular(10)),
//                       ),
//                       child: const Center(
//                         child: Text("خطوة3"),
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             }
//           },
//         ),
//
//       ),
//     );
//   }
// }
//
// class InfoDetails extends StatefulWidget {
//   final Info infoBank;
//
//   const InfoDetails({super.key, required this.infoBank});
//
//   @override
//   State<InfoDetails> createState() => _InfoDetailsState();
// }
//
// class _InfoDetailsState extends State<InfoDetails> {
//
//   late TextEditingController _titleController;
//   late TextEditingController _sectionController;
//   late TextEditingController _relatedScreenController;
//   late TextEditingController _orderNumberController;
//   late TextEditingController _mainDescriptionController;
//   late TextEditingController _descriptionIdeaController;
//   late TextEditingController _descriptionInfoController;
//   late TextEditingController _techDetailsController;
//   late TextEditingController _isBasicController;
//   late TextEditingController _isNewController;
//   late TextEditingController _isFAQController;
//   late TextEditingController _isOfficialController;
//   late TextEditingController _isStepByStepController;
//   late TextEditingController _isMaterialLottieController;
//   late TextEditingController _isMaterialPictureController;
//   late TextEditingController _isMaterialYouTubeController;
//   late TextEditingController _relatedAppScreenController;
//   late TextEditingController _materialPathController;
//   late TextEditingController _materialPathListController;
//   late TextEditingController _androidVerController;
//   late TextEditingController _iosVerController;
//   late TextEditingController _isOptionalController;
//   late TextEditingController _isRequiredController;
//   late TextEditingController _isTakeTimeController;
//   late TextEditingController _isComingSoonController;
//   late TextEditingController _isForAdminController;
//   late TextEditingController _isForSalesTeamController;
//   late TextEditingController _isForOwnerController;
//   List<File> _selectedImages = []; // List to store selected images
//
//   final ImagePicker _picker = ImagePicker();
//   @override
//   void initState() {
//     super.initState();
//
//     // Initialize controllers with the infoBank values
//     _titleController = TextEditingController(text: widget.infoBank.Tip_Title ?? '');
//     _sectionController = TextEditingController(text: widget.infoBank.Tip_Section ?? '');
//     _relatedScreenController = TextEditingController(text: widget.infoBank.Related_Screen ?? '');
//     _orderNumberController = TextEditingController(text: widget.infoBank.Tip_Order_Number ?? '');
//     _mainDescriptionController = TextEditingController(text: widget.infoBank.Tip_Main_Description ?? '');
//     _descriptionIdeaController = TextEditingController(text: widget.infoBank.Tip_Description_Idea ?? '');
//     _descriptionInfoController = TextEditingController(text: widget.infoBank.Tip_Description_Info ?? '');
//     _techDetailsController = TextEditingController(text: widget.infoBank.Tip_Tech_Details ?? '');
//     _isBasicController = TextEditingController(text: widget.infoBank.Is_Basic.toString());
//     _isNewController = TextEditingController(text: widget.infoBank.Is_New.toString());
//     _isFAQController = TextEditingController(text: widget.infoBank.Is_FAQ.toString());
//     _isOfficialController = TextEditingController(text: widget.infoBank.Is_Official.toString());
//     _isStepByStepController = TextEditingController(text: widget.infoBank.Is_Step_By_Step.toString());
//     _isMaterialLottieController = TextEditingController(text: widget.infoBank.Is_Material_Lottie.toString());
//     _isMaterialPictureController = TextEditingController(text: widget.infoBank.Is_Material_Picture.toString());
//     _isMaterialYouTubeController = TextEditingController(text: widget.infoBank.Is_Material_YouTube.toString());
//     _relatedAppScreenController = TextEditingController(text: widget.infoBank.Related_App_Screen ?? '');
//     _materialPathController = TextEditingController(text: widget.infoBank.Material_Path ?? '');
//     _materialPathListController = TextEditingController(text: widget.infoBank.Material_Path_List .toString()?? '');
//     _androidVerController = TextEditingController(text: widget.infoBank.Android_Ver.toString() ?? '');
//     _iosVerController = TextEditingController(text: widget.infoBank.IOS_Ver .toString()?? '');
//     _isOptionalController = TextEditingController(text: widget.infoBank.Is_Optional.toString());
//     _isRequiredController = TextEditingController(text: widget.infoBank.Is_Required.toString());
//     _isTakeTimeController = TextEditingController(text: widget.infoBank.Is_Take_Time.toString());
//     _isComingSoonController = TextEditingController(text: widget.infoBank.Is_ComingSoon.toString());
//     _isForAdminController = TextEditingController(text: widget.infoBank.Is_For_Admin.toString());
//     _isForSalesTeamController = TextEditingController(text: widget.infoBank.Is_For_SalesTeam.toString());
//     _isForOwnerController = TextEditingController(text: widget.infoBank.Is_ForOwner.toString());
//   }
//
//   @override
//   void dispose() {
//     _titleController.dispose();
//     _sectionController.dispose();
//     _relatedScreenController.dispose();
//     _orderNumberController.dispose();
//     _mainDescriptionController.dispose();
//     _descriptionIdeaController.dispose();
//     _descriptionInfoController.dispose();
//     _techDetailsController.dispose();
//     _isBasicController.dispose();
//     _isNewController.dispose();
//     _isFAQController.dispose();
//     _isOfficialController.dispose();
//     _isStepByStepController.dispose();
//     _isMaterialLottieController.dispose();
//     _isMaterialPictureController.dispose();
//     _isMaterialYouTubeController.dispose();
//     _relatedAppScreenController.dispose();
//     _materialPathController.dispose();
//     _materialPathListController.dispose();
//     _androidVerController.dispose();
//     _iosVerController.dispose();
//     _isOptionalController.dispose();
//     _isRequiredController.dispose();
//     _isTakeTimeController.dispose();
//     _isComingSoonController.dispose();
//     _isForAdminController.dispose();
//     _isForSalesTeamController.dispose();
//     _isForOwnerController.dispose();
//     super.dispose();
//   }
//
//   Future<void> _pickImage() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//
//     if (pickedFile != null) {
//       setState(() {
//         _selectedImages.add(File(pickedFile.path));
//       });
//     }
//   }
//   Future<void> _removeImage(int index) async {
//     setState(() {
//       _selectedImages.removeAt(index);
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.infoBank.Tip_Title ?? 'Info Details'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.save) ,
//             onPressed: () {
//
//               _saveChanges();
//
//             },
//           ),
//         ],
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(16.0),
//         children: [
//           _buildTextField('Tip_Title', _titleController),
//           _buildTextField('Tip_Section', _sectionController),
//           _buildTextField('Related_Screen', _relatedScreenController),
//           _buildTextField('Tip_Order_Number', _orderNumberController),
//           _buildTextField('Tip_Main_Description', _mainDescriptionController),
//           _buildTextField('Tip_Description_Idea', _descriptionIdeaController),
//           _buildTextField('Tip_Description_Info', _descriptionInfoController),
//           _buildTextField('Tip_Tech_Details', _techDetailsController),
//           _buildTextField('Is_Basic', _isBasicController,),
//           _buildTextField('Is_New', _isNewController, ),
//           _buildTextField('Is_FAQ', _isFAQController, ),
//           _buildTextField('Is_Official', _isOfficialController, ),
//           _buildTextField('Is_Step_By_Step', _isStepByStepController, ),
//           _buildTextField('Is_Material_Lottie', _isMaterialLottieController, ),
//           _buildTextField('Is_Material_Picture', _isMaterialPictureController, ),
//           _buildTextField('Is_Material_YouTube', _isMaterialYouTubeController, ),
//           _buildTextField('Related_App_Screen', _relatedAppScreenController),
//           _buildTextField('Material_Path', _materialPathController),
//           _buildTextField('Material_Path_List', _materialPathListController,isPicutreList:true),
//           _selectedImages.isEmpty
//               ? const Center(child: Text('No images selected'))
//               : SizedBox(
//               height:400,
//
//               child: ReorderableListView(
//                 onReorder: (oldIndex, newIndex) {
//                   // Update the list of images based on the reorder
//                   if (oldIndex < newIndex) {
//                     newIndex -= 1;
//                   }
//                   final item = _selectedImages.removeAt(oldIndex);
//                   _selectedImages.insert(newIndex, item);
//                 },
//                 children: List.generate(_selectedImages.length, (index) {
//                   final image = _selectedImages[index];
//                   return Dismissible(
//                     key: ValueKey(image.path), // Use unique key for each item
//                     onDismissed: (direction) {
//                       _removeImage(index);
//                     },
//                     child: ListTile(
//                       contentPadding: const EdgeInsets.all(8.0),
//                       leading: Image.file(
//                         image,
//                         height: 200,
//                         width: 100,
//                         //  fit: BoxFit.cover,
//                       ),
//                       title: Text('Image ${index + 1}'),
//                       trailing: IconButton(
//                         icon: const Icon(Icons.remove_circle, color: Colors.red),
//                         onPressed: () {
//                           _removeImage(index);
//                         },
//                       ),
//                     ),
//                   );
//                 }),
//               )
//           ),
//           _buildTextField('Android_Ver', _androidVerController,isNumeric: true),
//           _buildTextField('IOS_Ver', _iosVerController,isNumeric: true),
//           _buildTextField('Is_Optional', _isOptionalController, ),
//           _buildTextField('Is_Required', _isRequiredController, ),
//           _buildTextField('Is_Take_Time', _isTakeTimeController, ),
//           _buildTextField('Is_ComingSoon', _isComingSoonController, ),
//           _buildTextField('Is_For_Admin', _isForAdminController, ),
//           _buildTextField('Is_For_SalesTeam', _isForSalesTeamController,),
//           _buildTextField('Is_ForOwner', _isForOwnerController, ),
//         ],
//       ),
//     );
//   }
//   Future<void> updateInfoDetails(
//       {required BuildContext context,
//         required Info info}) async {
//     var database = Provider.of<GuideProvider>(context, listen: false);
//
//     DateTime trueDate = await NTP.now();
//
//     bool result = false;
//
//     bool activationStatus = await database.updateInfoDetails(
//       trueDate: trueDate,
//       info: info,
//     );
//
//     result = activationStatus;
//
//     if (result == true) {
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//         backgroundColor: Colors.red,
//         content: Text('Error in Activation'),
//       ));
//     }
//
//   }
//   Future<void> _saveChanges() async {
//     Info updateInfo =Info(
//
//       Tip_Title : _titleController.text,
//       Tip_Section : _sectionController.text,
//       Related_Screen : _relatedScreenController.text,
//       Tip_Order_Number : _orderNumberController.text,
//       Tip_Main_Description : _mainDescriptionController.text,
//       Tip_Description_Idea : _descriptionIdeaController.text,
//       Tip_Description_Info : _descriptionInfoController.text,
//       Tip_Tech_Details :_techDetailsController.text,
//
//       // Convert string values to boolean if necessary
//       Is_Basic :_isBasicController.text.toLowerCase() == 'true',
//       Is_New : _isNewController.text.toLowerCase() == 'true',
//       Is_FAQ : _isFAQController.text.toLowerCase() == 'true',
//       Is_Official: _isOfficialController.text.toLowerCase() == 'true',
//       Is_Step_By_Step : _isStepByStepController.text.toLowerCase() == 'true',
//       Is_Material_Lottie : _isMaterialLottieController.text.toLowerCase() == 'true',
//       Is_Material_Picture : _isMaterialPictureController.text.toLowerCase() == 'true',
//       Is_Material_YouTube : _isMaterialYouTubeController.text.toLowerCase() == 'true',
//
//       Related_App_Screen :_relatedAppScreenController.text,
//       Material_Path : _materialPathController.text,
//       // Save image paths in Material_Path_List
//       Is_Optional : _isOptionalController.text.toLowerCase() == 'true',
//       Is_Required : _isRequiredController.text.toLowerCase() == 'true',
//       Is_Take_Time : _isTakeTimeController.text.toLowerCase() == 'true',
//       Is_ComingSoon : _isComingSoonController.text.toLowerCase() == 'true',
//       Is_For_Admin : _isForAdminController.text.toLowerCase() == 'true',
//       Is_For_SalesTeam :_isForSalesTeamController.text.toLowerCase() == 'true',
//       Is_ForOwner :_isForOwnerController.text.toLowerCase() == 'true',
//       Material_Path_List : _selectedImages.map((image) => image.path).toList(),
//       Android_Ver : int.tryParse(_androidVerController.text),
//       IOS_Ver : int.tryParse(_iosVerController.text),);
//     await updateInfoDetails(
//         context: context,
//         info:
//         updateInfo);
//     // Save changes to Firestore
//     final docRef = FirebaseFirestore.instance.collection('InfoBankData').doc('AllInfoData');
//     await docRef.update({
//       'info.${widget.infoBank.Tip_Title}': widget.infoBank.toMap(Path: 'InfoBankData/AllInfoData')
//     });
//
//     // Show confirmation or feedback to the user
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('Changes saved successfully!')),
//     );
//
//     // Update GuideProvider
//     var guideProvider = Provider.of<GuideProvider>(context, listen: false);
//     guideProvider.updateInfo(widget.infoBank);  // Ensure updateInfo method is implemented in GuideProvider
//
//
//     // Optional: Show confirmation or feedback to the user
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('Changes saved successfully!')),
//     );
//
//     // Optional: Navigate back or update UI as needed
//   }
//
//   Widget _buildTextField(String label, TextEditingController controller, {bool isNumeric = false,bool isPicutreList = false}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: TextFormField(
//         controller: controller,
//         keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
//
//         decoration: InputDecoration(
//           labelText: label,
//           suffixIcon: (isPicutreList==true)?IconButton(
//             icon: Icon(Icons.add_a_photo),
//             onPressed: _pickImage,
//           ):null,
//           border: const OutlineInputBorder(),
//         ),
//       ),
//     );
//   }
// }
