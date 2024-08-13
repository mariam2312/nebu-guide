class Restriction {
  //  details
  String? Short_Description;  String? Title;
  String? Description;
  String? Short_Description_Ar;
  String? Description_Ar;
  List<dynamic>? Role_Permission;
  List<dynamic>? Allowed_Plans;
  List<dynamic>? Store_Type;
  List<dynamic>? Material_Type;
  String? Photo_Url;
  bool? Visible;
  bool? Blurred;
  bool? Dev_Mode;

  Restriction(
      {required this.Short_Description,required this.Title,
      this.Description,
      this.Short_Description_Ar,
      this.Description_Ar,
      this.Role_Permission,
        required  this.Allowed_Plans,
      this.Store_Type,
      this.Material_Type,
      this.Photo_Url,
      this.Visible,
      this.Blurred,
      this.Dev_Mode});

  Map<String, dynamic> toMap({required String Path}) {
    return {
      "Short_Description": Short_Description,"Title": Title,
      "Description": Description,
      "Short_Description_Ar": Short_Description_Ar,
      "Description_Ar": Description_Ar,
      "Role_Permission": Role_Permission,
      "Allowed_Plans": Allowed_Plans,
      "Store_Type": Store_Type,
      "Material_Type": Material_Type,
      "Photo_Url": Photo_Url,
      "Visible": Visible,
      "Blurred": Blurred,
      "Dev_Mode": Dev_Mode,
    };
  }

  factory Restriction.fromMap(Map<String, dynamic> data) {
    final String? Short_Description = data['Short_Description']??"";final String? Title = data['Title']??"";
    final String? Description = data['Description']??"";
    final String? Short_Description_Ar = data['Short_Description_Ar']??"";
    final String? Description_Ar = data['Description_Ar']??"";

    final List<dynamic>? Role_Permission = data['Role_Permission']??[];
    final List<dynamic>? Allowed_Plans = data['Allowed_Plans']??[];
    final List<dynamic>? Material_Type = data['Material_Type']??[];
    final List<dynamic>? Store_Type = data['Store_Type']??[];

    final String? Photo_Url = data['Photo_Url']??"";
    final bool? Visible = data['Visible'] ?? false;
    final bool? Blurred = data['Blurred'] ?? false;
    final bool? Dev_Mode = data['Dev_Mode'] ?? false;

    return Restriction(
      Short_Description: Short_Description,Title: Title,
      Description: Description,
      Short_Description_Ar: Short_Description_Ar,
      Description_Ar: Description_Ar,
      Role_Permission: Role_Permission,
      Photo_Url: Photo_Url,
      Visible: Visible,
      Blurred: Blurred,
      Dev_Mode: Dev_Mode,
      Allowed_Plans: Allowed_Plans,
      Material_Type: Material_Type,
      Store_Type: Store_Type,
    );
  }
}
