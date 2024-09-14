
import 'dart:io';
import 'dart:ui';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extended_image/extended_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_editor/image_editor.dart';
import 'package:line_icons/line_icon.dart';
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
  List<File> _selectedImages =[];
  final List<String> imageUrls = [];
  // late  XFile pickedFile;
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
      final List<XFile> pickedImages = await _picker.pickMultiImage();
      setState(() {
        _selectedImages.addAll(pickedImages.map((e) => File(e.path)));
        widget.infoBank.Material_Path_List?.addAll(_selectedImages);
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error picking images: $e');
      }
    }
  }

  void _removeImage(int index) {
    setState(() {
      widget.infoBank.Material_Path_List!.removeAt(index);
    });
  }

  Future<void> _saveAndUpdate() async {
    String name = DateTime.now().millisecondsSinceEpoch.toString();
    // final storage = FirebaseStorage.instance;
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceImage = referenceRoot.child('images/$name');
    try {
      for (var image in _selectedImages) {
        UploadTask uploadTask = referenceImage.putFile(File(image.path));
        TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
        String imageUrl = await taskSnapshot.ref.getDownloadURL();
        // var uploadTask = referenceImage.putFile(image);
        // var downloadUrl = await (await uploadTask).ref.getDownloadURL();
      //  Reference referenceImageToUpload = referenceImage.child(name);
      //  await referenceImageToUpload.putFile(_selectedImages[index]);
        //imageUrl = await referenceImageToUpload.getDownloadURL();
        if (kDebugMode) {
          print(imageUrl);
        }
        imageUrls.add(imageUrl);
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error uploading image: $e');
      }
    }

    // Reference referenceRoot = FirebaseStorage.instance.ref();
    // Reference referenceImage = referenceRoot.child('images');
    // String Name = DateTime.now().microsecondsSinceEpoch.toString();
    // Reference referenceImageToUpload = referenceImage.child(Name);
    // await referenceImageToUpload.putFile(File(pickedFile.path));
    // imageUrl = await referenceImageToUpload.getDownloadURL();
    // print(imageUrl);
    // imageUrls.add(imageUrl);
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
      infoToEdit.Android_Ver = int.tryParse(_androidVerController.text);
      infoToEdit.IOS_Ver = int.tryParse(_iosVerController.text);
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
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.infoBank.Tip_Title ?? 'Info Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              // if (_formKey.currentState!.validate()) {
              _saveAndUpdate();
              //   }}
            })
        ],
      ),
      body: Form(
        child: ListView(   key: _formKey,
          padding: const EdgeInsets.all(16.0),
          children: [
            _buildTextField('Tip_Title', _titleController),
            _buildTextField('Tip_Section', _sectionController),
            _buildTextField('Related_Screen', _relatedScreenController),
            _buildTextField('Tip_Order_Number', _orderNumberController,isNumeric: true),
            _buildTextField('Tip_Main_Description', _mainDescriptionController),
            _buildTextField('Tip_Description_Idea', _descriptionIdeaController),
            _buildTextField('Tip_Description_Info', _descriptionInfoController),
            _buildTextField('Tip_Tech_Details', _techDetailsController),
            _buildTextField('Is_Basic', _isBasicController,isbool:true),
            _buildTextField('Is_New', _isNewController,isbool:true),
            _buildTextField('Is_FAQ', _isFAQController,isbool:true),
            _buildTextField('Is_Official', _isOfficialController,isbool:true),
            _buildTextField('Is_Step_By_Step', _isStepByStepController,isbool:true),
            _buildTextField('Is_Material_Lottie', _isMaterialLottieController,isbool:true),
            _buildTextField(
              'Is_Material_Picture', _isMaterialPictureController,isbool:true),
            _buildTextField(
              'Is_Material_YouTube', _isMaterialYouTubeController,isbool:true),
            _buildTextField('Related_App_Screen', _relatedAppScreenController),
            _buildTextField('Material_Path', _materialPathController),
            _buildTextField('Material_Path_List', _materialPathListController,
                isPicutreList: true),
            widget.infoBank.Material_Path_List!.isEmpty
                ? const Center(child: Text('No images selected'))
                : SizedBox(
                height: 400,

           child:ReorderableListView(
             onReorder: (oldIndex, newIndex) {
               // Update the list of images based on the reorder
               if (oldIndex < newIndex) {
                 newIndex -= 1;
               }
               setState(() {
                 final item = widget.infoBank.Material_Path_List!.removeAt(oldIndex);
                 widget.infoBank.Material_Path_List!.insert(newIndex, item);
               });
             },
             children: List.generate(widget.infoBank.Material_Path_List!.length, (index) {
               final image = widget.infoBank.Material_Path_List![index];
               return Dismissible(
                 key: ValueKey(image), // Use unique key for each item
                 onDismissed: (direction) {
                   _removeImage(index);
                 },
                 child: ListTile(
                   contentPadding: const EdgeInsets.all(8.0),
                   leading: image is String
                       ? image.startsWith('assets/')
                       ? Image.asset(image)
                       : Image.file(File(image),  height: 200, // Add a height to resize the image
                     width: 100,)
                       :  Image.file(image as File,   height: 200, // Add a height to resize the image
                     width: 100,),
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
            _buildTextField('Is_Optional', _isOptionalController,isbool:true),
            _buildTextField('Is_Required', _isRequiredController,isbool:true),
            _buildTextField('Is_Take_Time', _isTakeTimeController,isbool:true),
            _buildTextField('Is_ComingSoon', _isComingSoonController,isbool:true),
            _buildTextField('Is_For_Admin', _isForAdminController,isbool:true),
            _buildTextField('Is_For_SalesTeam', _isForSalesTeamController,isbool:true),
            _buildTextField('Is_ForOwner', _isForOwnerController,isbool:true),
          ],
        ),
      ),
    );
  }
  Widget _buildTextField(String label, TextEditingController controller, {bool isNumeric = false,bool isPicutreList = false,bool isbool=false}) {
    if (isbool) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Text(label),
            const Spacer(),
            Row(
              children: [
                Text(' ${controller.text.toLowerCase() == 'true' ? 'True' : 'False'}'),
                Switch(
                  value: controller.text.toLowerCase() == 'true',
                  onChanged: (bool value) {
                    setState(() {
                      controller.text = value.toString();
                    });
                  },
                ),

              ],
            ),
          ],
        ),
      );
    } else { return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        readOnly: isPicutreList,
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a value';
          }
          return null;
        },
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
    );}
  }

}


