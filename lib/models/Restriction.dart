/// todo add a Restriction class depend on restriction parameters in the map
/// todo add 2 functions toMap and fromMap(factory)

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

  Restriction({
    required this.Short_Description,
    required this.Description,
     this.Short_Description_Ar,
     this.Description_Ar,
    required this.Role_Permission,

    this.Photo_Url,
    this.Visible,
    this. Blurred,
    this. Dev_Mode,

  });


  Map<String, dynamic> toMap({required String Material_Path}) {
    return {
      'Material_Path': Material_Path,
      'Role_Permission': Role_Permission,
      'Description': Description,
      'Short_Description_Ar': Short_Description_Ar,
      'Description_Ar': Description_Ar,
      'Photo_Url': Photo_Url,
      'Visible': Visible,
      'Blurred': Blurred,
      'Dev_Mode': Dev_Mode,
    };
  }
  factory Restriction.fromMap(Map<String, dynamic> data) {
    final String? shortDescription = data['Short_Description'];
    final String? description = data['Description'];
    final String? shortDescriptionAr = data['Short_Description_Ar'];
    final String? descriptionAr = data['Description_Ar'];
    final List<dynamic>? rolePermission = data['Role_Permission'];
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
    );
  }
}