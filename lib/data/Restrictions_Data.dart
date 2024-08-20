// var RestrictionsData = {
//   "NavigateToRegisterOldSystemWidget":{
//     "Short_Description": " Navigation To System Migration ",
//     "Description": "To go to the migration from an old system to save the codes",
//     "Short_Description_Ar":" لتسجيل الاكواد بالنظام السابق الي النظام الجديد ",
//     "Description_Ar": " الذهاب الي تسجيل النظام السابق ",
//     "Role_Permission": [
//       "Owner",
//       "Manager",
//       "Purchaser",
//       "Accountant",
//     ],
//     "Allowed_Plans": ["basic", "pro", "vip"],
//     "Store_Type": ["Retail",],
//     "Material_Type": ["Gold_Silver" ,"Gold", "Silver"],
//     "Photo_Url": "",
//     "Visible": true,
//     "Blurred": true,
//     "Dev_Mode": false,
//   },
//
//   "GoldSilverMaterialSwitchWidget": {
//     "Short_Description": " Main Material Switch ",
//     "Description": " To Choose the main material , to start sell and buy  ",
//     "Short_Description_Ar":
//     " يمكنك من اختيار الخام المناسب للعمليات الاساسية مثل البيع و الشراء ",
//     "Description_Ar": " اختيار الخام ",
//     "Role_Permission": [
//       "Owner",
//       "Admin",
//       "Manager",
//       "Supervisor",
//       "Purchaser",
//       "Salesman",
//       "Marketeer"
//     ],
//     "Allowed_Plans": ["basic", "pro", "vip"],
//     "Store_Type": ["Retail", "Wholesale", "HalfRetail", "GoldTrader"],
//     "Material_Type": ["Gold_Silver"],
//     "Photo_Url": "",
//     "Visible": false,
//     "Blurred": true,
//     "Dev_Mode": false,      },
//
//
//   "photoReference": {
//     "Short_Description": "Photo Reference For Operations",
//     "Description": "Photo Reference For Operations",
//     "Short_Description_Ar": "صور مرجعية لكل العمليات.",
//     "Description_Ar": "صور مرجعية لكل العمليات.",
//     "Role_Permission": [
//       "Owner",
//       "Manager",
//       "Purchaser",
//       "Accountant",
//     ],
//     "Allowed_Plans": ["basic", "pro", "vip"],
//     "Store_Type": ["Retail", "Wholesale", "HalfRetail", "GoldTrader"],
//     "Material_Type": ["Gold_Silver", "Gold", "Silver"],
//     "Photo_Url": "",
//     "Visible": true,
//     "Blurred": true,
//     "Dev_Mode": false,
//   }
// };

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/Restriction.dart';