class ImageEdit {
  final MemoryImageSource imageSource;
  final int x;
  final int y;

  ImageEdit(this.imageSource, this.x, this.y);
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
  late TextEditingController _androidVerController ;
  late TextEditingController _iosVerController;
  late TextEditingController _isOptionalController;
  late TextEditingController _isRequiredController;
  late TextEditingController _isTakeTimeController;
  late TextEditingController _isComingSoonController;
  late TextEditingController _isForAdminController;
  late TextEditingController _isForSalesTeamController;
  late TextEditingController _isForOwnerController;
  late   List<File> _selectedImages = []; // List to store selected images
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
  Future<void> _pickImages() async {
    try {
      final List<XFile> pickedImages = await _picker.pickMultiImage();
      setState(() {
        _selectedImages.addAll(pickedImages.map((e) => File(e.path)));
        widget.infoBank.Material_Path_List?.addAll(pickedImages.map((e) => e.path).toList());
        print( _selectedImages);    print( widget.infoBank.Material_Path_List);

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
      // Material_Path_List: imageUrls??[],
      Material_Path_List: widget.infoBank.Material_Path_List??[],
  Android_Ver: int.tryParse(_androidVerController.text),
IOS_Ver: int.tryParse(_iosVerController.text),
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
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.infoBank.Tip_Title ?? 'Info Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _saveAndUpdate();
              }
            },
          ),
        ],
      ),
      body: Form(    key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _buildTextField('Tip_Title', _titleController),
            _buildTextField('Tip_Section', _sectionController),
            _buildTextField('Related_Screen', _relatedScreenController),
            _buildTextField('Tip_Order_Number', _orderNumberController,isNumeric: true),
            _buildTextField('Tip_Main_Description', _mainDescriptionController),
            _buildTextField('Tip_Description_Idea', _descriptionIdeaController),
            _buildTextField('Tip_Description_Info', _descriptionInfoController),
            _buildTextField('Tip_Tech_Details', _techDetailsController),
            _buildTextField('Is_Basic', _isBasicController,isbool:true),
            _buildTextField('Is_New', _isNewController,isbool:true),
            _buildTextField('Is_FAQ', _isFAQController,isbool:true),
            _buildTextField('Is_Official', _isOfficialController,isbool:true),
            _buildTextField('Is_Step_By_Step', _isStepByStepController,isbool:true),
            _buildTextField('Is_Material_Lottie', _isMaterialLottieController,isbool:true),
            _buildTextField(
              'Is_Material_Picture', _isMaterialPictureController,isbool:true),
            _buildTextField(
              'Is_Material_YouTube', _isMaterialYouTubeController,isbool:true),
            _buildTextField('Related_App_Screen', _relatedAppScreenController),
            _buildTextField('Material_Path', _materialPathController),
            _buildTextField('Material_Path_List', _materialPathListController, isPicutreList: true),
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
                    setState(() {
                      final item = _selectedImages.removeAt(oldIndex);
                      _selectedImages.insert(newIndex, item);
                    });

                  },
                  children: List.generate(_selectedImages.length, (index) {
                    final image =_selectedImages[index];
                    return Dismissible(
                      key: ValueKey(image), // Use unique key for each item
                      onDismissed: (direction) {
                        _removeImage(index);
                      },
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(8.0),
                        leading: GestureDetector(
                          onTap: () async {
                            final editedImage = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ImageEditorScreen(
                                        image: _selectedImages[index]),
                              ),
                            );

                            if (editedImage != null) {
                              setState(() {
                                _selectedImages[index] = editedImage;
                              });
                            }
                          },
    child: Image.file(
                            image,
                            height: 200,
                            width: 100,
                            //  fit: BoxFit.cover,
                          ),
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
            _buildTextField('Android_Ver', _androidVerController, isNumeric: true),
            _buildTextField('IOS_Ver', _iosVerController, isNumeric: true),
            _buildTextField('Is_Optional', _isOptionalController,isbool:true),
            _buildTextField('Is_Required', _isRequiredController,isbool:true),
            _buildTextField('Is_Take_Time', _isTakeTimeController,isbool:true),
            _buildTextField('Is_ComingSoon', _isComingSoonController,isbool:true),
            _buildTextField('Is_For_Admin', _isForAdminController,isbool:true),
            _buildTextField('Is_For_SalesTeam', _isForSalesTeamController,isbool:true),
            _buildTextField('Is_ForOwner', _isForOwnerController,isbool:true),
          ],
        ),
      ),
    );
  }
  Widget _buildTextField(String label, TextEditingController controller, {bool isNumeric = false,bool isPicutreList = false,bool isbool=false}) {
    if (isbool) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Text(label),
            const Spacer(),
            Row(
              children: [
                Text(' ${controller.text.toLowerCase() == 'true' ? 'True' : 'False'}'),
                Switch(
                  value: controller.text.toLowerCase() == 'true',
                  onChanged: (bool value) {
                    setState(() {
                      controller.text = value.toString();
                    });
                  },
                ),

              ],
            ),
          ],
        ),
      );
    } else
    { return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        readOnly: isPicutreList,
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a value';
          }
          return null;
        },
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
            List<String> imagePaths = _selectedImages.map((image) => image.path).toList();
            widget.infoBank.Material_Path_List = imagePaths.isEmpty ? [] : imagePaths;
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
          suffixIcon: (isPicutreList==true)?Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.add_a_photo),
                onPressed: _pickImages,
              ),
            ],
          ):null,
          border: const OutlineInputBorder(),
        ),
      ),
    );}
  }
}


