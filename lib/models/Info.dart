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
  int? Tip_Order_Number;

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

  factory Info.fromMap(Map<String, dynamic> data) {
    final String? materialPath = data['Material_Path'] ?? "";
    final List<dynamic>? materialPathList = data['Material_Path_List'] ?? [];
    final String? tipTitle = data['Tip_Title'] ?? "";
    final String? tipSection = data['Tip_Section'] ?? "";
    final String? relatedScreen = data['Related_Screen'] ?? "";
    final String? relatedAppScreen = data['Related_App_Screen'] ?? "";
    final String? tipDescriptionIdea = data['Tip_Description_Idea'] ?? "";
    final String? tipDescriptionInfo = data['Tip_Description_Info'] ?? "";
    final String? tipMainDescription = data['Tip_Main_Description'] ?? "";
    final String? tipTechDetails = data['Tip_Tech_Details'] ?? "";
    final bool? isComingSoon = data['Is_ComingSoon'] ?? false;
    final bool? isForOwner = data['Is_ForOwner'] ?? false;
    final bool? isForAdmin = data['Is_For_Admin'] ?? false;
    final bool? isForSalesTeam = data['Is_For_SalesTeam'] ?? false;
    final bool? isTakeTime = data['Is_Take_Time'] ?? false;
    final bool? isOptional = data['Is_Optional'] ?? false;
    final bool? isRequired = data['Is_Required'] ?? false;
    final int? androidVer = data['Android_Ver'] ?? 0;
    final int? iosVer = data['IOS_Ver'] ?? 0;
    final int? tipOrderNumber = data['Tip_Order_Number'];
    final bool? isMaterialLottie = data['Is_Material_Lottie'] ?? false;
    final bool? isMaterialPicture = data['Is_Material_Picture'] ?? false;
    final bool? isMaterialYouTube = data['Is_Material_YouTube'] ?? false;
    final bool? isStepByStep = data['Is_Step_By_Step'] ?? false;
    final bool? isNew = data['Is_New'] ?? false;
    final bool? isBasic = data['Is_Basic'] ?? false;
    final bool? isFAQ = data['Is_FAQ'] ?? false;
    final bool? isOfficial = data['Is_Official'] ?? false;

    final Timestamp? date = data["Date"];

    return Info(
        date: date,
        Material_Path: materialPath,
        Material_Path_List: materialPathList,
        Tip_Title: tipTitle,
        Tip_Section: tipSection,
        Related_Screen: relatedScreen,
        Related_App_Screen: relatedAppScreen,
        Tip_Description_Idea: tipDescriptionIdea,
        Tip_Description_Info: tipDescriptionInfo,
        Tip_Main_Description: tipMainDescription,
        Tip_Tech_Details: tipTechDetails,
        Is_ComingSoon: isComingSoon,
        Is_ForOwner: isForOwner,
        Is_For_Admin: isForAdmin,
        Is_For_SalesTeam: isForSalesTeam,
        Is_Take_Time: isTakeTime,
        Is_Optional: isOptional,
        Is_Required: isRequired,
        Android_Ver: androidVer,
        IOS_Ver: iosVer,
        Tip_Order_Number: tipOrderNumber,
        Is_Material_Lottie: isMaterialLottie,
        Is_Material_Picture: isMaterialPicture,
        Is_Material_YouTube: isMaterialYouTube,
        Is_Step_By_Step: isStepByStep,
        Is_New: isNew,
        Is_Basic: isBasic,
        Is_FAQ: isFAQ,
        Is_Official: isOfficial);
  }
}
