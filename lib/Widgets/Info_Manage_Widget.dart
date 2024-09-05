import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../data/Info_Bank_Data.dart';
import '../models/Info.dart';

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
  List? _selectedImages = []; // List to store selected images
  final List<String> imageUrls = [];
  String imageUrl="";
  final ImagePicker _picker = ImagePicker();
  List<Widget> _initialImages = [];
  @override
  void initState() {
    super.initState();
    // Initialize controllers with the infoBank values
    List? initialAssetPaths = widget.infoBank.Material_Path_List;
    if (initialAssetPaths != null) {
      _initialImages = initialAssetPaths.map((path) => Image.asset(path)).toList();
    }
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
  late XFile pickedFile;
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    // Check if pickedFile is not null
    if (pickedFile != null) {
      setState(() {
        if (_selectedImages == null) {
          _selectedImages = [File(pickedFile.path)];
        } else {
          _selectedImages!.add(File(pickedFile.path));
        }
        _initialImages.add(Image.file(File(pickedFile.path)));
      });
      // Update the InfoScreen with the new image path
      widget.infoBank.Material_Path_List!.add(pickedFile.path);
    } else {
      // Handle the case where no image was picked
      print("No image selected.");
    }
  }

  Future<void> _removeImage(int index) async {
    setState(() {
      _selectedImages?.removeAt(index);
    });
  }
  final storage = FirebaseStorage.instance;
  Future<void> _saveAndUpdate() async {
    //    Reference referenceRoot = FirebaseStorage.instance.ref();
    //    Reference referenceImage=referenceRoot.child('images');
    //    String Name =DateTime.now().microsecondsSinceEpoch.toString();
    //  ///  try
    //  Reference referenceImageToUpload=referenceImage.child(Name);
    // await   referenceImageToUpload.putFile(File(pickedFile.path));
    //    imageUrl=await referenceImageToUpload.getDownloadURL();
    //    print(imageUrl);
    //    imageUrls.add(imageUrl);
    //  // Find the Info object with the title "widget.infoBank.Tip_Title"
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
      // infoToEdit.Material_Path_List = imageUrls??[];
      infoToEdit.Material_Path_List = _selectedImages?.map((image) => image.path).toList();
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
    List? initialAssetPaths=widget.infoBank.Material_Path_List;
    List<Widget> _initialImages = initialAssetPaths!.map((path) => Image.asset(path)).toList();


    void _removeImage(int index) {
      setState(() {
        _selectedImages!.removeAt(index);
      });
    }
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
          _buildTextField('Material_Path_List', _materialPathListController, isPicutreList: true),
          _selectedImages!.isEmpty
              ? const Center(child: Text('No images selected'))
              : SizedBox(
              height: 400,
              child:ReorderableListView(
                onReorder: (oldIndex, newIndex) {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  final item = _selectedImages!.removeAt(oldIndex);
                  _selectedImages!.insert(newIndex, item);
                },
                children: List.generate(_initialImages.length + _selectedImages!.length, (index) {
                  if (index < _initialImages!.length) {
                    final assetPath = initialAssetPaths![index];
                    return Dismissible(
                      key: ValueKey(assetPath),
                      onDismissed: (direction) {
                        setState(() {
                          initialAssetPaths.removeAt(index);
                          _initialImages.removeAt(index);
                        });
                      },
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(8.0),
                        leading: _initialImages[index],
                        title: Text('Image ${index + 1}'),
                      ),
                    );
                  } else {
                    final image = _selectedImages![index - _initialImages.length];
                    return Dismissible(
                      key: ValueKey(image.path),
                      onDismissed: (direction) {
                        _removeImage(index - _initialImages.length);
                      },
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(8.0),
                        leading: Image.file(
                          image,
                          height: 200,
                          width: 100,
                        ),
                        title: Text('Image ${index + 1}'),
                        trailing: IconButton(
                          icon: const Icon(Icons.remove_circle, color: Colors.red),
                          onPressed: () {
                            _removeImage(index - _initialImages.length);
                          },
                        ),
                      ),
                    );
                  }
                }),
              )


            // child: ReorderableListView(
            //   onReorder: (oldIndex, newIndex) {
            //     // Update the list of images based on the reorder
            //     if (oldIndex < newIndex) {
            //       newIndex -= 1;
            //     }
            //     final item = _selectedImages?.removeAt(oldIndex);
            //     _selectedImages?.insert(newIndex, item);
            //   },
            //   children: List.generate(_selectedImages!.length, (index) {
            //     final image = _selectedImages![index];
            //     return Dismissible(
            //       key: ValueKey(image.path), // Use unique key for each item
            //       onDismissed: (direction) {
            //         _removeImage(index);
            //       },
            //       child: Column(
            //         children: [
            //           ListTile(
            //             contentPadding: const EdgeInsets.all(8.0),
            //             leading:
            //             Image.file(
            //               image,
            //               height: 200,
            //               width: 100,
            //               //  fit: BoxFit.cover,
            //             ),
            //             title: Text('Image ${index + 1}'),
            //             trailing: IconButton(
            //               icon: const Icon(
            //                   Icons.remove_circle, color: Colors.red),
            //               onPressed: () {
            //                 _removeImage(index);
            //               },
            //             ),
            //           ),   ListTile(
            //             contentPadding: const EdgeInsets.all(8.0),
            //             leading:
            //             Image.file(
            //               image,
            //               height: 200,
            //               width: 100,
            //               //  fit: BoxFit.cover,
            //             ),
            //             title: Text('Image ${index + 1}'),
            //             trailing: IconButton(
            //               icon: const Icon(
            //                   Icons.remove_circle, color: Colors.red),
            //               onPressed: () {
            //                 _removeImage(index);
            //               },
            //             ),
            //           ),
            //         ],
            //       ),
            //     );
            //   }),
            // )
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
            widget.infoBank.Material_Path_List = _selectedImages?.map((image) => image.path).toList();
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