class ImageEditorScreen extends StatefulWidget {
   final File image;

  const ImageEditorScreen({required this.image});

  @override
  _ImageEditorScreenState createState() => _ImageEditorScreenState(image: image);
}
class _ImageEditorScreenState extends State<ImageEditorScreen> {
  File image;
  File? originalImage; // Declare _originalImage
  List<ImageEdit> mixedImages = []; // List to keep track of mixed images
  int xMix = 0;
  int yMix = 0;
  final xMixController = TextEditingController();
  final yMixController = TextEditingController();
  int xClip = 0;
  int yClip = 0;
  double xRect = 0;
  double yRect = 0;
  int widthClip = 100;
  int heightClip = 100;
  double widthRect = 100;
  double heightRect = 100;
  final xRectController = TextEditingController();
  final yRectController = TextEditingController();
  final widthRectController = TextEditingController();
  final heightRectController = TextEditingController();
  final GlobalKey<ExtendedImageEditorState> editorKey = GlobalKey();

  _ImageEditorScreenState({required this.image}) {
    originalImage = image; // Initialize _originalImage with the original image
  }

  Future<Uint8List> _loadImageFromAsset(String path) async {
    final byteData = await rootBundle.load(path);
    return byteData.buffer.asUint8List();
  }

  Future<void> addMixImage() async {
    final srcBytes = await _loadImageFromAsset('assets/hand2.png');
    final dstBytes = await originalImage!.readAsBytes();
    final src = MemoryImageSource(srcBytes);

    final optionGroup = ImageEditorOption();
    optionGroup.outputFormat = const OutputFormat.png();
    optionGroup.addOption(
      MixImageOption(
        x: xMix,
        y: yMix,
        width: 150,
        height: 150,
        target: src,
        blendMode: BlendMode.lighten,
      ),
    );

    final result = await ImageEditor.editImageAndGetFile(image: dstBytes, imageEditorOption: optionGroup);

    if (result != null) {
      setState(() {
        image = result;
        mixedImages.clear();

     mixedImages.add(ImageEdit(src, xMix, yMix)); // Add new image edit
        print(mixedImages);
      });
    }
  }