List<Restriction> restrictions = [
  //invoices
  Restriction(
    Short_Description: "invoices everyday",
    Description: "Includes all invoices throughout the day",
    Short_Description_Ar: "الفواتير اليومية",
    Description_Ar: "تشمل كل الفواتير علي مدار اليوم ",
    Role_Permission: [
      "Owner",
      "Admin",
      "Manager",
      "Accountant",
    ],
      Allowed_Plans: ["basic", "pro", "vip"],

      Store_Type: ["Retail", "Wholesale", "HalfRetail", "GoldTrader"],
    Material_Type: ["Gold", "Silver", "Gold_Silver"],
    Photo_Url: "",
    Visible: true,
    Blurred: true, Title: 'فواتير اليوم', date:Timestamp.fromDate(DateTime.now())
  ),
  Restriction(
      Short_Description: "review of tax invoices",
      Description: "Includes all tax invoices throughout the day",
      Short_Description_Ar: "مراجعة الفواتير الضريبية",
      Description_Ar:" مراجعة الفواتير الضريبية وارسالها لمصلحة الضرائب ",
      Role_Permission: [
        "Owner",
        "Admin",
        "Manager",
        "Accountant",
      ],
      Allowed_Plans: ["basic", "pro", "vip"],

      Store_Type: ["Retail", "Wholesale", "HalfRetail", "GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url: "",
      Visible: true,
      Blurred: true, Title: 'مراجعة الفواتير الضريبية', date:Timestamp.fromDate(DateTime.now())
  ),
  Restriction(
      Short_Description: " tax invoices",
      Description: " tax invoices throughout the day",
      Short_Description_Ar: "فواتير مصلحة الضرايب",
      Description_Ar:
      " تحتوي علي الفواتير الضريبية الخاصة بمصلحة الضرائب ",
      Role_Permission: [
        "Owner",
        "Admin",
        "Manager",
        "Accountant",
      ],
      Allowed_Plans: [ "pro", "vip"],

      Store_Type: ["Retail", "Wholesale", "HalfRetail", "GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url: "",
      Visible: true,
      Blurred: true, Title: 'فواتير مصلحة الضرايب', date:Timestamp.fromDate(DateTime.now())

  ),

  //reports
  Restriction(
      Short_Description: "Including all reports of main operations ",
      Description: "Including all sales, purchases,cash flow and scrap flow ",
      Short_Description_Ar: "تتضمن تقاير للعمليات ",
      Description_Ar: "تتضمن تقاير للمبيعات والمشتريات وبدل الكسر وحركة النقدية وتكاليف البضاعة والفواتير وتكاليف البضاعة",
      Role_Permission: [
        "Owner",
        "Admin",
        "Manager",
        "Accountant",
        "Supervisor",
        "Purchaser",
      ],
      Allowed_Plans: ["basic", "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail", "GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'تقارير العمليات',
      date:Timestamp.fromDate(DateTime.now())



  ),
  Restriction(
      Short_Description: "sales reports",
      Description: "Including all reports of sales",
      Short_Description_Ar: "تتضمن كل تقارير المبيعات ",
      Description_Ar:
      "تتضمن جميع تقارير المبيعات ",
      Role_Permission: [
        "Owner",
        "Admin",
        "Manager",
        "Accountant",
        "Supervisor",

      ],
      Allowed_Plans: ["basic", "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail", "GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'تقارير المبيعات',
      date:Timestamp.fromDate(DateTime.now())



  ),
  Restriction(
      Short_Description: "Reports of Scrap exchange ",
      Description: "Including reports of all scrap that entering while making saless",
      Short_Description_Ar: "تقارير التي تضمن كل عمليات دخول الكسر عند القيام بعملية بيع معه",
      Description_Ar:
      "تقارير التي تتضمن كل عمليات دخول الكسر عند القيام بعملية بيع معه",
      Role_Permission: [
        "Owner",
        "Admin",
        "Manager",
        "Accountant",
        "Supervisor",

      ],
      Allowed_Plans: ["basic", "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail", "GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'تقارير بدل الكسر',
      date:Timestamp.fromDate(DateTime.now())



  ),
  Restriction(
      Short_Description: "Including all reports of purchases",
      Description: " Including all reports of purchases ",
      Short_Description_Ar: "تقارير التي تتضمن كل عمليات الشراء",
      Description_Ar: "تقارير التي تتضمن كل عمليات الشراء",
      Role_Permission: [
        "Owner",
        "Admin",
        "Manager",
        "Accountant",
        "Supervisor",

      ],
      Allowed_Plans: ["basic", "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail", "GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'تقارير المشتريات',
      date:Timestamp.fromDate(DateTime.now())



  ),
  Restriction(
      Short_Description: "Including all reports of  transactions of cash",
      Description: "  Including all reports of  entering and exiting of cash ",
      Short_Description_Ar: "تتضمن كل تقارير عمليات الخاصة بالنقدية",
      Description_Ar:
      "تتضمن تقارير كل عمليات دخول وخروج النقدية",
      Role_Permission: [
        "Owner",
        "Admin",
        "Manager",
        "Accountant",
        "Supervisor",
        "Purchaser",

      ],
      Allowed_Plans: ["basic", "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail", "GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'تقرير حركة النقدية',
      date:Timestamp.fromDate(DateTime.now())



  ),
  Restriction(
      Short_Description: "Including all reports of transactions of scrap",
      Description: "  Including all reports of entering and exiting of scrap ",
      Short_Description_Ar: "تتضمن كل تقارير للعمليات الخاصة بالكسر",
      Description_Ar:
      "تتضمن كل تقارير للعمليات دخول وخروج الكسر",
      Role_Permission: [
        "Owner",
        "Admin",
        "Manager",
        "Accountant",
        "Supervisor",
        "Purchaser",

      ],
      Allowed_Plans: ["basic", "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail", "GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: true,
      Title: 'تقرير حركة الكسر',
      date:Timestamp.fromDate(DateTime.now())



  ),
  Restriction(
      Short_Description: "Including all reports of transactions of goods",
      Description: "  Including reports of entering and exiting of goods ",
      Short_Description_Ar: "تتضمن كل عمليات الخاصة بالبضاعة",
      Description_Ar:
      "تتضمن كل عمليات دخول وخروج البضاعة",
      Role_Permission: [
        "Owner",
        "Admin",
        "Manager",
        "Accountant",
        "Supervisor",
        "Purchaser",

      ],
      Allowed_Plans: ["basic", "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail", "GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: true,
      Title: 'تقرير حركة البضاعة',
      date:Timestamp.fromDate(DateTime.now())



  ),
  Restriction(

      Short_Description: "reports contain more details about inventory of goods",
      Description: "reports contain more details about inventory of goods ",
      Short_Description_Ar: "تقارير الجرد",
      Description_Ar:
      "تقارير التي تحتوي علي تفاصيل بعمليات جرد البضاعة",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Purchaser",
      ],
      Allowed_Plans: ["basic", "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail", "GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: true,
      Title: 'تقارير الجرد'

      ,
      date:Timestamp.fromDate(DateTime.now())

  ),
  Restriction(
      Short_Description: "Including reports of costs of goods",
      Description: "  Including reports of costs of goods ",
      Short_Description_Ar: " تقارير عن تكاليف البضاعة",
      Description_Ar:
      "تقارير التي تتضمن كل التكاليف الخاصة بالبضاعة ",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Purchaser",
      ],
      Allowed_Plans: ["basic", "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail", "GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: ' تقارير تكاليف البضاعة'
      ,
      date:Timestamp.fromDate(DateTime.now())


  ),
  Restriction(
      Short_Description: "Including reports of scrap keeping for each seller seperately",
      Description: "Including reports of scrap keeping for each seller seperately ",
      Short_Description_Ar: "تقارير عهدة الكسر",
      Description_Ar:
      "تقارير التي تتضمن عهدة الكسر للبائعين كل بائع علي حدا   ",
      Role_Permission: [
        "Owner",
        "Admin",
        "Manager",
      ],
      Allowed_Plans: [ "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail", "GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: true,
      Title: 'تقارير عهدة الكسر'
      ,
      date:Timestamp.fromDate(DateTime.now())


  ),
  Restriction(
      Short_Description: "Including reports of transactions of gold with goldtraders",
      Description: "  Including reports of transactions of gold with goldtraders ",
      Short_Description_Ar: "تقارير قطع الذهب",
      Description_Ar:
      "تقاريرالتي يتضمن جميع حركات قطع الذهب مع المسوئجية ",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Purchaser",
      ],
      Allowed_Plans: ["basic", "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail", "GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: true,
      Title: 'تقارير قطع الذهب'
      ,
      date:Timestamp.fromDate(DateTime.now())


  ),
  Restriction(
      Short_Description: "Including reports of the flow of gold bars specially in goldtrader store ",
      Description:" Including reports of the flow of gold bars specially in goldtrader store ",
      Short_Description_Ar: "تقارير السبائك",
      Description_Ar:
      "تقارير التي تتضمن حركة السبائك خاصة في محل المسوئجي",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Purchaser",
      ],
      Allowed_Plans: ["basic", "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail", "GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: true,
      Title: 'تقارير السبائك'

      ,
      date:Timestamp.fromDate(DateTime.now())

  ),
  Restriction(
      Short_Description: "Including reports of monthly record of attendance and departure of staff",
      Description: "Including reports of monthly record of attendance and departure of staff ",
      Short_Description_Ar: "تقارير الحضور و الانصراف",
      Description_Ar:
      "تقارير التي تتضمن سجل الحضور والانصراف الشهري لفريق العمل (حضور وانصراف)",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Manager",
      ],
      Allowed_Plans: ["basic", "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail", "GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: true,
      Title: 'تقارير الحضور و الانصراف'
      ,
      date:Timestamp.fromDate(DateTime.now())


  ),
  Restriction(
      Short_Description: "Including reports of clients data",
      Description: "Including reports of monthly record of clients data ",
      Short_Description_Ar: "تقارير العملاء",
      Description_Ar:
      "تقارير التي تتضمن سجل بيانات للعملاء بشكل شهري ",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
      ],
      Allowed_Plans: ["basic", "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail", "GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: true,
      Title: 'تقارير العملاء'

      ,
      date:Timestamp.fromDate(DateTime.now())

  ),
  Restriction(

      Short_Description: "Including reports of records of generated codes",
      Description:" Including reports of all generated codes ",
      Short_Description_Ar: "تقارير ملفات التكويد",
      Description_Ar:
      "تقارير التي تتضمن السجلات الخاصة بكل الاكواد السابقة",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Manager",
        "Purchaser",
      ],
      Allowed_Plans: ["basic", "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail", "GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: true,
      Title: 'تقارير ملفات التكويد'
      ,
      date:Timestamp.fromDate(DateTime.now())


  ),
  Restriction(

      Short_Description: "Including reports of all photos of transactions ",
      Description: "Including reports of all photos of transactions that happened previously ",
      Short_Description_Ar: "تقارير الصور المرفوعة",
      Description_Ar:
      "تقارير التي تتضمن كل صور العمليات التي تمت مسبقا",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Manager",
      ],
      Allowed_Plans: ["basic", "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail", "GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: true,
      Title: 'تقارير الصور المرفوعة'

      ,
      date:Timestamp.fromDate(DateTime.now())

  ),
  Restriction(
      Short_Description: "reports contain the excel files",
      Description: "reports contain the excel files ",
      Short_Description_Ar: "تقارير مستخرج اكسيل",
      Description_Ar:
      " يحتوي علي كل التقارير اكسيل",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Manager",
        "Purchaser",
      ],
      Allowed_Plans: ["basic", "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail", "GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: true,
      Title: 'مستخرج اكسيل'

      ,
      date:Timestamp.fromDate(DateTime.now())

  ),
  Restriction(

      Short_Description: "reports contain the extracted reports files",
      Description: "reports contain the extracted reports files ",
      Short_Description_Ar: "تقارير مستخرج تقارير",
      Description_Ar:
      " يحتوي علي كل التقارير التي تم استخراجها",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Manager",
        "Purchaser",
      ],
      Allowed_Plans: ["basic", "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail", "GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: true,
      Title: 'مستخرج تقارير'

      ,
      date:Timestamp.fromDate(DateTime.now())

  ),
  Restriction(

      Short_Description: "Including reports of endorsements",
      Description: "Including reports of all endorsements of buying scrap ",
      Short_Description_Ar: "تقارير اقرارات الشراء",
      Description_Ar:
      "تقارير التي تتضمن كل الاقرارات الخاصة بشراء الكسر",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Manager",
        "Supervisor",
      ],
      Allowed_Plans: ["basic", "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail", "GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: true,
      Title: 'تقارير اقرارات الشراء'
      ,
      date:Timestamp.fromDate(DateTime.now())


  ),
  Restriction(
      Short_Description: "Including all Daily invoice ",
      Description: "  Including all Daily invoice",
      Short_Description_Ar: " تقارير التي تتضمن كل الفواتير اليومية",
      Description_Ar:
      "تقارير التي تتضمن كل الفواتير اليومية",
      Role_Permission: [
        "Owner",
        "Admin",
        "Manager",
        "Accountant",
        "Purchaser",
        "Cashier",
      ],
      Allowed_Plans: ["basic", "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail", "GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'تقارير فواتير اليوم',
      date:Timestamp.fromDate(DateTime.now())



  ),
  Restriction(
      Short_Description: "Including all transactions of invoice reliance",
      Description: "  Including all transactions of reliances ",
      Short_Description_Ar: "تقارير التي تتضمن كل عمليات الخاصة باعتمادات الفواتير",
      Description_Ar:
      "تقارير التي تتضمن كل عمليات الخاصة باعتمادات الفواتير",
      Role_Permission: [
        "Owner",
        "Admin",
        "Manager",
        "Accountant",
      ],
      Allowed_Plans: ["basic", "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail", "GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'تقارير اعتمادات الفواتير',
      date:Timestamp.fromDate(DateTime.now())



  ),
  Restriction(
      Short_Description: "Including all reservations during the day",
      Description: " Including all reservations during the day ",
      Short_Description_Ar: "تتضمن كل عمليات الحجز علي مدار اليوم",
      Description_Ar:
      "تتضمن كل عمليات الحجز علي مدار اليوم",
      Role_Permission: [
        "Owner",
        "Admin",
        "Manager",
        "Accountant",
        "Supervisor",

      ],
      Allowed_Plans: ["basic", "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail", "GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'تقارير الحجز',
      date:Timestamp.fromDate(DateTime.now())



  ),
  Restriction(
      Short_Description: "Including all reports of goods that have not delivered yet",
      Description: "  Including all reports of goods that have not delivered yet ",
      Short_Description_Ar: "تقارير طلبيات البضاعة",
      Description_Ar:
      " تتضمن تقارير طلبيات البضاعة التي لم يستلمها العميل بعد ",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Purchaser",
      ],
      Allowed_Plans: ["basic", "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail", "GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: true,
      Title: 'تقارير طلبيات البضاعة'
      ,
      date:Timestamp.fromDate(DateTime.now())


  ),
  Restriction(
      Short_Description: "It includes monthly  reports of goods flow, sales, cash flow, and reservations",
      Description: "It includes monthly  reports of goods flow, sales, cash flow, and reservations",
      Short_Description_Ar: "تقارير محاسبية",
      Description_Ar:
      " تتضمن تقارير الشهرية للبضاعة و المبيعات و حركة النقدية و الحجوزات  ",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Purchaser",
      ],
      Allowed_Plans: ["basic", "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail", "GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: true,
      Title: 'تقارير محاسبية'
      ,
      date:Timestamp.fromDate(DateTime.now())


  ),

//accounts
  Restriction(
      Short_Description: "Including all accounts",
      Description: "Including all accounts ",
      Short_Description_Ar: "تتضمن كل الحسابات",
      Description_Ar:
      "تشمل حسابات بين البنوك والقطاعي وغيره",
      Role_Permission: [
        "Owner",
        "Admin",
        "Manager",
        "Accountant",
      ],
      Allowed_Plans: ["basic", "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail", "GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: true, Title: 'الحسابات المفتوحة',
      date:Timestamp.fromDate(DateTime.now())



  ),

  //search icon
  Restriction(
      Short_Description: "We can use it for search",
      Description: "It contains 4 widgets for search  ",
      Short_Description_Ar: " أيقونة الكيو ار كود",
      Description_Ar:
      " تحتوي علي 4 أيقونات اخري بداخلها ونستخدمهم للبحث ",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Manager",
        "Supervisor",
        "Purchaser",
        "Salesman",
        "Marketingmanager",
        "Cashier",
      ],
      Allowed_Plans: ["basic", "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail", "GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: true,
      Title: 'ايقونة بحث الكيو ار كود'

      ,
      date:Timestamp.fromDate(DateTime.now())

  ),
  Restriction(
      Short_Description: "We use it to inquire about the goods data by scaning their barcode",
      Description: "We use it to inquire about the goods data by scaning their barcode ",
      Short_Description_Ar: " باركود",
      Description_Ar:
      " نستخدمها للاستعلام عن بيانات البضاعة عن طريق قراءة الباركود الخاص بها ",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Manager",
        "Supervisor",
        "Purchaser",
        "Salesman",
        "Marketingmanager",
        "Cashier",
      ],
      Allowed_Plans: ["basic", "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail", "GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: true,
      Title: 'ايقونة بحث الباركود'
      ,
      date:Timestamp.fromDate(DateTime.now())


  ),
  Restriction(
      Short_Description: "We use it to inquire about the goods data by scaning their qrcode",
      Description: "We use it to inquire about the goods data by scaning their qrcode ",
      Short_Description_Ar: " qrcode  كود",
      Description_Ar:
      " نستخدمها للاستعلام عن بيانات البضاعة عن طريق قراءة الكيو ار كود الخاص بها ",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Manager",
        "Supervisor",
        "Purchaser",
        "Salesman",
        "Marketingmanager",
        "Cashier",
      ],
      Allowed_Plans: ["basic", "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail", "GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: true,
      Title: 'ايقونة بحث بالكود'

      ,
      date:Timestamp.fromDate(DateTime.now())

  ),
  // Restriction(
  //     Short_Description: "We use it to inquire about the goods data by entering their code",
  //     Description: "We use it to inquire about the goods data by entering their code ",
  //     Short_Description_Ar: " بحث بالكود",
  //     Description_Ar:
  //     " نستخدمها للاستعلام عن بيانات البضاعة عن طريق كتابة الكود الخاص بها ",
  //     Role_Permission: [
  //       "Owner",
  //       "Admin",
  //       "Accountant",
  //       "Manager",
  //       "Supervisor",
  //       "Purchaser",
  //       "Salesman",
  //       "Marketingmanager",
  //       "Cashier",
  //     ],
  //     Allowed_Plans: ["basic", "pro", "vip"],
  //     Store_Type: ["Retail", "Wholesale", "HalfRetail", "GoldTrader"],
  //     Material_Type: ["Gold", "Silver", "Gold_Silver"],
  //     Photo_Url:"",
  //     Visible: true,
  //     Blurred: true,
  //     Title: 'SearchByCodeWidget'
  //
  //     ,
  //     date: Timestamp.fromDate(
  //       DateTime.now().subtract(Duration(days: 1)),
  //     )),
Restriction(
      Short_Description: "Search for qr number",
      Description: "Search for qr numberby item details like the widget",
      Short_Description_Ar: " بحث بتفاصيل المنتج",
      Description_Ar:
      " يمكنك من البحث عن الاكواد المفقودة لتستبدلها بكود جديد بمجرد ادخال وزن المنتج",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Manager",
        "Supervisor",
        "Purchaser",
        "Salesman",
        "Marketingmanager",
        "Cashier",
      ],
      Allowed_Plans: ["basic", "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail", "GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: true,
      Title: 'ايقونة بحث بتفاصيل المنتج'
    ,
    date: Timestamp.fromDate(
      DateTime.now()
    )

  ),

  ///
  /// new
  //operations
  Restriction(
      Short_Description: "The process of selling goods",
      Description: "It is the process of selling goods to the customer, either manually or with code.",
      Short_Description_Ar: "عملية بيع البضاعة",
      Description_Ar:
      "هي عملية بيع البضاعة للعميل اما يدويا او بالكود.",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Manager",
        "Supervisor",
        "Purchaser",
        "Salesman",
        "Marketingmanager",

      ],
      Allowed_Plans: ["basic", "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail",],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'عمليات البيع'
      ,
      date: Timestamp.fromDate(DateTime.now())

  ),
  Restriction(
      Short_Description: "The process of Scrap purchase",
      Description: "It is the process of purchasing scrap from a customer.",
      Short_Description_Ar: "عملية شراء الكسر",
      Description_Ar:
      "هي عملية شراء كسر من العميل .",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Manager",
        "Supervisor",
        "Salesman",


      ],
      Allowed_Plans: ["basic", "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail",],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'عمليات الشراء'
      ,
      date: Timestamp.fromDate(DateTime.now())

  ),
  Restriction(
      Short_Description: "Cash entry into the store.",
      Description: "Cash entry operations into the store.",
      Short_Description_Ar: "دخول نقدية للمحل",
      Description_Ar:
      "عمليات دخول نقدية للمحل",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Manager",
        "Supervisor",
        "Purchaser",
        "Cashier",
      ],
      Allowed_Plans: ["basic", "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail", "GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: true,
      Title: 'دخول نقدية'
      ,
      date: Timestamp.fromDate(
          DateTime.now()
      )

  ),
  Restriction(
      Short_Description: "Cash exit from the store.",
      Description: "Cash exit operations from the store.",
      Short_Description_Ar: "خروج نقدية من المحل",
      Description_Ar:
      "عمليات خروج نقدية من المحل",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Manager",
        "Supervisor",
        "Purchaser",
        "Cashier",
      ],
      Allowed_Plans: ["basic", "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail", "GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: true,
      Title: 'خروج نقدية'
      ,
      date: Timestamp.fromDate(
          DateTime.now()
      )

  ),
  Restriction(
      Short_Description: "Goods entry from the store.",
      Description: "Goods entry operations from the store.",
      Short_Description_Ar: "دخول بضاعة من المحل",
      Description_Ar:
      "عمليات دخول بضاعة من المحل",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Manager",
        "Supervisor",
        "Purchaser",

      ],
      Allowed_Plans: ["basic", "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail", "GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: true,
      Title: 'دخول بضاعة'
      ,
      date: Timestamp.fromDate(
          DateTime.now()
      )

  ),
  Restriction(
      Short_Description: "Goods exit from the store.",
      Description: "Goods exit operations from the store.",
      Short_Description_Ar: "خروج بضاعة من المحل",
      Description_Ar:
      "عمليات خروج بضاعة من المحل",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Manager",
        "Supervisor",
        "Purchaser",

      ],
      Allowed_Plans: ["basic", "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail", "GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: true,
      Title: 'خروج بضاعة'
      ,
      date: Timestamp.fromDate(
          DateTime.now()
      )

  ),
  Restriction(
      Short_Description: "Scrap entry to the store.",
      Description: "Scrap entry operations to the store.",
      Short_Description_Ar: "دخول كسر من المحل",
      Description_Ar:
      "عمليات دخول كسر من المحل",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Manager",
        "Purchaser",

      ],
      Allowed_Plans: ["basic", "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail",],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: true,
      Title: 'دخول كسر'
      ,
      date: Timestamp.fromDate(
          DateTime.now()
      )

  ),
  Restriction(
      Short_Description: "Scrap exit from the store.",
      Description: "Scrap exit operations from the store.",
      Short_Description_Ar: "خروج كسر من المحل",
      Description_Ar:
      "عمليات خروج كسر من المحل",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Manager",
        "Purchaser",

      ],
      Allowed_Plans: ["basic", "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail",],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: true,
      Title: 'خروج كسر'
      ,
      date: Timestamp.fromDate(
          DateTime.now()
      )

  ),
  Restriction(
      Short_Description: "Including all orders of goods that have not delivered yet",
      Description: "  Including all orders of goods that have not delivered yet ",
      Short_Description_Ar: " طلبيات البضاعة",
      Description_Ar:
      " تتضمن كل طلبيات البضاعة التي لم يستلمها العميل بعد ",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Manager",
        "Supervisor",
        "Purchaser",
      ],
      Allowed_Plans: [ "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail", "GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: true,
      Title: 'طلبيات البضاعة'
      ,
      date:Timestamp.fromDate(DateTime.now())


  ),
  Restriction(
      Short_Description: "Scrap Tevet",
      Description: "Scrap Tevet in which goods are removed from scrap into new goods.",
      Short_Description_Ar: "تيفيت كسر",
      Description_Ar:
      "تيفيت الكسر يتم فيها خروج بضاعة من الكسر الي بضاعة الجديدة.",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Manager",
        "Supervisor",
        "Purchaser",
      ],
      Allowed_Plans: [ "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail",],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: true,
      Title: 'تيفيت كسر'
      ,
      date:Timestamp.fromDate(DateTime.now())


  ),
  Restriction(
      Short_Description: "The workshop is where modifications are made to the goods,",
      Description: "The workshop is where modifications are made to the goods, such as drilling or welding",
      Short_Description_Ar: "الورشة يتم فيها عمل تعديل علي البضاعه.",
      Description_Ar:
      "الورشة يتم فيها عمل تعديل علي البضاعه مثل حفر او لحام",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Manager",
        "Supervisor",
        "Purchaser",
      ],
      Allowed_Plans: [ "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail",],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: true,
      Title: 'الورشة'
      ,
      date:Timestamp.fromDate(DateTime.now())


  ),
//gold price
  Restriction(
      Short_Description: "Live international gold prices.",
      Description: "Live international gold prices for guidance, taken from the gold market.",
      Short_Description_Ar: "أسعار حية للذهب الدولي للاسترشاد بها.",
      Description_Ar:
      "أسعار حية للذهب الدولي للاسترشاد بها ، ماخوذة من سوق الدهب.",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Manager",
        "Supervisor",
        "Purchaser",
        "Salesman",
        "Marketingmanager",
        "Cashier",
      ],
      Allowed_Plans: ["basic", "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail","GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'أسعار حية للذهب الدولي'
      ,
      date:Timestamp.fromDate(DateTime.now())


  ),
  Restriction(
      Short_Description: "Live local gold prices.",
      Description: "Live local gold prices for guidance, taken from the gold market.",
      Short_Description_Ar: "أسعار حية للذهب المحلي للاسترشاد بها.",
      Description_Ar:
      "أسعار حية للذهب المحلي للاسترشاد بها ، ماخوذة من سوق الدهب.",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Manager",
        "Supervisor",
        "Purchaser",
        "Salesman",
        "Marketingmanager",
        "Cashier",
      ],
      Allowed_Plans: ["basic", "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail","GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'أسعار حية للذهب المحلي'
      ,
      date:Timestamp.fromDate(DateTime.now())


  ),
  Restriction(
      Short_Description: "Adjusting the gold price of the system.",
      Description: "Adjust the price of gold completely at any time.",
      Short_Description_Ar: "تعديل سعر الذهب للنظام.",
      Description_Ar:
      "تعديل سعر الذهب للنظام في اي وقت.",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Manager",
        "Supervisor",
        "Purchaser",
        // "Salesman",
        "Marketingmanager",
        "Cashier",
      ],
      Allowed_Plans: ["basic", "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail","GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'تعديل سعر الذهب للنظام'
      ,
      date:Timestamp.fromDate(DateTime.now())


  ),
  Restriction(
      Short_Description: "Adjusting the price of gold for the system and sharing it to the team.",
      Description: "Adjust the price of gold completely at any time and sharing it to the team",
      Short_Description_Ar: "تعديل سعر الذهب للنظام و مشاركته للفريق.",
      Description_Ar:
      "تعديل سعر الذهب للنظام في اي وقت و مشاركته للفريق.",
      Role_Permission: [
        "Owner",
        "Admin",
        "Manager",
        "Supervisor",
        "Purchaser",
        "Marketingmanager",

      ],
      Allowed_Plans: ["basic", "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail","GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'مشاركة تعديل سعر الذهب للنظام'
      ,
      date:Timestamp.fromDate(DateTime.now())


  ),
  Restriction(
      Short_Description: "Detailed control screen.",
      Description: "The detailed control screen contains an overview of the important administrative details in the system.",
      Short_Description_Ar: "شاشة التحكم التفصيلية.",
      Description_Ar:
      "شاشة التحكم التفصيلية فيها نظرة عامه علي للتفاصيل الادارية المهمة في نظام.",
      Role_Permission: [
        "Owner",
        "Admin",
      ],
      Allowed_Plans: [ "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail","GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'شاشة التحكم التفصيلية',
      date:Timestamp.fromDate(DateTime.now())
  ),
];
