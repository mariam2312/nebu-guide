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

import '../models/Restriction.dart';

List<Restriction> restrictions = [
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
    Blurred: true, Title: 'Daily Invoices',
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
      Blurred: true, Title: 'Review Tax Invoices'
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
      Allowed_Plans: ["basic", "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail", "GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url: "",
      Visible: true,
      Blurred: true, Title: 'Tax Invoices'

  ),
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
      Blurred: true, Title: 'Open Accounts'



  ),
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
      Blurred: true,
      Title: 'Operations Report'



  ),
  Restriction(
      Short_Description: "sales report ",
      Description: "Including all sales",
      Short_Description_Ar: "تتضمن كل المبيعات ",
      Description_Ar:
      "تتضمن جميع المبيعات ",
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
      Blurred: true,
      Title: 'Sales'



  ),
  Restriction(
      Short_Description: "Scrap Change",
      Description: "Including all scrap that entering while making saless",
      Short_Description_Ar: "تضمن كل عمليات دخول الكسر عند القيام بعملية بيع معه",
      Description_Ar:
      "تتضمن كل عمليات دخول الكسر عند القيام بعملية شراء معه",
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
      Blurred: true,
      Title: 'Scrap change'



  ),
  Restriction(
      Short_Description: "Including all purchases",
      Description: " Including all purchases ",
      Short_Description_Ar: "تتضمن كل عمليات الشراء",
      Description_Ar: "تتضمن كل عمليات الشراء  ",
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
      Blurred: true,
      Title: 'Purchases'



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
      Blurred: true,
      Title: 'Reservation'



  ),
  Restriction(
      Short_Description: "Including all transactions of cash",
      Description: "  Including entering and exiting of cash ",
      Short_Description_Ar: "تتضمن كل عمليات الخاصة بالنقدية",
      Description_Ar:
      "تتضمن كل عمليات دخول وخروج النقدية",
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
      Title: 'Cash Flow'



  ),
  Restriction(
      Short_Description: "Including all transactions of scrap",
      Description: "  Including entering and exiting of scrap ",
      Short_Description_Ar: "تتضمن كل عمليات الخاصة بالكسر",
      Description_Ar:
      "تتضمن كل عمليات دخول وخروج الكسر",
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
      Title: 'Scrap Flow'



  ),
  Restriction(
      Short_Description: "Including all transactions of goods",
      Description: "  Including entering and exiting of goods ",
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
      Title: 'Goods Flow'



  ),
  Restriction(
      Short_Description: "Including all transactions of invoice reliance",
      Description: "  Including all transactions of reliances ",
      Short_Description_Ar: "تتضمن كل عمليات الخاصة باعتمادات الفواتير",
      Description_Ar:
      " تتضمن كل عمليات الخاصة باعتمادات الفواتير ",
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
      Blurred: true,
      Title: 'Reliances'



  ),
  Restriction(
      Short_Description: "Including costs of goods",
      Description: "  Including costs of goods ",
      Short_Description_Ar: " تكاليف البضاعة",
      Description_Ar:
      " تتضمن كل التكاليف الخاصة بالبضاعة ",
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
      Title: 'Goods Cost'



  ),
  Restriction(
      Short_Description: "Including transactions of gold with goldtraders",
      Description: "  Including transactions of gold with goldtraders ",
      Short_Description_Ar: " قطع الذهب",
      Description_Ar:
      " يتضمن جميع حركات قطع الذهب مع المسوئجية ",
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
      Title: 'Gold Exchange'



  ),
  Restriction(
      Short_Description: "Including all transactions of goods that have not delivered yet",
      Description: "  Including all transactions of goods that have not delivered yet ",
      Short_Description_Ar: " طلبيات البضاعة",
      Description_Ar:
      " تتضمن جميع طلبيات البضاعة التي لم يستلمها العميل بعد   ",
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
      Title: 'Special Orders'



  ),
  Restriction(
      Short_Description: "Including scrap keeping for each seller seperately",
      Description: "Including scrap keeping for each seller seperately ",
      Short_Description_Ar: " عهدة الكسر",
      Description_Ar:
      " تتضمن عهدة الكسر للبائعين كل بائع علي حدا   ",
      Role_Permission: [
        "Owner",
        "Admin",
        "Manager",
      ],
      Allowed_Plans: ["basic", "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail", "GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: true,
      Title: 'Scrap Guardianship'



  ),
  Restriction(
      Short_Description: "Including the flow of gold bars specially in goldtrader store ",
      Description:" Including the flow of gold bars specially in goldtrader store ",
      Short_Description_Ar: " السبائك",
      Description_Ar:
      " تتضمن حركة السبائك خاصة في محل المسوئجي",
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
      Title: 'Gold Bars'



  ),
  Restriction(
      Short_Description: "Including monthly record of attendance and departure of staff",
      Description: "Including monthly record of attendance and departure of staff ",
      Short_Description_Ar: " الحضور",
      Description_Ar:
      " تتضمن سجل الحضور والانصراف الشهري لفريق العمل (حضور وانصراف)",
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
      Title: 'Attendance'



  ),
  Restriction(
      Short_Description: "Including clients data",
      Description: "Including monthly record of clients data ",
      Short_Description_Ar: " العملاء",
      Description_Ar:
      " تتضمن سجل بيانات للعملاء بشكل شهري ",
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
      Title: 'Clients'



  ),
  Restriction(

      Short_Description: "Including all photos of transactions ",
      Description: "Including all photos of transactions that happened previously ",
      Short_Description_Ar: " الصور المرفوعة",
      Description_Ar:
      " تتضمن كل صور العمليات التي تمت مسبقا",
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
      Title: 'Uploded Photos'



  ),
  Restriction(

      Short_Description: "Including endorsements",
      Description: "Including all endorsements of buying scrap ",
      Short_Description_Ar: " اقرارات الشراء",
      Description_Ar:
      " تتضمن كل الاقرارات الخاصة بشراء الكسر",
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
      Title: 'Purchase Endorsement'



  ),
  Restriction(

      Short_Description: "Including records of generated codes",
      Description:" Including all generated codes ",
      Short_Description_Ar: " ملفات التكويد",
      Description_Ar:
      " تتضمن السجلات الخاصة بكل الاكواد السابقة",
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
      Title: 'Coding Files'



  ),
  Restriction(

      Short_Description: "It contains the extracted reports files",
      Description: "It contains the extracted reports files ",
      Short_Description_Ar: " مستخرج تقارير",
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
      Title: 'Reports Extractor'



  ),
  Restriction(

      Short_Description: "It contains more details about inventory of goods",
      Description: "It contains more details about inventory of goods ",
      Short_Description_Ar: " الجرد",
      Description_Ar:
      " يحتوي علي تفاصيل بعمليات جرد البضاعة",
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
      Title: 'Inventory'



  ),  Restriction(
      Short_Description: "It shows the mail screen",
      Description: "It contains the price of gold locally and globally ",
      Short_Description_Ar: " نيبو جيوليري سيستمز",
      Description_Ar:
      " تحتوي علي اسعار الذهب محليا وعالميا ",
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
      Title: 'NebuJewellerySystemsWidget'



  ),Restriction(
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
      Title: 'QrcodeWidget'



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
      Title: 'QrcodeSearchWidget'



  ),      Restriction(
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
      Title: 'BarcodeSearchWidget'



  ),   Restriction(
      Short_Description: "We use it to inquire about the goods data by entering their code",
      Description: "We use it to inquire about the goods data by entering their code ",
      Short_Description_Ar: " بحث بالكود",
      Description_Ar:
      " نستخدمها للاستعلام عن بيانات البضاعة عن طريق كتابة الكود الخاص بها ",
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
      Title: 'SearchByCodeWidget'



  ),
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
      Title: 'SearchByDetailsWidget'



  ),

];