  void _deleteLastMixedImage() async {
      if (mixedImages.isNotEmpty) {
        mixedImages.removeLast(); // Remove the last draw part
        final dstBytes = await originalImage!.readAsBytes();
        final optionGroup = ImageEditorOption();
        optionGroup.outputFormat = const OutputFormat.png();

        for (var edit in mixedImages) {
          optionGroup.addOption(
            MixImageOption(
              x: edit.x,
              y: edit.y,
              width: 150,
              height: 150,
              target: edit.imageSource,
              blendMode: BlendMode.lighten,
            ),
          );
        }


        final result = await ImageEditor.editImageAndGetFile(
          image: dstBytes,
          imageEditorOption: optionGroup,
        );
        if (result != null) {
          setState(() {
            image = result;
          });
        }
      }
    }

  void _deleteAllMixedImages() async {

      mixedImages.clear();
      final dstBytes = await originalImage!.readAsBytes();
      final optionGroup = ImageEditorOption();
      optionGroup.outputFormat = const OutputFormat.png();

      for (var edit in mixedImages) {
        optionGroup.addOption(
          MixImageOption(
            x: edit.x,
            y: edit.y,
            width: 150,
            height: 150,
            target: edit.imageSource,
            blendMode: BlendMode.lighten,
          ),
        );
      }

      final result = await ImageEditor.editImageAndGetFile(
        image: dstBytes,
        imageEditorOption: optionGroup,
      );

      if (result != null) {
        setState(() {
          image = result;
        });
      }

  }


