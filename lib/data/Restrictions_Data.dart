import '../models/Restriction.dart';

var RestrictionsData = {
  "Short_Description": "Navigation To System Migration ",
  "Description": "To go to the migration from an old system to save the codes",
  "Short_Description_Ar": " لتسجيل الاكواد بالنظام السابق الي النظام الجديد ",
  "Description_Ar": " الذهاب الي تسجيل النظام السابق ",
  "Role_Permission": [
    "Owner",
    "Manager",
    "Purchaser",
    "Accountant",
  ],
  "Allowed_Plans": ["basic", "pro", "vip"],
  "Store_Type": [
    "Retail",
  ],
  "Material_Type": ["Gold_Silver", "Gold", "Silver"],
  "Photo_Url": "",
  "Visible": true,
  "Blurred": true,
  "Dev_Mode": false,
};


Restriction R1 =  Restriction(
  Allowed_Plans:  ["basic", "pro", "vip"] ,
  Short_Description: "Navigation To System Migration " ,
  Blurred: true ,
  Description: "To go to the migration from an old system to save the codes" ,
  Description_Ar: " الذهاب الي تسجيل النظام السابق ",
  Dev_Mode: false,
  Material_Type:  ["Gold_Silver", "Gold", "Silver"],
  Photo_Url: "" ,
  Role_Permission: [
    "Owner",
    "Manager",
    "Purchaser",
    "Accountant",
  ],
  Short_Description_Ar:  "لتسجيل الاكواد بالنظام السابق الي النظام الجديد"  ,
  Store_Type: [
    "Retail",
  ] ,
  Visible:true,
);

