import 'package:cloud_firestore/cloud_firestore.dart';

class Info {
  Timestamp? date;

  String? Material_Path;
  List<dynamic>? Material_Path_List;
  //  details
  String? Tip_Title;
  String? Tip_Section;
  String? Related_Screen;
  String? Related_App_Screen;
  String? Tip_Description_Idea;
  String? Tip_Description_Info;
  String? Tip_Main_Description;
  String? Tip_Tech_Details;
  //status
  bool? Is_ComingSoon;
  bool? Is_ForOwner;
  bool? Is_For_Admin;
  bool? Is_For_SalesTeam;

  bool? Is_Take_Time;
  bool? Is_Optional;
  bool? Is_Required;
// version num
  int? Android_Ver;
  int? IOS_Ver;
  //order num
  String? Tip_Order_Number;

  // material
  bool? Is_Material_Lottie;
  bool? Is_Material_Picture;
  bool? Is_Material_YouTube;
// basic types
  bool? Is_Step_By_Step;
  bool? Is_New;
  // flags
  bool? Is_Basic;
  bool? Is_FAQ;
  bool? Is_Official;

  Info({
    required this.Material_Path,
    this.Material_Path_List,
    this.date,
    required this.Tip_Title,
    required this.Tip_Section,
    required this.Related_Screen,
    required this.Related_App_Screen,
    this.Tip_Description_Idea,
    this.Tip_Description_Info,
    this.Tip_Main_Description,
    this.Tip_Tech_Details,
    this.Is_ComingSoon,
    required this.Is_ForOwner,
    required this.Is_For_Admin,
    required this.Is_For_SalesTeam,
    this.Is_Take_Time,
    this.Is_Optional,
    this.Is_Required,
    required this.Android_Ver,
    required this.IOS_Ver,
    this.Tip_Order_Number,
    this.Is_Material_Lottie,
    this.Is_Material_Picture,
    this.Is_Material_YouTube,
    this.Is_Step_By_Step,
    this.Is_New,
    this.Is_Basic,
    this.Is_FAQ,
    this.Is_Official,
  });

  Map<String, dynamic> toMap({required String Material_Path}) {
    return {
      'Material_Path': Material_Path,
      'Material_Path_List': Material_Path_List,
      'Tip_Title': Tip_Title,
      'Date': date,
      'Tip_Section': Tip_Section,
      'Related_Screen': Related_Screen,
      'Related_App_Screen': Related_App_Screen,
      'Tip_Description_Idea': Tip_Description_Idea,
      'Tip_Description_Info': Tip_Description_Info,
      'Tip_Main_Description': Tip_Main_Description,
      'Tip_Tech_Details': Tip_Tech_Details,
      'Is_ComingSoon': Is_ComingSoon,
      'Is_ForOwner': Is_ForOwner,
      'Is_For_Admin': Is_For_Admin,
      'Is_For_SalesTeam': Is_For_SalesTeam,
      'Is_Take_Time': Is_Take_Time,
      'Is_Optional': Is_Optional,
      'Is_Required': Is_Required,
      'Android_Ver': Android_Ver,
      'IOS_Ver': IOS_Ver,
      'Tip_Order_Number': Tip_Order_Number,
      'Is_Material_Lottie': Is_Material_Lottie,
      'Is_Material_Picture': Is_Material_Picture,
      'Is_Material_YouTube': Is_Material_YouTube,
      'Is_Step_By_Step': Is_Step_By_Step,
      'Is_New': Is_New,
      'Is_Basic': Is_Basic,
      'Is_FAQ': Is_FAQ,
      'Is_Official': Is_Official,
    };
  }