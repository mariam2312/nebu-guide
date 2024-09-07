import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart'; // Import the image_picker package
import 'dart:io';
import '../data/Info_Bank_Data.dart';
import '../models/Info.dart';
import '../providers/GuideProvider.dart';
import 'package:firebase_storage/firebase_storage.dart';

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
          infoBank.toMap(Path: 'InfoBankData/AllInfoData');
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
          actions: [TextButton(onPressed: (){

            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      InfoAddDetails(infoBank:
                      Info(Material_Path: '',
                          Tip_Title: '', Related_Screen: '', Related_App_Screen: '', Tip_Section: '', Is_ForOwner: null, Is_For_Admin: null, Android_Ver: null, Is_For_SalesTeam: null, IOS_Ver: null))),
            );

    }, child:Text ("add"),)],
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
                                  Text("section:${infoBank.Tip_Section}",style: const TextStyle(
                                      color: Colors.amber,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),),
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


  void onTap(int index) {
    setState(() {
      _currentIndex = index;
      _isAutoPlay = false; // Stop autoplay when a step is tapped
    });
    _carouselController.animateToPage(index);
  }

  @override
  Widget build(BuildContext context) {

    int activeStep = 0;

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

              return Row(mainAxisSize: MainAxisSize.min,
                children: [

                  Flexible(flex:4,
                    child: Stack(
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
                                  child:
                                  Image.file(
                                    image,
                                    fit: BoxFit.cover,
                                   // height: 100,
                                    width: 250,

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
                      steps: const [
                        EasyStep(
                          icon: Icon(Icons.add), // required icon for this step
                          finishIcon: Icon(Icons.done), // icon to display when this step is finished
                          activeIcon: Icon(Icons.looks_one), // icon to display when this step is active
                          title: 'خطوة1', // title of this step
                        ), EasyStep(
                          icon: Icon(Icons.add), // required icon for this step
                          finishIcon: Icon(Icons.done), // icon to display when this step is finished
                          activeIcon: Icon(Icons.looks_two), // icon to display when this step is active
                          title: 'خطوة2', // title of this step
                        ), EasyStep(
                          icon: Icon(Icons.add), // required icon for this step
                          finishIcon: Icon(Icons.done), // icon to display when this step is finished
                          activeIcon: Icon(Icons.looks_3), // icon to display when this step is active
                          title: 'خطوة3', // title of this step
                        ),

                      ],
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
                      unreachedStepTextColor: Color.fromRGBO(189, 189, 189, 1),
                      unreachedStepIconColor: Color.fromRGBO(189, 189, 189, 1),
                      unreachedStepBorderColor: Color.fromRGBO(189, 189, 189, 1),
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
                      stepReachedAnimationDuration: Duration(seconds: 1),
                    ),
                  ),
                ],
              );

          },
        ),

      ),
    );
  }
}

class InfoEditDetails extends StatefulWidget {
  final Info infoBank;

  const InfoEditDetails({super.key, required this.infoBank});

  @override
  State<InfoEditDetails> createState() => _InfoEditDetailsState();
}

class _InfoEditDetailsState extends State<InfoEditDetails> {

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
  final List<String> imageUrls = [];
   XFile? pickedFile;
String imageUrl="";
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
    _materialPathListController = TextEditingController(text: widget.infoBank.Material_Path_List .toString());
    _androidVerController = TextEditingController(text: widget.infoBank.Android_Ver.toString());
    _iosVerController = TextEditingController(text: widget.infoBank.IOS_Ver .toString());
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

  Future<void> _pickImages() async {
    try {
      final List<XFile> pickedImages = await _picker.pickMultiImage(maxWidth: 100, maxHeight: 100);
      setState(() {
        _selectedImages.addAll(pickedImages.map((e) => File(e.path)));
        widget.infoBank.Material_Path_List?.addAll(_selectedImages);
      });
    } catch (e) {
      print('Error picking images: $e');
    }
  }

