class Restriction {
  //  details
  String? Short_Description;
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
      {this.Short_Description,
      this.Description,
      this.Short_Description_Ar,
      this.Description_Ar,
      this.Role_Permission,
      this.Allowed_Plans,
      this.Store_Type,
      this.Material_Type,
      this.Photo_Url,
      this.Visible,
      this.Blurred,
      this.Dev_Mode});

  Map<String, dynamic> toMap({required String Material_Path}) {
    return {
      "Short_Description": Short_Description,
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
    final String? shortDescription = data['Short_Description'];
    final String? description = data['Description'];
    final String? shortDescriptionAr = data['Short_Description_Ar'];
    final String? descriptionAr = data['Description_Ar'];

    final List<dynamic>? rolePermission = data['Role_Permission'];
    final List<dynamic>? Allowed_Plans = data['Allowed_Plans'];
    final List<dynamic>? Material_Type = data['Material_Type'];
    final List<dynamic>? Store_Type = data['Store_Type'];

    final String? photoUrl = data['Photo_Url'];
    final bool? visible = data['Visible'] ?? false;
    final bool? blurred = data['Blurred'] ?? false;
    final bool? devMode = data['Dev_Mode'] ?? false;

    return Restriction(
      Short_Description: shortDescription,
      Description: description,
      Short_Description_Ar: shortDescriptionAr,
      Description_Ar: descriptionAr,
      Role_Permission: rolePermission,
      Photo_Url: photoUrl,
      Visible: visible,
      Blurred: blurred,
      Dev_Mode: devMode,
      Allowed_Plans: Allowed_Plans,
      Material_Type: Material_Type,
      Store_Type: Store_Type,
    );
  }
}