  void originImage() async {
    setState(() {
      image = originalImage!; // Reset the image to its original state
    });
  }
  Widget buildSlider(
      String title, {
        int min = 0,
        int max = 1920,
        required ValueChanged<int> onChanged,
        required int value,
      }) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Slider(
            onChanged: (double value) {
              setState(() {
                onChanged.call(value.toInt());
              });
            },
            value: value.toDouble(),
            min: min.toDouble(),
            max: max.toDouble(),
            label: title,
          ),
        ),
        SizedBox(
          width: 50,
          child: Text('$title:$value'),
        ),
      ],
    );
  }
  void clip() async{
    final optionGroup = ImageEditorOption();
    final dstBytes = await originalImage!.readAsBytes();
    optionGroup.addOption(ClipOption(
      x: xClip,
      y: yClip,
      width: widthClip,
      height: heightClip,
    ));
    final result = await ImageEditor.editImageAndGetFile(
      image: dstBytes,
  imageEditorOption: optionGroup,
    );

    if (result != null) {
      setState(() {
        image = result;
      });
    }

  }
  List<DrawPart> _drawParts = [];
  void addRect() async {
    // Add the rectangle to the image
    final optionGroup = ImageEditorOption();
    final dstBytes = await originalImage!.readAsBytes();

    final drawPart = RectDrawPart(
      paint:  DrawPaint(
        lineWeight: 5,
        paintingStyle: PaintingStyle.fill,
        color: Colors.red.withOpacity(0.5),
      ),
      rect: Rect.fromPoints(
        Offset(xRect, yRect),
        Offset(xRect + widthRect, yRect + heightRect),
      ),
    );

    _drawParts.add(drawPart); // Add the draw part to the list

    final drawOption = DrawOption();
    for (var part in _drawParts) {
      drawOption.addDrawPart(part); // Add all draw parts to the draw option
    }

    optionGroup.addOption(drawOption);

    final result = await ImageEditor.editImageAndGetFile(
      image: dstBytes,
      imageEditorOption: optionGroup,
    );

    if (result != null) {
      setState(() {
        image = result;
      });
    }
  }
  void _deleteLastRec() async {
    if (_drawParts.isNotEmpty) {
      _drawParts.removeLast(); // Remove the last draw part
      final optionGroup = ImageEditorOption();
      final dstBytes = await originalImage!.readAsBytes();
      final drawOption = DrawOption();
      for (var part in _drawParts) {
        drawOption.addDrawPart(part); // Add all draw parts to the draw option
      }
      optionGroup.addOption(drawOption);
      final result = await ImageEditor.editImageAndGetFile(
        image: dstBytes,
        imageEditorOption: optionGroup,
      );
      if (result != null) {
        setState(() {
          image = result;
        });
      }
    }
  }

  void _deleteAllRec() async {
    _drawParts.clear(); // Clear the draw parts list

    final optionGroup = ImageEditorOption();
    final dstBytes = await originalImage!.readAsBytes();

    final drawOption = DrawOption();

    optionGroup.addOption(drawOption);

    final result = await ImageEditor.editImageAndGetFile(
      image: dstBytes,
      imageEditorOption: optionGroup,
    );

    if (result != null) {
      setState(() {
        image = result;
      });
    }

  }
  void ClipRectFun() async {
    final ExtendedImageEditorState? state = editorKey.currentState;
    if (state == null) {
      return;
    }
    final Rect? rect = state.getCropRect();

    final ImageEditorOption option = ImageEditorOption();

    option.addOption(ClipOption.fromRect(rect!));
    final  img = state.rawImageData;
    final result = await ImageEditor.editImageAndGetFile(
      image: img,
      imageEditorOption: option,
    );

    if (result != null) {
      setState(() {
        image = result;
      });
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Editor'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check, size: 40),
            onPressed: () async {

              Navigator.pop(context, image); // Return the edited image
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          // Image.file(image),
          ClipRect(
            child: ExtendedImage(
              image: ExtendedFileImageProvider(File(image.path), cacheRawData: true),
              height: 400,
              width: 400,
              extendedImageEditorKey: editorKey,
              mode: ExtendedImageMode.editor,
              fit: BoxFit.contain,
              initEditorConfigHandler: (_) => EditorConfig(
                maxScale: 8.0,
                cropRectPadding: const EdgeInsets.all(20.0),
                hitTestSize: 20.0,

              ),
            ),
          ),
          ElevatedButton(
            onPressed: originImage,
            child: const Text('origin image'),
          ),
          ElevatedButton(
            onPressed: ClipRectFun,
            child: const Text('ClipRect'),
          ),
          ElevatedButton(
            child: const Text('Mix Image'),
            onPressed: addMixImage,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: xMixController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'X',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      // Handle parsing errors
                      setState(() {
                        xMix = int.tryParse(value) ?? 0;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(width: 20), // Adding space between fields
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: yMixController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Y',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      // Handle parsing errors
                      setState(() {
                        yMix = int.tryParse(value) ?? 0;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('X: $xMix'),
              Text('Y: $yMix'),
            ],
          )

          ,ElevatedButton(
            child: const Text('Delete Last Mixed Image'),
            onPressed: _deleteLastMixedImage,
          ),
          ElevatedButton(
            child: const Text('Delete All Mixed Images'),
            onPressed: _deleteAllMixedImages,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: xRectController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'X',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      // Handle parsing errors
                      setState(() {
                        xRect = double.tryParse(value) ?? 0;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(width: 20), // Adding space between fields
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: yRectController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Y',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      // Handle parsing errors
                      setState(() {
                        yRect = double.tryParse(value) ?? 0;
                      });
                    },
                  ),
                ),
              ),const SizedBox(width: 20), // Adding space between fields
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: widthRectController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'w',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      // Handle parsing errors
                      setState(() {
                        widthRect = double.tryParse(value) ?? 0;
                      });
                    },
                  ),
                ),
              ),const SizedBox(width: 20), // Adding space between fields
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: heightRectController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'h',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      // Handle parsing errors
                      setState(() {
                        heightRect = double.tryParse(value) ?? 0;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('X: $xRect'),
              Text('Y: $yRect'),  Text('w: $widthRect'),
              Text('h: $heightRect'),
            ],
          ),
          ElevatedButton(
            onPressed: addRect,
            child: const Text('add rect'),
          ),
        ElevatedButton(
    child: const Text('Delete Last Rec'),
    onPressed: _deleteLastRec,
    ),
    ElevatedButton(
    child: const Text('Delete all Rec'),
    onPressed: _deleteAllRec,
    ),
          Column(
            children: <Widget>[
              buildSlider('x', onChanged: (int v) => xClip = v, value: xClip),
              buildSlider('y', onChanged: (int v) => yClip = v, value: yClip),
              buildSlider('width',
                  onChanged: (int v) => widthClip = v, value: widthClip, min: 1),
              buildSlider('height',
                  onChanged: (int v) => heightClip = v, value: heightClip, min: 1),
              TextButton(
                child: const Text('clip'),
                onPressed: clip,
              ),
            ],
          ),

        ],
      ),
    );
  }
}