  Future<void> _removeImage(int index) async {
    setState(() {
      _selectedImages.removeAt(index);
    });
  }
  final storage = FirebaseStorage.instance;
  Future<void> _saveAndUpdate() async {
      Reference referenceRoot = FirebaseStorage.instance.ref();
      Reference referenceImage=referenceRoot.child('images');
      String Name =DateTime.now().microsecondsSinceEpoch.toString();
    ///  try
    Reference referenceImageToUpload=referenceImage.child(Name);
   await   referenceImageToUpload.putFile(File(pickedFile!.path));
      imageUrl=await referenceImageToUpload.getDownloadURL();
      print(imageUrl);
      imageUrls.add(imageUrl);
    // Find the Info object with the title "widget.infoBank.Tip_Title"
    Info? infoToEdit;
    for (var info in infoBank.values) {
      if (info.Tip_Title == widget.infoBank.Tip_Title) {
        infoToEdit = info;
        break;
      }
    }

    // Update the Info object with the edited values
    if (infoToEdit != null) {
      infoToEdit.Tip_Title = _titleController.text;
      infoToEdit.Tip_Section = _sectionController.text;
      infoToEdit.Related_Screen = _relatedScreenController.text;
      infoToEdit.Tip_Order_Number = _orderNumberController.text;
      infoToEdit.Tip_Main_Description = _mainDescriptionController.text;
      infoToEdit.Tip_Description_Idea = _descriptionIdeaController.text;
      infoToEdit.Tip_Description_Info = _descriptionInfoController.text;
      infoToEdit.Tip_Tech_Details = _techDetailsController.text;
      infoToEdit.Is_Basic = _isBasicController.text == 'true';
      infoToEdit.Is_New = _isNewController.text == 'true';
      infoToEdit.Is_FAQ = _isFAQController.text == 'true';
      infoToEdit.Is_Official = _isOfficialController.text == 'true';
      infoToEdit.Is_Step_By_Step = _isStepByStepController.text == 'true';
      infoToEdit.Is_Material_Lottie = _isMaterialLottieController.text == 'true';
      infoToEdit.Is_Material_Picture = _isMaterialPictureController.text == 'true';
      infoToEdit.Is_Material_YouTube = _isMaterialYouTubeController.text == 'true';
      infoToEdit.Related_App_Screen = _relatedAppScreenController.text;
      infoToEdit.Material_Path = _materialPathController.text;
      infoToEdit.Material_Path_List = imageUrls??[];
      infoToEdit.Android_Ver = int.parse(_androidVerController.text);
      infoToEdit.IOS_Ver = int.parse(_iosVerController.text);
      infoToEdit.Is_Optional = _isOptionalController.text == 'true';
      infoToEdit.Is_Required = _isRequiredController.text == 'true';
      infoToEdit.Is_Take_Time = _isTakeTimeController.text == 'true';
      infoToEdit.Is_ComingSoon = _isComingSoonController.text == 'true';
      infoToEdit.Is_For_Admin = _isForAdminController.text == 'true';
      infoToEdit.Is_For_SalesTeam = _isForSalesTeamController.text == 'true';
      infoToEdit.Is_ForOwner = _isForOwnerController.text == 'true';
    }

    // Update the Firebase Firestore document with the new map
    final CollectionReference restrictionsDataCollection =
    FirebaseFirestore.instance.collection('InfoBankData');
    final Map<String, dynamic> bigMap = {'info': {}};

    for (var infoBankValue in infoBank.values) {
      final Map<String, dynamic> infoMap = infoBankValue.toMap(Path: 'InfoBankData/AllInfoData');
      bigMap['info'][infoBankValue.Tip_Title!] = infoMap;
    }

    await restrictionsDataCollection.doc('AllInfoData').set(bigMap);
    // Optional: Show confirmation or feedback to the user
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Changes saved successfully!')),
    );
  }


  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.infoBank.Tip_Title ?? 'Info Details'),
          actions: [
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                _saveAndUpdate();
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
            _buildTextField('Is_New', _isNewController,),
            _buildTextField('Is_FAQ', _isFAQController,),
            _buildTextField('Is_Official', _isOfficialController,),
            _buildTextField('Is_Step_By_Step', _isStepByStepController,),
            _buildTextField('Is_Material_Lottie', _isMaterialLottieController,),
            _buildTextField(
              'Is_Material_Picture', _isMaterialPictureController,),
            _buildTextField(
              'Is_Material_YouTube', _isMaterialYouTubeController,),
            _buildTextField('Related_App_Screen', _relatedAppScreenController),
            _buildTextField('Material_Path', _materialPathController),
            _buildTextField('Material_Path_List', _materialPathListController,
                isPicutreList: true),
            _selectedImages.isEmpty
                ? const Center(child: Text('No images selected'))
                : SizedBox(
                height: 400,

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
                          icon: const Icon(
                              Icons.remove_circle, color: Colors.red),
                          onPressed: () {
                            _removeImage(index);
                          },
                        ),
                      ),
                    );
                  }),
                )
            ),
            _buildTextField(
                'Android_Ver', _androidVerController, isNumeric: true),
            _buildTextField('IOS_Ver', _iosVerController, isNumeric: true),
            _buildTextField('Is_Optional', _isOptionalController,),
            _buildTextField('Is_Required', _isRequiredController,),
            _buildTextField('Is_Take_Time', _isTakeTimeController,),
            _buildTextField('Is_ComingSoon', _isComingSoonController,),
            _buildTextField('Is_For_Admin', _isForAdminController,),
            _buildTextField('Is_For_SalesTeam', _isForSalesTeamController,),
            _buildTextField('Is_ForOwner', _isForOwnerController,),
          ],
        ),
      );
    }

  Widget _buildTextField(String label, TextEditingController controller, {bool isNumeric = false,bool isPicutreList = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        onChanged: (value) async {
          setState(() {

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
          }); // Update the UI in real-time
        },
        keyboardType: isNumeric ? TextInputType.number : TextInputType.text,

        decoration: InputDecoration(
          labelText: label,
          suffixIcon: (isPicutreList==true)?IconButton(
            icon: const Icon(Icons.add_a_photo),
            onPressed: _pickImages,
          ):null,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}

class InfoAddDetails extends StatefulWidget {
  final Info infoBank;

  const InfoAddDetails({super.key, required this.infoBank});

  @override
  State<InfoAddDetails> createState() => _InfoAddDetailsState();
}

class _InfoAddDetailsState extends State<InfoAddDetails> {

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
  final List<String> imageUrls = [];
String imageUrl="";
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
    _materialPathListController = TextEditingController(text: widget.infoBank.Material_Path_List .toString());
    _androidVerController = TextEditingController(text: widget.infoBank.Android_Ver.toString());
    _iosVerController = TextEditingController(text: widget.infoBank.IOS_Ver .toString());
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
   // late XFile pickedFile;
  Future<void> _pickImage() async {
   final  pickedFile = (await _picker.pickImage(source: ImageSource.gallery))!;
print("path:${pickedFile?.path}");
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
  final storage = FirebaseStorage.instance;
  Future<void> _saveAndUpdate() async {
    // Reference referenceRoot = FirebaseStorage.instance.ref();
    // Reference referenceImage = referenceRoot.child('images');
    // String Name = DateTime.now().microsecondsSinceEpoch.toString();
    // Reference referenceImageToUpload = referenceImage.child(Name);
    // await referenceImageToUpload.putFile(File(pickedFile.path));
    // imageUrl = await referenceImageToUpload.getDownloadURL();
    // print(imageUrl);
    // imageUrls.add(imageUrl);

    // Create a new Info object
    Info newInfo = Info(
      Tip_Title: _titleController.text??"",
      Tip_Section: _sectionController.text??"",
      Related_Screen: _relatedScreenController.text??"",
      Tip_Order_Number: _orderNumberController.text??"",
      Tip_Main_Description: _mainDescriptionController.text??"",
      Tip_Description_Idea: _descriptionIdeaController.text??"",
      Tip_Description_Info: _descriptionInfoController.text??"",
      Tip_Tech_Details: _techDetailsController.text??"",
      Is_Basic: _isBasicController.text == 'true',
      Is_New: _isNewController.text == 'true',
      Is_FAQ: _isFAQController.text == 'true',
      Is_Official: _isOfficialController.text == 'true',
      Is_Step_By_Step: _isStepByStepController.text == 'true',
      Is_Material_Lottie: _isMaterialLottieController.text == 'true',
      Is_Material_Picture: _isMaterialPictureController.text == 'true',
      Is_Material_YouTube: _isMaterialYouTubeController.text == 'true',
      Related_App_Screen: _relatedAppScreenController.text??"",
      Material_Path: _materialPathController.text??"",
      Material_Path_List: imageUrls??[],
      Android_Ver: int.parse(_androidVerController.text)??0,
      IOS_Ver: int.parse(_iosVerController.text)??0,
      Is_Optional: _isOptionalController.text == 'true',
      Is_Required: _isRequiredController.text == 'true',
      Is_Take_Time: _isTakeTimeController.text == 'true',
      Is_ComingSoon: _isComingSoonController.text == 'true',
      Is_For_Admin: _isForAdminController.text == 'true',
      Is_For_SalesTeam: _isForSalesTeamController.text == 'true',
      Is_ForOwner: _isForOwnerController.text == 'true',
    );

    // Add the new Info object to the infoBank map
    infoBank[_titleController.text] = newInfo;

    // Create a map to store the updated data
    final Map<String, dynamic> bigMap = {'info': {}};
    // Populate the bigMap with the updated infoBank values
    for (var infoBankValue in infoBank.values) {
      final Map<String, dynamic> infoMap = infoBankValue.toMap(Path: 'InfoBankData/AllInfoData');
      bigMap['info'][infoBankValue.Tip_Title!] = infoMap;
    }

    // Update the Firebase Firestore document with the new map
    final CollectionReference restrictionsDataCollection =
    FirebaseFirestore.instance.collection('InfoBankData');
    await restrictionsDataCollection.doc('AllInfoData').set(bigMap);

    // Optional: Show confirmation or feedback to the user
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Changes saved successfully!')),
    );
  }


  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.infoBank.Tip_Title ?? 'Info Details'),
          actions: [
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                _saveAndUpdate();
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
            _buildTextField('Is_New', _isNewController,),
            _buildTextField('Is_FAQ', _isFAQController,),
            _buildTextField('Is_Official', _isOfficialController,),
            _buildTextField('Is_Step_By_Step', _isStepByStepController,),
            _buildTextField('Is_Material_Lottie', _isMaterialLottieController,),
            _buildTextField(
              'Is_Material_Picture', _isMaterialPictureController,),
            _buildTextField(
              'Is_Material_YouTube', _isMaterialYouTubeController,),
            _buildTextField('Related_App_Screen', _relatedAppScreenController),
            _buildTextField('Material_Path', _materialPathController),
            _buildTextField('Material_Path_List', _materialPathListController,
                isPicutreList: true),
            _selectedImages.isEmpty
                ? const Center(child: Text('No images selected'))
                : SizedBox(
                height: 400,

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
                          icon: const Icon(
                              Icons.remove_circle, color: Colors.red),
                          onPressed: () {
                            _removeImage(index);
                          },
                        ),
                      ),
                    );
                  }),
                )
            ),
            _buildTextField(
                'Android_Ver', _androidVerController, isNumeric: true),
            _buildTextField('IOS_Ver', _iosVerController, isNumeric: true),
            _buildTextField('Is_Optional', _isOptionalController,),
            _buildTextField('Is_Required', _isRequiredController,),
            _buildTextField('Is_Take_Time', _isTakeTimeController,),
            _buildTextField('Is_ComingSoon', _isComingSoonController,),
            _buildTextField('Is_For_Admin', _isForAdminController,),
            _buildTextField('Is_For_SalesTeam', _isForSalesTeamController,),
            _buildTextField('Is_ForOwner', _isForOwnerController,),
          ],
        ),
      );
    }

  Widget _buildTextField(String label, TextEditingController controller, {bool isNumeric = false,bool isPicutreList = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        onChanged: (value) async {
          setState(() {
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
// List<String> imagePaths = _selectedImages.map((image) => image.path).toList();
// widget.infoBank.Material_Path_List = imagePaths;
widget.infoBank.Android_Ver = int.tryParse(_androidVerController.text);
widget.infoBank.IOS_Ver = int.tryParse(_iosVerController.text);
widget.infoBank.Is_Optional = _isOptionalController.text.toLowerCase() == 'true';
widget.infoBank.Is_Required = _isRequiredController.text.toLowerCase() == 'true';
widget.infoBank.Is_Take_Time = _isTakeTimeController.text.toLowerCase() == 'true';
widget.infoBank.Is_ComingSoon = _isComingSoonController.text.toLowerCase() == 'true';
widget.infoBank.Is_For_Admin = _isForAdminController.text.toLowerCase() == 'true';
widget.infoBank.Is_For_SalesTeam = _isForSalesTeamController.text.toLowerCase() == 'true';
widget.infoBank.Is_ForOwner = _isForOwnerController.text.toLowerCase() == 'true';
          }); // Update the UI in real-time
        },
        keyboardType: isNumeric ? TextInputType.number : TextInputType.text,

        decoration: InputDecoration(
          labelText: label,
          suffixIcon: (isPicutreList==true)?IconButton(
            icon: const Icon(Icons.add_a_photo),
            onPressed: _pickImage,
          ):null,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}

//import 'dart:async';
//
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:lottie/lottie.dart';
// import 'package:provider/provider.dart';
// import 'package:image_picker/image_picker.dart'; // Import the image_picker package
// import 'dart:io';
// import '../data/Info_Bank_Data.dart';
// import '../models/Info.dart';
// import '../providers/GuideProvider.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:easy_stepper/easy_stepper.dart';
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
//       infoBank.toMap(Path: 'InfoBankData/AllInfoData');
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
//     final TextEditingController searchController = TextEditingController();
//     List<Info> searchResults = [];
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text("Info Bank"),
//           actions: [TextButton(onPressed: (){
//
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) =>
//                       InfoAddDetails(infoBank:
//                       Info(Material_Path: '',
//                           Tip_Title: '', Related_Screen: '', Related_App_Screen: '', Tip_Section: '', Is_ForOwner: null, Is_For_Admin: null, Android_Ver: null, Is_For_SalesTeam: null, IOS_Ver: null))),
//             );
//
//           }, child:Text ("add"),),
//
//           ],
//         ),
//         body: Consumer<GuideProvider>(builder: (context, guideProvider, child) {
//           return Padding(
//               padding: const EdgeInsets.all(10),
//               child: Column(children: [
//
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
//                               color: Color(0xFF212d45),
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
//                               Text("l:${infoBank.Is_Material_Lottie}",style: const TextStyle(
//                                   color: Colors.amber,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold),),
//                               Text("P:${infoBank.Is_Material_Picture}",style: const TextStyle(
//                                   color: Colors.amber,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold),),
//                               Text("s:${infoBank.Tip_Section}",style: const TextStyle(
//                                   color: Colors.amber,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold),),
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
//   void onTapping(int index) {
//     setState(() {
//       _currentIndex = index;
//       _isAutoPlay = false; // Stop autoplay when a step is tapped
//     });
//     _carouselController.animateToPage(index);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     int activeStep = 0;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.infoBank.Tip_Title!),
//         actions: [TextButton(onPressed: (){
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) =>
//                     InfoEditDetails(infoBank: widget.infoBank,)
//             ),
//           );}, child: const Text("edit")),],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child:
//         //TextButton(onPressed: (){}, child: Text("edit")),
//         (widget.infoBank.Is_Material_Lottie == true
//             // &&
//             // widget.infoBank.Material_Path !=
//             //     "" &&
//             // widget.infoBank.Material_Path !=
//             //     null
//         )
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
//             :
//     ListView.builder(
//     itemCount: 2,
//     itemBuilder: (context, index) {
//     if (index == 0) {
//     return Row(
//     children: [
//     Expanded(
//     child: Column(
//     children: [
//     // Container(
//     // padding: EdgeInsets.all(8.0),
//     // child: EasyStepper(
//     // direction: Axis.vertical,
//     // activeStep: activeStep,
//     // lineLength: 70,
//     // lineSpace: 0,
//     // lineType: LineType.normal,
//     // unreachedStepTextColor: Colors.white,
//     // activeStepBorderColor: Colors.orange,
//     // activeStepTextColor: Colors.black87,
//     // finishedStepTextColor: Colors.black87,
//     // stepRadius: 8,
//     // lineDotRadius: 1.5,
//     // disableScroll: true,
//     //  stepReachedAnimationEffect :Curves. bounceOut,
//     //   stepReachedAnimationDuration : const Duration(seconds: 1),
//     // steps: [
//     // EasyStep(
//     // title: 'Step 1',
//     // lineText: '1',
//     // icon: Icon(Icons.circle, color: activeStep == 0 ? Colors.orange : Colors.grey),
//     //     finishIcon:Icon(Icons.safety_check,) ,  activeIcon:Icon(Icons.add)
//     // ),
//     // EasyStep(
//     // title: 'Step 2',
//     // lineText: '2',
//     // icon: Icon(Icons.circle, color: activeStep == 1 ? Colors.orange : Colors.grey),
//     // ),
//     // EasyStep(
//     // title: 'Step 3',
//     // lineText: '3',
//     // icon: Icon(Icons.circle, color: activeStep == 2 ? Colors.orange : Colors.grey),
//     // ),
//     // ],
//     // onStepReached: (index) {
//     // setState(() {
//     // activeStep = index;
//     // _carouselController.animateToPage(index);
//     // });
//     // },
//     // ),
//     // ),
//     Expanded(
//     child: Stack(
//     children: [
//     Positioned(
//     top: 0,
//     left: 0,
//     bottom: 10,
//     right: 0,
//     child: CarouselSlider(
//     items: widget.infoBank.Material_Path_List?.map((image) {
//     return ClipRRect(
//     borderRadius: BorderRadius.circular(40),
//     child: Image.asset(
//     image,
//     fit: BoxFit.contain,
//     ),
//     );
//     }).toList(),
//     carouselController: _carouselController,
//     options: CarouselOptions(
//     height: double.infinity, // Adjust height as needed
//     autoPlay: true,
//     autoPlayInterval: const Duration(seconds: 2),
//     enlargeCenterPage: true,
//     viewportFraction: 1.0,
//     aspectRatio: 1.0,
//     initialPage: 0,
//     reverse: false,
//     onPageChanged: (index, reason) {
//     setState(() {
//     _currentIndex = index;
//     activeStep = index;
//     });
//     },
//     ),
//     ),
//     ),
//     Center(
//     child: Image.asset(
//     'assets/images/mobleIphone.png',
//     width: 500,
//     height: 600,
//     ),
//     ),
//     ],
//     ),
//     ),
//     ],
//     ),
//     ),
//     ],
//     );
//     }
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
//                     onTap: () {
//                       onTapping(0);
//                       _carouselController.animateToPage(0);
//                     },
//                     child: Container(
//                       height: 100,
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         color: _currentIndex == 0
//                             ? Colors.green
//                             : Colors.grey,
//                         borderRadius: const BorderRadius.all(Radius.circular(10)),
//                       ),
//                       child: const Center(
//                         child: Text("خطوة1"),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 5),
//                   GestureDetector(
//                     onTap: () {
//                       onTapping(1);
//                       _carouselController.animateToPage(1);
//                     },
//                     child: Container(
//                       height: 100,
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         color: _currentIndex == 1
//                             ? Colors.green
//                             : Colors.grey,
//                         borderRadius: const BorderRadius.all(Radius.circular(10)),
//                       ),
//                       child: const Center(
//                         child: Text("خطوة2"),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 5),
//                   GestureDetector(
//                     onTap: () {
//                       onTapping(2);
//                       _carouselController.animateToPage(2);
//                     },
//                     child: Container(
//                       height: 100,
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         color: _currentIndex == 2
//                             ? Colors.green
//                             : Colors.grey,
//                         borderRadius: const BorderRadius.all(Radius.circular(10)),
//                       ),
//                       child: const Center(
//                         child: Text("خطوة3"),
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             }
//
//         )
//
//
//       ),
//     );
//   }
//
//
// }
//
// class InfoEditDetails extends StatefulWidget {
//   final Info infoBank;
//
//   const InfoEditDetails({super.key, required this.infoBank});
//
//   @override
//   State<InfoEditDetails> createState() => _InfoEditDetailsState();
// }
//
// class _InfoEditDetailsState extends State<InfoEditDetails> {
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
//   final List<String> imageUrls = [];
//   String imageUrl="";
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
//     _materialPathListController = TextEditingController(text: widget.infoBank.Material_Path_List .toString());
//     _androidVerController = TextEditingController(text: widget.infoBank.Android_Ver.toString());
//     _iosVerController = TextEditingController(text: widget.infoBank.IOS_Ver .toString());
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
//   late XFile pickedFile;
//   Future<void> _pickImage() async {
//     pickedFile = (await _picker.pickImage(source: ImageSource.gallery))!;
//     print("path:${pickedFile?.path}");
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
//   final storage = FirebaseStorage.instance;
//   Future<void> _saveAndUpdate() async {
//     Reference referenceRoot = FirebaseStorage.instance.ref();
//     Reference referenceImage=referenceRoot.child('images');
//     String Name =DateTime.now().microsecondsSinceEpoch.toString();
//     ///  try
//     Reference referenceImageToUpload=referenceImage.child(Name);
//     await   referenceImageToUpload.putFile(File(pickedFile.path));
//     imageUrl=await referenceImageToUpload.getDownloadURL();
//     print(imageUrl);
//     imageUrls.add(imageUrl);
//     // Find the Info object with the title "widget.infoBank.Tip_Title"
//     Info? infoToEdit;
//     for (var info in infoBank.values) {
//       if (info.Tip_Title == widget.infoBank.Tip_Title) {
//         infoToEdit = info;
//         break;
//       }
//     }
//
//     // Update the Info object with the edited values
//     if (infoToEdit != null) {
//       infoToEdit.Tip_Title = _titleController.text;
//       infoToEdit.Tip_Section = _sectionController.text;
//       infoToEdit.Related_Screen = _relatedScreenController.text;
//       infoToEdit.Tip_Order_Number = _orderNumberController.text;
//       infoToEdit.Tip_Main_Description = _mainDescriptionController.text;
//       infoToEdit.Tip_Description_Idea = _descriptionIdeaController.text;
//       infoToEdit.Tip_Description_Info = _descriptionInfoController.text;
//       infoToEdit.Tip_Tech_Details = _techDetailsController.text;
//       infoToEdit.Is_Basic = _isBasicController.text == 'true';
//       infoToEdit.Is_New = _isNewController.text == 'true';
//       infoToEdit.Is_FAQ = _isFAQController.text == 'true';
//       infoToEdit.Is_Official = _isOfficialController.text == 'true';
//       infoToEdit.Is_Step_By_Step = _isStepByStepController.text == 'true';
//       infoToEdit.Is_Material_Lottie = _isMaterialLottieController.text == 'true';
//       infoToEdit.Is_Material_Picture = _isMaterialPictureController.text == 'true';
//       infoToEdit.Is_Material_YouTube = _isMaterialYouTubeController.text == 'true';
//       infoToEdit.Related_App_Screen = _relatedAppScreenController.text;
//       infoToEdit.Material_Path = _materialPathController.text;
//       infoToEdit.Material_Path_List = imageUrls??[];
//       infoToEdit.Android_Ver = int.parse(_androidVerController.text);
//       infoToEdit.IOS_Ver = int.parse(_iosVerController.text);
//       infoToEdit.Is_Optional = _isOptionalController.text == 'true';
//       infoToEdit.Is_Required = _isRequiredController.text == 'true';
//       infoToEdit.Is_Take_Time = _isTakeTimeController.text == 'true';
//       infoToEdit.Is_ComingSoon = _isComingSoonController.text == 'true';
//       infoToEdit.Is_For_Admin = _isForAdminController.text == 'true';
//       infoToEdit.Is_For_SalesTeam = _isForSalesTeamController.text == 'true';
//       infoToEdit.Is_ForOwner = _isForOwnerController.text == 'true';
//     }
//
//     // Update the Firebase Firestore document with the new map
//     final CollectionReference restrictionsDataCollection =
//     FirebaseFirestore.instance.collection('InfoBankData');
//     final Map<String, dynamic> bigMap = {'info': {}};
//
//     for (var infoBankValue in infoBank.values) {
//       final Map<String, dynamic> infoMap = infoBankValue.toMap(Path: 'InfoBankData/AllInfoData');
//       bigMap['info'][infoBankValue.Tip_Title!] = infoMap;
//     }
//
//     await restrictionsDataCollection.doc('AllInfoData').set(bigMap);
//     // Optional: Show confirmation or feedback to the user
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('Changes saved successfully!')),
//     );
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.infoBank.Tip_Title ?? 'Info Details'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.save),
//             onPressed: () {
//               _saveAndUpdate();
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
//           _buildTextField('Tip_Order_Number', _orderNumberController,isNumeric: true),
//           _buildTextField('Tip_Main_Description', _mainDescriptionController),
//           _buildTextField('Tip_Description_Idea', _descriptionIdeaController),
//           _buildTextField('Tip_Description_Info', _descriptionInfoController),
//           _buildTextField('Tip_Tech_Details', _techDetailsController),
//           _buildTextField('Is_Basic', _isBasicController,isbool:true),
//           _buildTextField('Is_New', _isNewController,isbool:true),
//           _buildTextField('Is_FAQ', _isFAQController,isbool:true),
//           _buildTextField('Is_Official', _isOfficialController,isbool:true),
//           _buildTextField('Is_Step_By_Step', _isStepByStepController,isbool:true),
//           _buildTextField('Is_Material_Lottie', _isMaterialLottieController,isbool:true),
//           _buildTextField(
//             'Is_Material_Picture', _isMaterialPictureController,isbool:true),
//           _buildTextField(
//             'Is_Material_YouTube', _isMaterialYouTubeController,isbool:true),
//           _buildTextField('Related_App_Screen', _relatedAppScreenController),
//           _buildTextField('Material_Path', _materialPathController),
//           _buildTextField('Material_Path_List', _materialPathListController,
//               isPicutreList: true),
//           _selectedImages.isEmpty
//               ? const Center(child: Text('No images selected'))
//               : SizedBox(
//               height: 400,
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
//                         icon: const Icon(
//                             Icons.remove_circle, color: Colors.red),
//                         onPressed: () {
//                           _removeImage(index);
//                         },
//                       ),
//                     ),
//                   );
//                 }),
//               )
//           ),
//           _buildTextField(
//               'Android_Ver', _androidVerController, isNumeric: true),
//           _buildTextField('IOS_Ver', _iosVerController, isNumeric: true),
//           _buildTextField('Is_Optional', _isOptionalController,isbool:true),
//           _buildTextField('Is_Required', _isRequiredController,isbool:true),
//           _buildTextField('Is_Take_Time', _isTakeTimeController,isbool:true),
//           _buildTextField('Is_ComingSoon', _isComingSoonController,isbool:true),
//           _buildTextField('Is_For_Admin', _isForAdminController,isbool:true),
//           _buildTextField('Is_For_SalesTeam', _isForSalesTeamController,isbool:true),
//           _buildTextField('Is_ForOwner', _isForOwnerController,isbool:true),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildTextField(String label, TextEditingController controller, {bool isNumeric = false,bool isPicutreList = false,bool isbool=false}) {
//     if (isbool) {
//       return Padding(
//         padding: const EdgeInsets.symmetric(vertical: 8.0),
//         child: Row(
//           children: [
//             Text(label),
//             Spacer(),
//         Row(
//               children: [
//                 Text(' ${controller.text.toLowerCase() == 'true' ? 'True' : 'False'}'),
//                 Switch(
//                   value: controller.text.toLowerCase() == 'true',
//                   onChanged: (bool value) {
//                     setState(() {
//                       controller.text = value.toString();
//                     });
//                   },
//                 ),
//
//               ],
//             ),
//           ],
//         ),
//       );
//     } else { return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: TextFormField(
//         controller: controller,
//         onChanged: (value) async {
//           setState(() {
//
//             widget.infoBank. Tip_Title = _titleController.text;
//             widget.infoBank.  Tip_Section = _sectionController.text;
//             widget.infoBank.   Related_Screen = _relatedScreenController.text;
//             widget.infoBank.  Tip_Order_Number = _orderNumberController.text;
//             widget.infoBank. Tip_Main_Description = _mainDescriptionController.text;
//             widget.infoBank.Tip_Description_Idea = _descriptionIdeaController.text;
//             widget.infoBank.  Tip_Description_Info = _descriptionInfoController.text;
//             widget.infoBank. Tip_Tech_Details =_techDetailsController.text;
//
// // Convert string values to boolean if necessary
//             widget.infoBank.Is_Basic =_isBasicController.text.toLowerCase() == 'true';
//             widget.infoBank.Is_New = _isNewController.text.toLowerCase() == 'true';
//             widget.infoBank.  Is_FAQ = _isFAQController.text.toLowerCase() == 'true';
//             widget.infoBank.   Is_Official = _isOfficialController.text.toLowerCase() == 'true';
//             widget.infoBank. Is_Step_By_Step = _isStepByStepController.text.toLowerCase() == 'true';
//             widget.infoBank.   Is_Material_Lottie = _isMaterialLottieController.text.toLowerCase() == 'true';
//             widget.infoBank.Is_Material_Picture = _isMaterialPictureController.text.toLowerCase() == 'true';
//             widget.infoBank. Is_Material_YouTube = _isMaterialYouTubeController.text.toLowerCase() == 'true';
//
//             widget.infoBank.Related_App_Screen = _relatedAppScreenController.text;
//             widget.infoBank.Material_Path = _materialPathController.text;
// // Save image paths in Material_Path_List
//             List<String> imagePaths = _selectedImages.map((image) => image.path).toList();
//             widget.infoBank.Material_Path_List = imagePaths;
//             widget.infoBank.Android_Ver = int.tryParse(_androidVerController.text);
//             widget.infoBank.IOS_Ver = int.tryParse(_iosVerController.text);
//
//
//             widget.infoBank.Is_Optional = _isOptionalController.text.toLowerCase() == 'true';
//             widget.infoBank.Is_Required = _isRequiredController.text.toLowerCase() == 'true';
//             widget.infoBank.Is_Take_Time = _isTakeTimeController.text.toLowerCase() == 'true';
//             widget.infoBank.Is_ComingSoon = _isComingSoonController.text.toLowerCase() == 'true';
//             widget.infoBank.Is_For_Admin = _isForAdminController.text.toLowerCase() == 'true';
//             widget.infoBank.Is_For_SalesTeam = _isForSalesTeamController.text.toLowerCase() == 'true';
//             widget.infoBank.Is_ForOwner = _isForOwnerController.text.toLowerCase() == 'true';
//           }); // Update the UI in real-time
//         },
//         keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
//
//         decoration: InputDecoration(
//           labelText: label,
//           suffixIcon: (isPicutreList==true)?IconButton(
//             icon: const Icon(Icons.add_a_photo),
//             onPressed: _pickImage,
//           ):null,
//           border: const OutlineInputBorder(),
//         ),
//       ),
//     );}
//   }
// }
//
// class InfoAddDetails extends StatefulWidget {
//   final Info infoBank;
//
//   const InfoAddDetails({super.key, required this.infoBank});
//
//   @override
//   State<InfoAddDetails> createState() => _InfoAddDetailsState();
// }
//
// class _InfoAddDetailsState extends State<InfoAddDetails> {
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
//   final List<String> imageUrls = [];
//   String imageUrl="";
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
//     _materialPathListController = TextEditingController(text: widget.infoBank.Material_Path_List .toString());
//     _androidVerController = TextEditingController(text: widget.infoBank.Android_Ver.toString());
//     _iosVerController = TextEditingController(text: widget.infoBank.IOS_Ver .toString());
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
//   // late XFile pickedFile;
//   Future<void> _pickImage() async {
//     final  pickedFile = (await _picker.pickImage(source: ImageSource.gallery))!;
//     print("path:${pickedFile?.path}");
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
//   final storage = FirebaseStorage.instance;
//   Future<void> _saveAndUpdate() async {
//     // Reference referenceRoot = FirebaseStorage.instance.ref();
//     // Reference referenceImage = referenceRoot.child('images');
//     // String Name = DateTime.now().microsecondsSinceEpoch.toString();
//     // Reference referenceImageToUpload = referenceImage.child(Name);
//     // await referenceImageToUpload.putFile(File(pickedFile.path));
//     // imageUrl = await referenceImageToUpload.getDownloadURL();
//     // print(imageUrl);
//     // imageUrls.add(imageUrl);
//
//     // Create a new Info object
//     Info newInfo = Info(
//       Tip_Title: _titleController.text??"",
//       Tip_Section: _sectionController.text??"",
//       Related_Screen: _relatedScreenController.text??"",
//       Tip_Order_Number: _orderNumberController.text??"",
//       Tip_Main_Description: _mainDescriptionController.text??"",
//       Tip_Description_Idea: _descriptionIdeaController.text??"",
//       Tip_Description_Info: _descriptionInfoController.text??"",
//       Tip_Tech_Details: _techDetailsController.text??"",
//       Is_Basic: _isBasicController.text == 'true',
//       Is_New: _isNewController.text == 'true',
//       Is_FAQ: _isFAQController.text == 'true',
//       Is_Official: _isOfficialController.text == 'true',
//       Is_Step_By_Step: _isStepByStepController.text == 'true',
//       Is_Material_Lottie: _isMaterialLottieController.text == 'true',
//       Is_Material_Picture: _isMaterialPictureController.text == 'true',
//       Is_Material_YouTube: _isMaterialYouTubeController.text == 'true',
//       Related_App_Screen: _relatedAppScreenController.text??"",
//       Material_Path: _materialPathController.text??"",
//       Material_Path_List: imageUrls??[],
//       Android_Ver: int.parse(_androidVerController.text)??0,
//       IOS_Ver: int.parse(_iosVerController.text)??0,
//       Is_Optional: _isOptionalController.text == 'true',
//       Is_Required: _isRequiredController.text == 'true',
//       Is_Take_Time: _isTakeTimeController.text == 'true',
//       Is_ComingSoon: _isComingSoonController.text == 'true',
//       Is_For_Admin: _isForAdminController.text == 'true',
//       Is_For_SalesTeam: _isForSalesTeamController.text == 'true',
//       Is_ForOwner: _isForOwnerController.text == 'true',
//     );
//
//     // Add the new Info object to the infoBank map
//     infoBank[_titleController.text] = newInfo;
//
//     // Create a map to store the updated data
//     final Map<String, dynamic> bigMap = {'info': {}};
//     // Populate the bigMap with the updated infoBank values
//     for (var infoBankValue in infoBank.values) {
//       final Map<String, dynamic> infoMap = infoBankValue.toMap(Path: 'InfoBankData/AllInfoData');
//       bigMap['info'][infoBankValue.Tip_Title!] = infoMap;
//     }
//
//     // Update the Firebase Firestore document with the new map
//     final CollectionReference restrictionsDataCollection =
//     FirebaseFirestore.instance.collection('InfoBankData');
//     await restrictionsDataCollection.doc('AllInfoData').set(bigMap);
//
//     // Optional: Show confirmation or feedback to the user
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('Changes saved successfully!')),
//     );
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.infoBank.Tip_Title ?? 'Info Details'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.save),
//             onPressed: () {
//               _saveAndUpdate();
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
//           _buildTextField('Is_New', _isNewController,),
//           _buildTextField('Is_FAQ', _isFAQController,),
//           _buildTextField('Is_Official', _isOfficialController,),
//           _buildTextField('Is_Step_By_Step', _isStepByStepController,),
//           _buildTextField('Is_Material_Lottie', _isMaterialLottieController,),
//           _buildTextField(
//             'Is_Material_Picture', _isMaterialPictureController,),
//           _buildTextField(
//             'Is_Material_YouTube', _isMaterialYouTubeController,),
//           _buildTextField('Related_App_Screen', _relatedAppScreenController),
//           _buildTextField('Material_Path', _materialPathController),
//           _buildTextField('Material_Path_List', _materialPathListController,
//               isPicutreList: true),
//           _selectedImages.isEmpty
//               ? const Center(child: Text('No images selected'))
//               : SizedBox(
//               height: 400,
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
//                         icon: const Icon(
//                             Icons.remove_circle, color: Colors.red),
//                         onPressed: () {
//                           _removeImage(index);
//                         },
//                       ),
//                     ),
//                   );
//                 }),
//               )
//           ),
//           _buildTextField(
//               'Android_Ver', _androidVerController, isNumeric: true),
//           _buildTextField('IOS_Ver', _iosVerController, isNumeric: true),
//           _buildTextField('Is_Optional', _isOptionalController,),
//           _buildTextField('Is_Required', _isRequiredController,),
//           _buildTextField('Is_Take_Time', _isTakeTimeController,),
//           _buildTextField('Is_ComingSoon', _isComingSoonController,),
//           _buildTextField('Is_For_Admin', _isForAdminController,),
//           _buildTextField('Is_For_SalesTeam', _isForSalesTeamController,),
//           _buildTextField('Is_ForOwner', _isForOwnerController,),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildTextField(String label, TextEditingController controller, {bool isNumeric = false,bool isPicutreList = false}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: TextFormField(
//         controller: controller,
//         onChanged: (value) async {
//           setState(() {
//
//             widget.infoBank. Tip_Title = _titleController.text;
//             widget.infoBank.  Tip_Section = _sectionController.text;
//             widget.infoBank.   Related_Screen = _relatedScreenController.text;
//             widget.infoBank.  Tip_Order_Number = _orderNumberController.text;
//             widget.infoBank. Tip_Main_Description = _mainDescriptionController.text;
//             widget.infoBank.Tip_Description_Idea = _descriptionIdeaController.text;
//             widget.infoBank.  Tip_Description_Info = _descriptionInfoController.text;
//             widget.infoBank. Tip_Tech_Details =_techDetailsController.text;
//
// // Convert string values to boolean if necessary
//             widget.infoBank.Is_Basic =_isBasicController.text.toLowerCase() == 'true';
//             widget.infoBank.Is_New = _isNewController.text.toLowerCase() == 'true';
//             widget.infoBank.  Is_FAQ = _isFAQController.text.toLowerCase() == 'true';
//             widget.infoBank.   Is_Official = _isOfficialController.text.toLowerCase() == 'true';
//             widget.infoBank. Is_Step_By_Step = _isStepByStepController.text.toLowerCase() == 'true';
//             widget.infoBank.   Is_Material_Lottie = _isMaterialLottieController.text.toLowerCase() == 'true';
//             widget.infoBank.Is_Material_Picture = _isMaterialPictureController.text.toLowerCase() == 'true';
//             widget.infoBank. Is_Material_YouTube = _isMaterialYouTubeController.text.toLowerCase() == 'true';
//
//             widget.infoBank.Related_App_Screen = _relatedAppScreenController.text;
//             widget.infoBank.Material_Path = _materialPathController.text;
// // Save image paths in Material_Path_List
// // List<String> imagePaths = _selectedImages.map((image) => image.path).toList();
// // widget.infoBank.Material_Path_List = imagePaths;
//             widget.infoBank.Android_Ver = int.tryParse(_androidVerController.text);
//             widget.infoBank.IOS_Ver = int.tryParse(_iosVerController.text);
//
//
//             widget.infoBank.Is_Optional = _isOptionalController.text.toLowerCase() == 'true';
//             widget.infoBank.Is_Required = _isRequiredController.text.toLowerCase() == 'true';
//             widget.infoBank.Is_Take_Time = _isTakeTimeController.text.toLowerCase() == 'true';
//             widget.infoBank.Is_ComingSoon = _isComingSoonController.text.toLowerCase() == 'true';
//             widget.infoBank.Is_For_Admin = _isForAdminController.text.toLowerCase() == 'true';
//             widget.infoBank.Is_For_SalesTeam = _isForSalesTeamController.text.toLowerCase() == 'true';
//             widget.infoBank.Is_ForOwner = _isForOwnerController.text.toLowerCase() == 'true';
//           }); // Update the UI in real-time
//         },
//         keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
//
//         decoration: InputDecoration(
//           labelText: label,
//           suffixIcon: (isPicutreList==true)?IconButton(
//             icon: const Icon(Icons.add_a_photo),
//             onPressed: _pickImage,
//           ):null,
//           border: const OutlineInputBorder(),
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
//
//
//
//
// // import 'dart:async';
// //
// // import 'package:carousel_slider/carousel_slider.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:lottie/lottie.dart';
// // import 'package:provider/provider.dart';
// // import 'package:image_picker/image_picker.dart'; // Import the image_picker package
// // import 'dart:io';
// // import '../data/Info_Bank_Data.dart';
// // import '../models/Info.dart';
// // import '../providers/GuideProvider.dart';
// // import 'package:firebase_storage/firebase_storage.dart';
// //
// // class InfoSectionScreen extends StatefulWidget {
// //   List<Info?> info;
// //   InfoSectionScreen({required this.info});
// //
// //   @override
// //   State<InfoSectionScreen> createState() => _InfoSectionScreenState();
// // }
// //
// // class _InfoSectionScreenState extends State<InfoSectionScreen> {
// //   Future<void> infoToFirestore() async {
// //     final CollectionReference restrictionsDataCollection =
// //         FirebaseFirestore.instance.collection('InfoBankData');
// //     final Map<String, dynamic> bigMap = {'info': {}};
// //
// //     for (var infoBank in infoBank.values.toList()) {
// //       final Map<String, dynamic> infoMap =
// //           infoBank.toMap(Path: 'InfoBankData/AllInfoData');
// //       bigMap['info'][infoBank.Tip_Title!] = infoMap;
// //     }
// //
// //     restrictionsDataCollection.doc('AllInfoData').set(bigMap);
// //   }
// //
// //   Future<void> deleteAllInfoToFirestore() async {
// //     final CollectionReference infoDataCollection =
// //         FirebaseFirestore.instance.collection('InfoBankData');
// //
// //     // Get all documents in the collection
// //     QuerySnapshot snapshot = await infoDataCollection.get();
// //
// //     // Loop through the documents and delete each one
// //     for (DocumentSnapshot document in snapshot.docs) {
// //       await document.reference.delete();
// //     }
// //
// //     // Clear the restrictionsList in the GuideProvider
// //     var guideProvider = Provider.of<GuideProvider>(context, listen: false);
// //     guideProvider.clearInfoList();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //
// //     return Scaffold(
// //         appBar: AppBar(
// //           title: const Text("Info Bank"),
// //           actions: [TextButton(onPressed: (){
// //
// //             Navigator.push(
// //               context,
// //               MaterialPageRoute(
// //                   builder: (context) =>
// //                       InfoAddDetails(infoBank:
// //                       Info(Material_Path: '',
// //                           Tip_Title: '', Related_Screen: '', Related_App_Screen: '', Tip_Section: '', Is_ForOwner: null, Is_For_Admin: null, Android_Ver: null, Is_For_SalesTeam: null, IOS_Ver: null))),
// //             );
// //
// //     }, child:Text ("add"),)],
// //         ),
// //         body: Consumer<GuideProvider>(builder: (context, guideProvider, child) {
// //           return Padding(
// //               padding: const EdgeInsets.all(10),
// //               child: Column(children: [
// //                 ElevatedButton(
// //                     onPressed: () {
// //                       infoToFirestore();
// //                     },
// //                     child: const Text("set")),
// //                 ElevatedButton(
// //                     onPressed: () {
// //                       deleteAllInfoToFirestore();
// //                     },
// //                     child: const Text("delete")),
// //                 (guideProvider.allInfo.isNotEmpty)
// //                     ? Expanded(
// //                         child: GridView.builder(
// //                           gridDelegate:
// //                               const SliverGridDelegateWithFixedCrossAxisCount(
// //                             crossAxisCount:
// //                                 2, // adjust the number of columns here
// //                             mainAxisSpacing: 10, // space between rows
// //                             crossAxisSpacing:
// //                                 10, // adjust the number of columns here
// //                           ),
// //                           itemCount:
// //                               guideProvider.allInfo.length, // number of items
// //                           itemBuilder: (context, index) {
// //                             Info infoBank = guideProvider.allInfo[index];
// //                             return GestureDetector(
// //                               onTap: () {
// //                                 Navigator.push(
// //                                   context,
// //                                   MaterialPageRoute(
// //                                     builder: (context) =>
// //                                         InfoScreen(infoBank: infoBank),
// //                                   ),
// //                                 );
// //                               },
// //                               child: Container(
// //                                 padding: const EdgeInsets.all(10),
// //                                 decoration: BoxDecoration(
// //                                   color: Colors.black,
// //                                   boxShadow: [
// //                                     BoxShadow(
// //                                       color: Colors.grey.withOpacity(0.5),
// //                                       spreadRadius: 2,
// //                                       blurRadius: 7,
// //                                       offset: const Offset(
// //                                           0, 3), // changes position of shadow
// //                                     ),
// //                                   ],
// //                                   borderRadius: BorderRadius.circular(
// //                                       20), // circular edge
// //                                 ),
// //                                 child:Column(children: [
// //                                   Center(
// //                                     child: Text(
// //                                       "(${index + 1})${infoBank.Tip_Title}",
// //                                       style: const TextStyle(
// //                                           color: Colors.amber,
// //                                           fontSize: 20,
// //                                           fontWeight: FontWeight.bold),
// //                                     )),
// //                                   Text("lottiefile:${infoBank.Is_Material_Lottie}",style: const TextStyle(
// //                                       color: Colors.amber,
// //                                       fontSize: 20,
// //                                       fontWeight: FontWeight.bold),),
// //                                   Text("Picture:${infoBank.Is_Material_Picture}",style: const TextStyle(
// //                                       color: Colors.amber,
// //                                       fontSize: 20,
// //                                       fontWeight: FontWeight.bold),),
// //                                   Text("section:${infoBank.Tip_Section}",style: const TextStyle(
// //                                       color: Colors.amber,
// //                                       fontSize: 20,
// //                                       fontWeight: FontWeight.bold),),
// //                                 ],)
// //                               ),
// //                             );
// //                           },
// //                         ),
// //                       )
// //                     : const Center(
// //                         child: Text(
// //                           'No Items Available for now',
// //                           style: TextStyle(color: Colors.red),
// //                         ),
// //                       )
// //               ]));
// //         }));
// //   }
// // }
// //
// // class InfoScreen extends StatefulWidget {
// //   final Info infoBank;
// //
// //   const InfoScreen({super.key, required this.infoBank});
// //
// //   @override
// //   State<InfoScreen> createState() => _InfoScreenState();
// // }
// //
// // class _InfoScreenState extends State<InfoScreen> {
// //   int _currentIndex = 0;
// //   final CarouselSliderController _carouselController =
// //       CarouselSliderController();
// //   bool _isAutoPlay = true;
// //   // final List<String> _images = [
// //   //   'assets/images/openaccount1.jpg',
// //   //   'assets/images/openaccount2.jpg',
// //   //   'assets/images/openaccount3.jpg',
// //   // ];
// //
// //   void onTap(int index) {
// //     setState(() {
// //       _currentIndex = index;
// //       _isAutoPlay = false; // Stop autoplay when a step is tapped
// //     });
// //     _carouselController.animateToPage(index);
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(widget.infoBank.Tip_Title!),
// //         actions: [TextButton(onPressed: (){
// //           Navigator.push(
// //           context,
// //           MaterialPageRoute(
// //             builder: (context) =>
// //             InfoEditDetails(infoBank: widget.infoBank,)
// //           ),
// //         );}, child: const Text("edit")),],
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(20.0),
// //         child:
// //         //TextButton(onPressed: (){}, child: Text("edit")),
// //           (widget.infoBank.Is_Material_Lottie == true &&
// //             widget.infoBank.Material_Path !=
// //                 "" &&
// //             widget.infoBank.Material_Path !=
// //                 null)
// //             ? ListView.builder(
// //           itemCount: 2,
// //           itemBuilder: (context, index) {
// //             if (index == 0) {
// //               return Lottie.network(
// //                 "${widget.infoBank.Material_Path}",
// //                 width: 300,
// //                 height: 500,
// //               );
// //             } else {
// //               return Column(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                   Row(
// //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     children: [
// //                       Text(widget.infoBank.Related_Screen ?? ''),
// //                       Text(widget.infoBank.Tip_Title ?? ''),
// //                     ],
// //                   ),
// //                   Container(
// //                       height: 100,
// //                       decoration: const BoxDecoration(
// //                           color: Colors.grey,
// //                           borderRadius:
// //                           BorderRadius.all(Radius.circular(10))),
// //                       child: Column(
// //                         children: [
// //                           const Text("الشرح"),
// //                           Text(
// //                               widget.infoBank.Tip_Description_Info ?? ''),
// //                         ],
// //                       )),
// //                   const SizedBox(
// //                     height: 5,
// //                   ),
// //                   Container(
// //                       height: 100,
// //                       decoration: const BoxDecoration(
// //                           color: Colors.green,
// //                           borderRadius:
// //                           BorderRadius.all(Radius.circular(10))),
// //                       child: Column(
// //                         children: [
// //                           const Text("الفكرة"),
// //                           Text(
// //                               widget.infoBank.Tip_Description_Idea ?? ''),
// //                         ],
// //                       )),
// //                   const SizedBox(height: 5),
// //                   Container(
// //                       height: 100,
// //                       decoration: const BoxDecoration(
// //                           color: Colors.grey,
// //                           borderRadius:
// //                           BorderRadius.all(Radius.circular(10))),
// //                       child: Column(
// //                         children: [
// //                           const Text("هل تعلم"),
// //                           Text(
// //                               widget.infoBank.Tip_Description_Info ?? ''),
// //                         ],
// //                       )),
// //                 ],
// //               );
// //             }
// //           },
// //         )
// //             : ListView.builder(
// //           itemCount: 2,
// //           itemBuilder: (context, index) {
// //             if (index == 0) {
// //               return Stack(
// //                 children: [
// //                   Positioned(
// //                       top: 0,
// //                       left: 0,
// //                       bottom: 10,
// //                       right: 0,
// //                       child: CarouselSlider(
// //                         items: widget.infoBank.Material_Path_List?.map((image) {
// //                           return ClipRRect(
// //                             borderRadius: BorderRadius.circular(40),
// //                             child: Image.asset(
// //                               image,
// //                               fit: BoxFit.contain,
// //                             ),
// //                           );
// //                         }).toList(),
// //                         carouselController: _carouselController,
// //                         options: CarouselOptions(
// //                           height: 550,
// //                           autoPlay: _isAutoPlay,
// //                           autoPlayInterval: const Duration(seconds: 2),
// //                           enlargeCenterPage: true,
// //                           viewportFraction: 1.0,
// //                           aspectRatio: 1.0,
// //                           initialPage: 0,
// //                           reverse: true,
// //                           onPageChanged: (index, reason) {
// //                             setState(() {
// //                               _currentIndex = index;
// //                             });
// //                           },
// //                         ),
// //                       )),
// //                   Center(
// //                     child: Image.asset(
// //                       'assets/images/mobleIphone.png',
// //                       width: 500,
// //                       height: 600,
// //                     ),
// //                   ),
// //                 ],
// //               );
// //             } else {
// //               return Column(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                   Row(
// //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     children: [
// //                       Text(widget.infoBank.Related_Screen ?? ''),
// //                       Text(widget.infoBank.Tip_Title ?? ''),
// //                     ],
// //                   ),
// //                   GestureDetector(
// //                     onTap: () => onTap(0),
// //                     child: Container(
// //                       height: 100,
// //                       width: double.infinity,
// //                       decoration: BoxDecoration(
// //                         color: _currentIndex == 0
// //                             ? Colors.green
// //                             : Colors.grey,
// //                         borderRadius:
// //                         const BorderRadius.all(Radius.circular(10)),
// //                       ),
// //                       child: const Center(
// //                         child: Text("خطوة1"),
// //                       ),
// //                     ),
// //                   ),
// //                   const SizedBox(height: 5),
// //                   GestureDetector(
// //                     onTap: () => onTap(1),
// //                     child: Container(
// //                       height: 100,
// //                       width: double.infinity,
// //                       decoration: BoxDecoration(
// //                         color: _currentIndex == 1
// //                             ? Colors.green
// //                             : Colors.grey,
// //                         borderRadius:
// //                         const BorderRadius.all(Radius.circular(10)),
// //                       ),
// //                       child: const Center(
// //                         child: Text("خطوة2"),
// //                       ),
// //                     ),
// //                   ),
// //                   const SizedBox(height: 5),
// //                   GestureDetector(
// //                     onTap: () => onTap(2),
// //                     child: Container(
// //                       height: 100,
// //                       width: double.infinity,
// //                       decoration: BoxDecoration(
// //                         color: _currentIndex == 2
// //                             ? Colors.green
// //                             : Colors.grey,
// //                         borderRadius:
// //                         const BorderRadius.all(Radius.circular(10)),
// //                       ),
// //                       child: const Center(
// //                         child: Text("خطوة3"),
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               );
// //             }
// //           },
// //         ),
// //
// //       ),
// //     );
// //   }
// // }
// //
// // class InfoEditDetails extends StatefulWidget {
// //   final Info infoBank;
// //
// //   const InfoEditDetails({super.key, required this.infoBank});
// //
// //   @override
// //   State<InfoEditDetails> createState() => _InfoEditDetailsState();
// // }
// // class _InfoEditDetailsState extends State<InfoEditDetails> {
// //   late TextEditingController _titleController;
// //   late TextEditingController _sectionController;
// //   late TextEditingController _relatedScreenController;
// //   late TextEditingController _orderNumberController;
// //   late TextEditingController _mainDescriptionController;
// //   late TextEditingController _descriptionIdeaController;
// //   late TextEditingController _descriptionInfoController;
// //   late TextEditingController _techDetailsController;
// //   late TextEditingController _isBasicController;
// //   late TextEditingController _isNewController;
// //   late TextEditingController _isFAQController;
// //   late TextEditingController _isOfficialController;
// //   late TextEditingController _isStepByStepController;
// //   late TextEditingController _isMaterialLottieController;
// //   late TextEditingController _isMaterialPictureController;
// //   late TextEditingController _isMaterialYouTubeController;
// //   late TextEditingController _relatedAppScreenController;
// //   late TextEditingController _materialPathController;
// //   late TextEditingController _materialPathListController;
// //   late TextEditingController _androidVerController;
// //   late TextEditingController _iosVerController;
// //   late TextEditingController _isOptionalController;
// //   late TextEditingController _isRequiredController;
// //   late TextEditingController _isTakeTimeController;
// //   late TextEditingController _isComingSoonController;
// //   late TextEditingController _isForAdminController;
// //   late TextEditingController _isForSalesTeamController;
// //   late TextEditingController _isForOwnerController;
// //   List? _selectedImages = []; // List to store selected images
// //   final List<String> imageUrls = [];
// // String imageUrl="";
// //   final ImagePicker _picker = ImagePicker();
// //   List<Widget>? _initialImages;
// //   @override
// //   void initState() {
// //     super.initState();
// //     // Initialize controllers with the infoBank values
// //  _initialImages = widget.infoBank.Material_Path_List!.map((path) => Image.asset(path)).toList();
// //
// //     _titleController = TextEditingController(text: widget.infoBank.Tip_Title ?? '');
// //     _sectionController = TextEditingController(text: widget.infoBank.Tip_Section ?? '');
// //     _relatedScreenController = TextEditingController(text: widget.infoBank.Related_Screen ?? '');
// //     _orderNumberController = TextEditingController(text: widget.infoBank.Tip_Order_Number ?? '');
// //     _mainDescriptionController = TextEditingController(text: widget.infoBank.Tip_Main_Description ?? '');
// //     _descriptionIdeaController = TextEditingController(text: widget.infoBank.Tip_Description_Idea ?? '');
// //     _descriptionInfoController = TextEditingController(text: widget.infoBank.Tip_Description_Info ?? '');
// //     _techDetailsController = TextEditingController(text: widget.infoBank.Tip_Tech_Details ?? '');
// //     _isBasicController = TextEditingController(text: widget.infoBank.Is_Basic.toString());
// //     _isNewController = TextEditingController(text: widget.infoBank.Is_New.toString());
// //     _isFAQController = TextEditingController(text: widget.infoBank.Is_FAQ.toString());
// //     _isOfficialController = TextEditingController(text: widget.infoBank.Is_Official.toString());
// //     _isStepByStepController = TextEditingController(text: widget.infoBank.Is_Step_By_Step.toString());
// //     _isMaterialLottieController = TextEditingController(text: widget.infoBank.Is_Material_Lottie.toString());
// //     _isMaterialPictureController = TextEditingController(text: widget.infoBank.Is_Material_Picture.toString());
// //     _isMaterialYouTubeController = TextEditingController(text: widget.infoBank.Is_Material_YouTube.toString());
// //     _relatedAppScreenController = TextEditingController(text: widget.infoBank.Related_App_Screen ?? '');
// //     _materialPathController = TextEditingController(text: widget.infoBank.Material_Path ?? '');
// //     _materialPathListController = TextEditingController(text: widget.infoBank.Material_Path_List .toString());
// //     _androidVerController = TextEditingController(text: widget.infoBank.Android_Ver.toString());
// //     _iosVerController = TextEditingController(text: widget.infoBank.IOS_Ver .toString());
// //     _isOptionalController = TextEditingController(text: widget.infoBank.Is_Optional.toString());
// //     _isRequiredController = TextEditingController(text: widget.infoBank.Is_Required.toString());
// //     _isTakeTimeController = TextEditingController(text: widget.infoBank.Is_Take_Time.toString());
// //     _isComingSoonController = TextEditingController(text: widget.infoBank.Is_ComingSoon.toString());
// //     _isForAdminController = TextEditingController(text: widget.infoBank.Is_For_Admin.toString());
// //     _isForSalesTeamController = TextEditingController(text: widget.infoBank.Is_For_SalesTeam.toString());
// //     _isForOwnerController = TextEditingController(text: widget.infoBank.Is_ForOwner.toString());
// //   }
// //
// //   @override
// //   void dispose() {
// //     _titleController.dispose();
// //     _sectionController.dispose();
// //     _relatedScreenController.dispose();
// //     _orderNumberController.dispose();
// //     _mainDescriptionController.dispose();
// //     _descriptionIdeaController.dispose();
// //     _descriptionInfoController.dispose();
// //     _techDetailsController.dispose();
// //     _isBasicController.dispose();
// //     _isNewController.dispose();
// //     _isFAQController.dispose();
// //     _isOfficialController.dispose();
// //     _isStepByStepController.dispose();
// //     _isMaterialLottieController.dispose();
// //     _isMaterialPictureController.dispose();
// //     _isMaterialYouTubeController.dispose();
// //     _relatedAppScreenController.dispose();
// //     _materialPathController.dispose();
// //     _materialPathListController.dispose();
// //     _androidVerController.dispose();
// //     _iosVerController.dispose();
// //     _isOptionalController.dispose();
// //     _isRequiredController.dispose();
// //     _isTakeTimeController.dispose();
// //     _isComingSoonController.dispose();
// //     _isForAdminController.dispose();
// //     _isForSalesTeamController.dispose();
// //     _isForOwnerController.dispose();
// //     super.dispose();
// //   }
// //    late XFile pickedFile;
// //   Future<void> _pickImage() async {
// //      pickedFile = (await _picker.pickImage(source: ImageSource.gallery))!;
// // print("path:${pickedFile?.path}");
// //     if (pickedFile != null) {
// //       setState(() {
// //         _selectedImages?.add(File(pickedFile.path));
// //       });
// //     }
// //   }
// //   Future<void> _removeImage(int index) async {
// //     setState(() {
// //       _selectedImages?.removeAt(index);
// //     });
// //   }
// //   final storage = FirebaseStorage.instance;
// //   Future<void> _saveAndUpdate() async {
// //       Reference referenceRoot = FirebaseStorage.instance.ref();
// //       Reference referenceImage=referenceRoot.child('images');
// //       String Name =DateTime.now().microsecondsSinceEpoch.toString();
// //     ///  try
// //     Reference referenceImageToUpload=referenceImage.child(Name);
// //    await   referenceImageToUpload.putFile(File(pickedFile.path));
// //       imageUrl=await referenceImageToUpload.getDownloadURL();
// //       print(imageUrl);
// //       imageUrls.add(imageUrl);
// //     // Find the Info object with the title "widget.infoBank.Tip_Title"
// //     Info? infoToEdit;
// //     for (var info in infoBank.values) {
// //       if (info.Tip_Title == widget.infoBank.Tip_Title) {
// //         infoToEdit = info;
// //         break;
// //       }
// //     }
// //
// //     // Update the Info object with the edited values
// //     if (infoToEdit != null) {
// //       infoToEdit.Tip_Title = _titleController.text;
// //       infoToEdit.Tip_Section = _sectionController.text;
// //       infoToEdit.Related_Screen = _relatedScreenController.text;
// //       infoToEdit.Tip_Order_Number = _orderNumberController.text;
// //       infoToEdit.Tip_Main_Description = _mainDescriptionController.text;
// //       infoToEdit.Tip_Description_Idea = _descriptionIdeaController.text;
// //       infoToEdit.Tip_Description_Info = _descriptionInfoController.text;
// //       infoToEdit.Tip_Tech_Details = _techDetailsController.text;
// //       infoToEdit.Is_Basic = _isBasicController.text == 'true';
// //       infoToEdit.Is_New = _isNewController.text == 'true';
// //       infoToEdit.Is_FAQ = _isFAQController.text == 'true';
// //       infoToEdit.Is_Official = _isOfficialController.text == 'true';
// //       infoToEdit.Is_Step_By_Step = _isStepByStepController.text == 'true';
// //       infoToEdit.Is_Material_Lottie = _isMaterialLottieController.text == 'true';
// //       infoToEdit.Is_Material_Picture = _isMaterialPictureController.text == 'true';
// //       infoToEdit.Is_Material_YouTube = _isMaterialYouTubeController.text == 'true';
// //       infoToEdit.Related_App_Screen = _relatedAppScreenController.text;
// //       infoToEdit.Material_Path = _materialPathController.text;
// //       infoToEdit.Material_Path_List = imageUrls??[];
// //       infoToEdit.Android_Ver = int.parse(_androidVerController.text);
// //       infoToEdit.IOS_Ver = int.parse(_iosVerController.text);
// //       infoToEdit.Is_Optional = _isOptionalController.text == 'true';
// //       infoToEdit.Is_Required = _isRequiredController.text == 'true';
// //       infoToEdit.Is_Take_Time = _isTakeTimeController.text == 'true';
// //       infoToEdit.Is_ComingSoon = _isComingSoonController.text == 'true';
// //       infoToEdit.Is_For_Admin = _isForAdminController.text == 'true';
// //       infoToEdit.Is_For_SalesTeam = _isForSalesTeamController.text == 'true';
// //       infoToEdit.Is_ForOwner = _isForOwnerController.text == 'true';
// //     }
// //
// //     // Update the Firebase Firestore document with the new map
// //     final CollectionReference restrictionsDataCollection =
// //     FirebaseFirestore.instance.collection('InfoBankData');
// //     final Map<String, dynamic> bigMap = {'info': {}};
// //
// //     for (var infoBankValue in infoBank.values) {
// //       final Map<String, dynamic> infoMap = infoBankValue.toMap(Path: 'InfoBankData/AllInfoData');
// //       bigMap['info'][infoBankValue.Tip_Title!] = infoMap;
// //     }
// //
// //     await restrictionsDataCollection.doc('AllInfoData').set(bigMap);
// //     // Optional: Show confirmation or feedback to the user
// //     ScaffoldMessenger.of(context).showSnackBar(
// //       const SnackBar(content: Text('Changes saved successfully!')),
// //     );
// //   }
// //
// //
// //   @override
// //     Widget build(BuildContext context) {
// //     List? initialAssetPaths=widget.infoBank.Material_Path_List;
// //     void _removeImage(int index) {
// //       setState(() {
// //         _selectedImages!.removeAt(index);
// //       });
// //     }
// //       return Scaffold(
// //         appBar: AppBar(
// //           title: Text(widget.infoBank.Tip_Title ?? 'Info Details'),
// //           actions: [
// //             IconButton(
// //               icon: const Icon(Icons.save),
// //               onPressed: () {
// //                 _saveAndUpdate();
// //               },
// //             ),
// //           ],
// //         ),
// //         body: ListView(
// //           padding: const EdgeInsets.all(16.0),
// //           children: [
// //             _buildTextField('Tip_Title', _titleController),
// //             _buildTextField('Tip_Section', _sectionController),
// //             _buildTextField('Related_Screen', _relatedScreenController),
// //             _buildTextField('Tip_Order_Number', _orderNumberController),
// //             _buildTextField('Tip_Main_Description', _mainDescriptionController),
// //             _buildTextField('Tip_Description_Idea', _descriptionIdeaController),
// //             _buildTextField('Tip_Description_Info', _descriptionInfoController),
// //             _buildTextField('Tip_Tech_Details', _techDetailsController),
// //             _buildTextField('Is_Basic', _isBasicController,),
// //             _buildTextField('Is_New', _isNewController,),
// //             _buildTextField('Is_FAQ', _isFAQController,),
// //             _buildTextField('Is_Official', _isOfficialController,),
// //             _buildTextField('Is_Step_By_Step', _isStepByStepController,),
// //             _buildTextField('Is_Material_Lottie', _isMaterialLottieController,),
// //             _buildTextField(
// //               'Is_Material_Picture', _isMaterialPictureController,),
// //             _buildTextField(
// //               'Is_Material_YouTube', _isMaterialYouTubeController,),
// //             _buildTextField('Related_App_Screen', _relatedAppScreenController),
// //             _buildTextField('Material_Path', _materialPathController),
// //             _buildTextField('Material_Path_List', _materialPathListController,
// //                 isPicutreList: true),
// //             _selectedImages!.isEmpty
// //                 ? const Center(child: Text('No images selected'))
// //                 : SizedBox(
// //                 height: 400,
// // child:ReorderableListView(
// //   onReorder: (oldIndex, newIndex) {
// //     if (oldIndex < newIndex) {
// //       newIndex -= 1;
// //     }
// //     final item = _selectedImages!.removeAt(oldIndex);
// //     _selectedImages!.insert(newIndex, item);
// //   },
// //   children: List.generate(_initialImages!.length + _selectedImages!.length, (index) {
// //     if (index < _initialImages!.length) {
// //       final assetPath = initialAssetPaths![index];
// //       return Dismissible(
// //         key: ValueKey(assetPath),
// //         onDismissed: (direction) {
// //           setState(() {
// //             initialAssetPaths.removeAt(index);
// //             _initialImages!.removeAt(index);
// //           });
// //         },
// //         child: ListTile(
// //           contentPadding: const EdgeInsets.all(8.0),
// //           leading: _initialImages![index],
// //           title: Text('Image ${index + 1}'),
// //         ),
// //       );
// //     } else {
// //       final image = _selectedImages![index - _initialImages!.length];
// //       return Dismissible(
// //         key: ValueKey(image.path),
// //         onDismissed: (direction) {
// //           _removeImage(index - _initialImages!.length);
// //         },
// //         child: ListTile(
// //           contentPadding: const EdgeInsets.all(8.0),
// //           leading: Image.file(
// //             image,
// //             height: 200,
// //             width: 100,
// //           ),
// //           title: Text('Image ${index + 1}'),
// //           trailing: IconButton(
// //             icon: const Icon(Icons.remove_circle, color: Colors.red),
// //             onPressed: () {
// //               _removeImage(index - _initialImages!.length);
// //             },
// //           ),
// //         ),
// //       );
// //     }
// //   }),
// // )
// //
// //
// //               // child: ReorderableListView(
// //                 //   onReorder: (oldIndex, newIndex) {
// //                 //     // Update the list of images based on the reorder
// //                 //     if (oldIndex < newIndex) {
// //                 //       newIndex -= 1;
// //                 //     }
// //                 //     final item = _selectedImages?.removeAt(oldIndex);
// //                 //     _selectedImages?.insert(newIndex, item);
// //                 //   },
// //                 //   children: List.generate(_selectedImages!.length, (index) {
// //                 //     final image = _selectedImages![index];
// //                 //     return Dismissible(
// //                 //       key: ValueKey(image.path), // Use unique key for each item
// //                 //       onDismissed: (direction) {
// //                 //         _removeImage(index);
// //                 //       },
// //                 //       child: Column(
// //                 //         children: [
// //                 //           ListTile(
// //                 //             contentPadding: const EdgeInsets.all(8.0),
// //                 //             leading:
// //                 //             Image.file(
// //                 //               image,
// //                 //               height: 200,
// //                 //               width: 100,
// //                 //               //  fit: BoxFit.cover,
// //                 //             ),
// //                 //             title: Text('Image ${index + 1}'),
// //                 //             trailing: IconButton(
// //                 //               icon: const Icon(
// //                 //                   Icons.remove_circle, color: Colors.red),
// //                 //               onPressed: () {
// //                 //                 _removeImage(index);
// //                 //               },
// //                 //             ),
// //                 //           ),   ListTile(
// //                 //             contentPadding: const EdgeInsets.all(8.0),
// //                 //             leading:
// //                 //             Image.file(
// //                 //               image,
// //                 //               height: 200,
// //                 //               width: 100,
// //                 //               //  fit: BoxFit.cover,
// //                 //             ),
// //                 //             title: Text('Image ${index + 1}'),
// //                 //             trailing: IconButton(
// //                 //               icon: const Icon(
// //                 //                   Icons.remove_circle, color: Colors.red),
// //                 //               onPressed: () {
// //                 //                 _removeImage(index);
// //                 //               },
// //                 //             ),
// //                 //           ),
// //                 //         ],
// //                 //       ),
// //                 //     );
// //                 //   }),
// //                 // )
// //             ),
// //             _buildTextField(
// //                 'Android_Ver', _androidVerController, isNumeric: true),
// //             _buildTextField('IOS_Ver', _iosVerController, isNumeric: true),
// //             _buildTextField('Is_Optional', _isOptionalController,),
// //             _buildTextField('Is_Required', _isRequiredController,),
// //             _buildTextField('Is_Take_Time', _isTakeTimeController,),
// //             _buildTextField('Is_ComingSoon', _isComingSoonController,),
// //             _buildTextField('Is_For_Admin', _isForAdminController,),
// //             _buildTextField('Is_For_SalesTeam', _isForSalesTeamController,),
// //             _buildTextField('Is_ForOwner', _isForOwnerController,),
// //           ],
// //         ),
// //       );
// //     }
// //
// //   Widget _buildTextField(String label, TextEditingController controller, {bool isNumeric = false,bool isPicutreList = false}) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(vertical: 8.0),
// //       child: TextFormField(
// //         controller: controller,
// //         onChanged: (value) async {
// //           setState(() {
// //
// // widget.infoBank. Tip_Title = _titleController.text;
// // widget.infoBank.  Tip_Section = _sectionController.text;
// // widget.infoBank.   Related_Screen = _relatedScreenController.text;
// // widget.infoBank.  Tip_Order_Number = _orderNumberController.text;
// // widget.infoBank. Tip_Main_Description = _mainDescriptionController.text;
// // widget.infoBank.Tip_Description_Idea = _descriptionIdeaController.text;
// // widget.infoBank.  Tip_Description_Info = _descriptionInfoController.text;
// // widget.infoBank. Tip_Tech_Details =_techDetailsController.text;
// //
// // // Convert string values to boolean if necessary
// // widget.infoBank.Is_Basic =_isBasicController.text.toLowerCase() == 'true';
// // widget.infoBank.Is_New = _isNewController.text.toLowerCase() == 'true';
// // widget.infoBank.  Is_FAQ = _isFAQController.text.toLowerCase() == 'true';
// // widget.infoBank.   Is_Official = _isOfficialController.text.toLowerCase() == 'true';
// // widget.infoBank. Is_Step_By_Step = _isStepByStepController.text.toLowerCase() == 'true';
// // widget.infoBank.   Is_Material_Lottie = _isMaterialLottieController.text.toLowerCase() == 'true';
// // widget.infoBank.Is_Material_Picture = _isMaterialPictureController.text.toLowerCase() == 'true';
// // widget.infoBank. Is_Material_YouTube = _isMaterialYouTubeController.text.toLowerCase() == 'true';
// //
// // widget.infoBank.Related_App_Screen = _relatedAppScreenController.text;
// // widget.infoBank.Material_Path = _materialPathController.text;
// // // Save image paths in Material_Path_List
// // List imagePaths = _selectedImages!.map((image) => image.path).toList();
// // widget.infoBank.Material_Path_List = imagePaths;
// // widget.infoBank.Android_Ver = int.tryParse(_androidVerController.text);
// // widget.infoBank.IOS_Ver = int.tryParse(_iosVerController.text);
// // widget.infoBank.Is_Optional = _isOptionalController.text.toLowerCase() == 'true';
// // widget.infoBank.Is_Required = _isRequiredController.text.toLowerCase() == 'true';
// // widget.infoBank.Is_Take_Time = _isTakeTimeController.text.toLowerCase() == 'true';
// // widget.infoBank.Is_ComingSoon = _isComingSoonController.text.toLowerCase() == 'true';
// // widget.infoBank.Is_For_Admin = _isForAdminController.text.toLowerCase() == 'true';
// // widget.infoBank.Is_For_SalesTeam = _isForSalesTeamController.text.toLowerCase() == 'true';
// // widget.infoBank.Is_ForOwner = _isForOwnerController.text.toLowerCase() == 'true';
// //           }); // Update the UI in real-time
// //         },
// //         keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
// //
// //         decoration: InputDecoration(
// //           labelText: label,
// //           suffixIcon: (isPicutreList==true)?IconButton(
// //             icon: const Icon(Icons.add_a_photo),
// //             onPressed: _pickImage,
// //           ):null,
// //           border: const OutlineInputBorder(),
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // class InfoAddDetails extends StatefulWidget {
// //   final Info infoBank;
// //
// //   const InfoAddDetails({super.key, required this.infoBank});
// //
// //   @override
// //   State<InfoAddDetails> createState() => _InfoAddDetailsState();
// // }
// //
// // class _InfoAddDetailsState extends State<InfoAddDetails> {
// //
// //   late TextEditingController _titleController;
// //   late TextEditingController _sectionController;
// //   late TextEditingController _relatedScreenController;
// //   late TextEditingController _orderNumberController;
// //   late TextEditingController _mainDescriptionController;
// //   late TextEditingController _descriptionIdeaController;
// //   late TextEditingController _descriptionInfoController;
// //   late TextEditingController _techDetailsController;
// //   late TextEditingController _isBasicController;
// //   late TextEditingController _isNewController;
// //   late TextEditingController _isFAQController;
// //   late TextEditingController _isOfficialController;
// //   late TextEditingController _isStepByStepController;
// //   late TextEditingController _isMaterialLottieController;
// //   late TextEditingController _isMaterialPictureController;
// //   late TextEditingController _isMaterialYouTubeController;
// //   late TextEditingController _relatedAppScreenController;
// //   late TextEditingController _materialPathController;
// //   late TextEditingController _materialPathListController;
// //   late TextEditingController _androidVerController;
// //   late TextEditingController _iosVerController;
// //   late TextEditingController _isOptionalController;
// //   late TextEditingController _isRequiredController;
// //   late TextEditingController _isTakeTimeController;
// //   late TextEditingController _isComingSoonController;
// //   late TextEditingController _isForAdminController;
// //   late TextEditingController _isForSalesTeamController;
// //   late TextEditingController _isForOwnerController;
// //   List<File> _selectedImages = []; // List to store selected images
// //   final List<String> imageUrls = [];
// // String imageUrl="";
// //   final ImagePicker _picker = ImagePicker();
// //   @override
// //   void initState() {
// //     super.initState();
// //
// //     // Initialize controllers with the infoBank values
// //     _titleController = TextEditingController(text: widget.infoBank.Tip_Title ?? '');
// //     _sectionController = TextEditingController(text: widget.infoBank.Tip_Section ?? '');
// //     _relatedScreenController = TextEditingController(text: widget.infoBank.Related_Screen ?? '');
// //     _orderNumberController = TextEditingController(text: widget.infoBank.Tip_Order_Number ?? '');
// //     _mainDescriptionController = TextEditingController(text: widget.infoBank.Tip_Main_Description ?? '');
// //     _descriptionIdeaController = TextEditingController(text: widget.infoBank.Tip_Description_Idea ?? '');
// //     _descriptionInfoController = TextEditingController(text: widget.infoBank.Tip_Description_Info ?? '');
// //     _techDetailsController = TextEditingController(text: widget.infoBank.Tip_Tech_Details ?? '');
// //     _isBasicController = TextEditingController(text: widget.infoBank.Is_Basic.toString());
// //     _isNewController = TextEditingController(text: widget.infoBank.Is_New.toString());
// //     _isFAQController = TextEditingController(text: widget.infoBank.Is_FAQ.toString());
// //     _isOfficialController = TextEditingController(text: widget.infoBank.Is_Official.toString());
// //     _isStepByStepController = TextEditingController(text: widget.infoBank.Is_Step_By_Step.toString());
// //     _isMaterialLottieController = TextEditingController(text: widget.infoBank.Is_Material_Lottie.toString());
// //     _isMaterialPictureController = TextEditingController(text: widget.infoBank.Is_Material_Picture.toString());
// //     _isMaterialYouTubeController = TextEditingController(text: widget.infoBank.Is_Material_YouTube.toString());
// //     _relatedAppScreenController = TextEditingController(text: widget.infoBank.Related_App_Screen ?? '');
// //     _materialPathController = TextEditingController(text: widget.infoBank.Material_Path ?? '');
// //     _materialPathListController = TextEditingController(text: widget.infoBank.Material_Path_List .toString());
// //     _androidVerController = TextEditingController(text: widget.infoBank.Android_Ver.toString());
// //     _iosVerController = TextEditingController(text: widget.infoBank.IOS_Ver .toString());
// //     _isOptionalController = TextEditingController(text: widget.infoBank.Is_Optional.toString());
// //     _isRequiredController = TextEditingController(text: widget.infoBank.Is_Required.toString());
// //     _isTakeTimeController = TextEditingController(text: widget.infoBank.Is_Take_Time.toString());
// //     _isComingSoonController = TextEditingController(text: widget.infoBank.Is_ComingSoon.toString());
// //     _isForAdminController = TextEditingController(text: widget.infoBank.Is_For_Admin.toString());
// //     _isForSalesTeamController = TextEditingController(text: widget.infoBank.Is_For_SalesTeam.toString());
// //     _isForOwnerController = TextEditingController(text: widget.infoBank.Is_ForOwner.toString());
// //   }
// //
// //   @override
// //   void dispose() {
// //     _titleController.dispose();
// //     _sectionController.dispose();
// //     _relatedScreenController.dispose();
// //     _orderNumberController.dispose();
// //     _mainDescriptionController.dispose();
// //     _descriptionIdeaController.dispose();
// //     _descriptionInfoController.dispose();
// //     _techDetailsController.dispose();
// //     _isBasicController.dispose();
// //     _isNewController.dispose();
// //     _isFAQController.dispose();
// //     _isOfficialController.dispose();
// //     _isStepByStepController.dispose();
// //     _isMaterialLottieController.dispose();
// //     _isMaterialPictureController.dispose();
// //     _isMaterialYouTubeController.dispose();
// //     _relatedAppScreenController.dispose();
// //     _materialPathController.dispose();
// //     _materialPathListController.dispose();
// //     _androidVerController.dispose();
// //     _iosVerController.dispose();
// //     _isOptionalController.dispose();
// //     _isRequiredController.dispose();
// //     _isTakeTimeController.dispose();
// //     _isComingSoonController.dispose();
// //     _isForAdminController.dispose();
// //     _isForSalesTeamController.dispose();
// //     _isForOwnerController.dispose();
// //     super.dispose();
// //   }
// //    // late XFile pickedFile;
// //   Future<void> _pickImage() async {
// //    final  pickedFile = (await _picker.pickImage(source: ImageSource.gallery))!;
// // print("path:${pickedFile?.path}");
// //     if (pickedFile != null) {
// //       setState(() {
// //         _selectedImages.add(File(pickedFile.path));
// //       });
// //     }
// //   }
// //   Future<void> _removeImage(int index) async {
// //     setState(() {
// //       _selectedImages.removeAt(index);
// //     });
// //   }
// //   final storage = FirebaseStorage.instance;
// //   Future<void> _saveAndUpdate() async {
// //     // Reference referenceRoot = FirebaseStorage.instance.ref();
// //     // Reference referenceImage = referenceRoot.child('images');
// //     // String Name = DateTime.now().microsecondsSinceEpoch.toString();
// //     // Reference referenceImageToUpload = referenceImage.child(Name);
// //     // await referenceImageToUpload.putFile(File(pickedFile.path));
// //     // imageUrl = await referenceImageToUpload.getDownloadURL();
// //     // print(imageUrl);
// //     // imageUrls.add(imageUrl);
// //
// //     // Create a new Info object
// //     Info newInfo = Info(
// //       Tip_Title: _titleController.text??"",
// //       Tip_Section: _sectionController.text??"",
// //       Related_Screen: _relatedScreenController.text??"",
// //       Tip_Order_Number: _orderNumberController.text??"",
// //       Tip_Main_Description: _mainDescriptionController.text??"",
// //       Tip_Description_Idea: _descriptionIdeaController.text??"",
// //       Tip_Description_Info: _descriptionInfoController.text??"",
// //       Tip_Tech_Details: _techDetailsController.text??"",
// //       Is_Basic: _isBasicController.text == 'true',
// //       Is_New: _isNewController.text == 'true',
// //       Is_FAQ: _isFAQController.text == 'true',
// //       Is_Official: _isOfficialController.text == 'true',
// //       Is_Step_By_Step: _isStepByStepController.text == 'true',
// //       Is_Material_Lottie: _isMaterialLottieController.text == 'true',
// //       Is_Material_Picture: _isMaterialPictureController.text == 'true',
// //       Is_Material_YouTube: _isMaterialYouTubeController.text == 'true',
// //       Related_App_Screen: _relatedAppScreenController.text??"",
// //       Material_Path: _materialPathController.text??"",
// //       Material_Path_List: imageUrls??[],
// //       Android_Ver: int.parse(_androidVerController.text)??0,
// //       IOS_Ver: int.parse(_iosVerController.text)??0,
// //       Is_Optional: _isOptionalController.text == 'true',
// //       Is_Required: _isRequiredController.text == 'true',
// //       Is_Take_Time: _isTakeTimeController.text == 'true',
// //       Is_ComingSoon: _isComingSoonController.text == 'true',
// //       Is_For_Admin: _isForAdminController.text == 'true',
// //       Is_For_SalesTeam: _isForSalesTeamController.text == 'true',
// //       Is_ForOwner: _isForOwnerController.text == 'true',
// //     );
// //
// //     // Add the new Info object to the infoBank map
// //     infoBank[_titleController.text] = newInfo;
// //
// //     // Create a map to store the updated data
// //     final Map<String, dynamic> bigMap = {'info': {}};
// //     // Populate the bigMap with the updated infoBank values
// //     for (var infoBankValue in infoBank.values) {
// //       final Map<String, dynamic> infoMap = infoBankValue.toMap(Path: 'InfoBankData/AllInfoData');
// //       bigMap['info'][infoBankValue.Tip_Title!] = infoMap;
// //     }
// //
// //     // Update the Firebase Firestore document with the new map
// //     final CollectionReference restrictionsDataCollection =
// //     FirebaseFirestore.instance.collection('InfoBankData');
// //     await restrictionsDataCollection.doc('AllInfoData').set(bigMap);
// //
// //     // Optional: Show confirmation or feedback to the user
// //     ScaffoldMessenger.of(context).showSnackBar(
// //       const SnackBar(content: Text('Changes saved successfully!')),
// //     );
// //   }
// //
// //
// //   @override
// //     Widget build(BuildContext context) {
// //       return Scaffold(
// //         appBar: AppBar(
// //           title: Text(widget.infoBank.Tip_Title ?? 'Info Details'),
// //           actions: [
// //             IconButton(
// //               icon: const Icon(Icons.save),
// //               onPressed: () {
// //                 _saveAndUpdate();
// //               },
// //             ),
// //           ],
// //         ),
// //         body: ListView(
// //           padding: const EdgeInsets.all(16.0),
// //           children: [
// //             _buildTextField('Tip_Title', _titleController),
// //             _buildTextField('Tip_Section', _sectionController),
// //             _buildTextField('Related_Screen', _relatedScreenController),
// //             _buildTextField('Tip_Order_Number', _orderNumberController),
// //             _buildTextField('Tip_Main_Description', _mainDescriptionController),
// //             _buildTextField('Tip_Description_Idea', _descriptionIdeaController),
// //             _buildTextField('Tip_Description_Info', _descriptionInfoController),
// //             _buildTextField('Tip_Tech_Details', _techDetailsController),
// //             _buildTextField('Is_Basic', _isBasicController,),
// //             _buildTextField('Is_New', _isNewController,),
// //             _buildTextField('Is_FAQ', _isFAQController,),
// //             _buildTextField('Is_Official', _isOfficialController,),
// //             _buildTextField('Is_Step_By_Step', _isStepByStepController,),
// //             _buildTextField('Is_Material_Lottie', _isMaterialLottieController,),
// //             _buildTextField(
// //               'Is_Material_Picture', _isMaterialPictureController,),
// //             _buildTextField(
// //               'Is_Material_YouTube', _isMaterialYouTubeController,),
// //             _buildTextField('Related_App_Screen', _relatedAppScreenController),
// //             _buildTextField('Material_Path', _materialPathController),
// //             _buildTextField('Material_Path_List', _materialPathListController,
// //                 isPicutreList: true),
// //             _selectedImages.isEmpty
// //                 ? const Center(child: Text('No images selected'))
// //                 : SizedBox(
// //                 height: 400,
// //
// //                 child: ReorderableListView(
// //                   onReorder: (oldIndex, newIndex) {
// //                     // Update the list of images based on the reorder
// //                     if (oldIndex < newIndex) {
// //                       newIndex -= 1;
// //                     }
// //                     final item = _selectedImages.removeAt(oldIndex);
// //                     _selectedImages.insert(newIndex, item);
// //                   },
// //                   children: List.generate(_selectedImages.length, (index) {
// //                     final image = _selectedImages[index];
// //                     return Dismissible(
// //                       key: ValueKey(image.path), // Use unique key for each item
// //                       onDismissed: (direction) {
// //                         _removeImage(index);
// //                       },
// //                       child: ListTile(
// //                         contentPadding: const EdgeInsets.all(8.0),
// //                         leading: Image.file(
// //                           image,
// //                           height: 200,
// //                           width: 100,
// //                           //  fit: BoxFit.cover,
// //                         ),
// //                         title: Text('Image ${index + 1}'),
// //                         trailing: IconButton(
// //                           icon: const Icon(
// //                               Icons.remove_circle, color: Colors.red),
// //                           onPressed: () {
// //                             _removeImage(index);
// //                           },
// //                         ),
// //                       ),
// //                     );
// //                   }),
// //                 )
// //             ),
// //             _buildTextField(
// //                 'Android_Ver', _androidVerController, isNumeric: true),
// //             _buildTextField('IOS_Ver', _iosVerController, isNumeric: true),
// //             _buildTextField('Is_Optional', _isOptionalController,),
// //             _buildTextField('Is_Required', _isRequiredController,),
// //             _buildTextField('Is_Take_Time', _isTakeTimeController,),
// //             _buildTextField('Is_ComingSoon', _isComingSoonController,),
// //             _buildTextField('Is_For_Admin', _isForAdminController,),
// //             _buildTextField('Is_For_SalesTeam', _isForSalesTeamController,),
// //             _buildTextField('Is_ForOwner', _isForOwnerController,),
// //           ],
// //         ),
// //       );
// //     }
// //
// //   Widget _buildTextField(String label, TextEditingController controller, {bool isNumeric = false,bool isPicutreList = false}) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(vertical: 8.0),
// //       child: TextFormField(
// //         controller: controller,
// //         onChanged: (value) async {
// //           setState(() {
// //
// // widget.infoBank. Tip_Title = _titleController.text;
// // widget.infoBank.  Tip_Section = _sectionController.text;
// // widget.infoBank.   Related_Screen = _relatedScreenController.text;
// // widget.infoBank.  Tip_Order_Number = _orderNumberController.text;
// // widget.infoBank. Tip_Main_Description = _mainDescriptionController.text;
// // widget.infoBank.Tip_Description_Idea = _descriptionIdeaController.text;
// // widget.infoBank.  Tip_Description_Info = _descriptionInfoController.text;
// // widget.infoBank. Tip_Tech_Details =_techDetailsController.text;
// //
// // // Convert string values to boolean if necessary
// // widget.infoBank.Is_Basic =_isBasicController.text.toLowerCase() == 'true';
// // widget.infoBank.Is_New = _isNewController.text.toLowerCase() == 'true';
// // widget.infoBank.  Is_FAQ = _isFAQController.text.toLowerCase() == 'true';
// // widget.infoBank.   Is_Official = _isOfficialController.text.toLowerCase() == 'true';
// // widget.infoBank. Is_Step_By_Step = _isStepByStepController.text.toLowerCase() == 'true';
// // widget.infoBank.   Is_Material_Lottie = _isMaterialLottieController.text.toLowerCase() == 'true';
// // widget.infoBank.Is_Material_Picture = _isMaterialPictureController.text.toLowerCase() == 'true';
// // widget.infoBank. Is_Material_YouTube = _isMaterialYouTubeController.text.toLowerCase() == 'true';
// //
// // widget.infoBank.Related_App_Screen = _relatedAppScreenController.text;
// // widget.infoBank.Material_Path = _materialPathController.text;
// // // Save image paths in Material_Path_List
// // // List<String> imagePaths = _selectedImages.map((image) => image.path).toList();
// // // widget.infoBank.Material_Path_List = imagePaths;
// // widget.infoBank.Android_Ver = int.tryParse(_androidVerController.text);
// // widget.infoBank.IOS_Ver = int.tryParse(_iosVerController.text);
// //
// //
// // widget.infoBank.Is_Optional = _isOptionalController.text.toLowerCase() == 'true';
// // widget.infoBank.Is_Required = _isRequiredController.text.toLowerCase() == 'true';
// // widget.infoBank.Is_Take_Time = _isTakeTimeController.text.toLowerCase() == 'true';
// // widget.infoBank.Is_ComingSoon = _isComingSoonController.text.toLowerCase() == 'true';
// // widget.infoBank.Is_For_Admin = _isForAdminController.text.toLowerCase() == 'true';
// // widget.infoBank.Is_For_SalesTeam = _isForSalesTeamController.text.toLowerCase() == 'true';
// // widget.infoBank.Is_ForOwner = _isForOwnerController.text.toLowerCase() == 'true';
// //           }); // Update the UI in real-time
// //         },
// //         keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
// //
// //         decoration: InputDecoration(
// //           labelText: label,
// //           suffixIcon: (isPicutreList==true)?IconButton(
// //             icon: const Icon(Icons.add_a_photo),
// //             onPressed: _pickImage,
// //           ):null,
// //           border: const OutlineInputBorder(),
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// //
// //

