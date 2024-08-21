

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/Restriction.dart';

List<Restriction> restrictions = [
  //operations ...
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
      Allowed_Plans: ["start", "basic", "pro", "vip"],
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
      Allowed_Plans: ["start", "basic", "pro", "vip"],
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
      //check
      Allowed_Plans: ["start", "basic", "pro", "vip"],
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
      //check
      Allowed_Plans: ["start", "basic", "pro", "vip"],
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
      Allowed_Plans: ["start", "basic", "pro", "vip"],
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
      Allowed_Plans: ["start", "basic", "pro", "vip"],
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
      Allowed_Plans: [ "basic","pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail",],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: true,
      Title: 'الورشة'
      ,
      date:Timestamp.fromDate(DateTime.now())


  ),
  Restriction(
      Short_Description: "The process of selling silver",
      Description: "It is the process of selling silver to the customer, either manually or with code.",
      Short_Description_Ar: "عملية بيع الفضه",
      Description_Ar:
      "هي عملية بيع الفضه للعميل اما يدويا او بالكود.",
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
      Allowed_Plans: [ "basic", "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail",],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: ' عمليات بيع الفضه '
      ,
      date: Timestamp.fromDate(DateTime.now())

  ),
  //icons
//gold price ....
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
      Allowed_Plans: [ "pro", "vip"],
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
      Allowed_Plans: [ "pro", "vip"],
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
      //check
      Allowed_Plans: ["start", "basic", "pro", "vip"],
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
      Allowed_Plans: ["start", "basic", "pro", "vip"],
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
      Allowed_Plans: ["start", "basic" "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail","GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'شاشة التحكم التفصيلية',
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
      Allowed_Plans: [ "pro", "vip"],
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
      Short_Description: "Including reports of monthly clients data",
      Description: "Including reports of monthly record of clients data ",
      Short_Description_Ar: "تقارير شهري العملاء",
      Description_Ar:
      "تقارير التي تتضمن سجل بيانات للعملاء بشكل شهري ",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
      ],
      Allowed_Plans: ["pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail", "GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: true,
      Title: 'تقارير شهري العملاء'

      ,
      date:Timestamp.fromDate(DateTime.now())

  ),
  Restriction(
      Short_Description: "Including reports of all clients data",
      Description: "Including reports of all record of clients data ",
      Short_Description_Ar: "تقارير لكل العملاء",
      Description_Ar:
      "تقارير التي تتضمن سجل بيانات لكل العملاء ",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
      ],
      Allowed_Plans: [ "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail", "GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: true,
      Title: 'تقارير لكل العملاء'

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
      Allowed_Plans: [ "pro", "vip"],
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
      Allowed_Plans: [ "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail", "GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: true,
      Title: 'تقارير محاسبية'
      ,
      date:Timestamp.fromDate(DateTime.now())


  ),
  Restriction(
      Short_Description: "Open accounts reports",
      Description: "Open accounts reports include all transactions with the supplier, factory, banks, or customers.",
      Short_Description_Ar: "تقارير الحسابات المفتوحة",
      Description_Ar:
      "تقارير الحسابات المفتوحة يتضمن كل التعاملات مع المورد او مصنع او بنوك او عملاء",
      //check
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
      Title: 'تقارير الحسابات المفتوحة'
      ,
      date:Timestamp.fromDate(DateTime.now())


  ),
  Restriction(
      Short_Description: "Daily Open accounts reports",
      Description: "Daily Open accounts reports include all transactions with the supplier, factory, banks, or customers.",
      Short_Description_Ar: "تقارير يومي للحسابات المفتوحة",
      Description_Ar:
      "تقارير يومي للحسابات المفتوحة يتضمن كل التعاملات مع المورد او مصنع او بنوك او عملاء",
      //check
      Role_Permission: [
        "Owner",
        "Admin",
        "Manager",
        "Accountant",
      ],
      Allowed_Plans: ["vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail", "GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: true,
      Title: 'تقارير يومي للحسابات المفتوحة'
      ,
      date:Timestamp.fromDate(DateTime.now())


  ),
  Restriction(
      Short_Description: "Coverage reports",
      Description: "It includes coverage details of total sales, purchases, cash, and coverage percentage.",
      Short_Description_Ar: "تقارير التغطية",
      Description_Ar:
      "يتضمن تفاصيل التغطية من اجمالي مبيعات و مشتريات ونقدية و نسبه التغطية .",
      //check
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
      Title: 'تقارير التغطية'
      ,
      date:Timestamp.fromDate(DateTime.now())


  ),

  //balance ....
  Restriction(
      Short_Description: "daily balance.",
      Description: "The daily balance is the opening balance of the store in gold and cash.",
      Short_Description_Ar: "ترصيد يومية",
      Description_Ar:
      "الرصيد اليومي هو الرصيد الافتتاحي للمحل من دهب و نقدية.",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Manager",
        "Supervisor",
        "Purchaser",

      ],
      Allowed_Plans: [ "start","basic","pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail","GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'ترصيد يومية',
      date:Timestamp.fromDate(DateTime.now())
  ),
  Restriction(
      Short_Description: "Today's balance",
      Description: "Today's balance is the closing of the store's journal to know the gain and loss.",
      Short_Description_Ar: "رصيد اليوم",
      Description_Ar:
      "رصيد اليوم هو تقفيل يوميه المحل لمعرفه المكسب و الخسارة.",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Manager",


      ],
      Allowed_Plans: ["start", "basic","pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail","GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'تقفيل يومية',
      date:Timestamp.fromDate(DateTime.now())
  ),
  Restriction(
      Short_Description: "Temporary balance.",
      Description: "Temporary balance.",
      Short_Description_Ar: "رصيد مؤقت",
      Description_Ar:
      "رصيد مؤقت",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Manager",


      ],
      Allowed_Plans: ["pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail","GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'رصيد مؤقت',
      date:Timestamp.fromDate(DateTime.now())
  ),
  Restriction(
      Short_Description: "Total balance",
      Description: "Total balance",
      Short_Description_Ar: "رصيد مجمع",
      Description_Ar:
      "رصيد مجمع",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Purchaser",

      ],
      Allowed_Plans: [ "basic","pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail","GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'رصيد مجمع',
      date:Timestamp.fromDate(DateTime.now())
  ),
  //accounts ....
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

  //goods ....
  Restriction(
      Short_Description: "Inventory of goods is real-time.",
      Description: "Inventory of goods is real-time It is a quick inventory of all the goods in the store.",
      Short_Description_Ar: "جرد البضاعة لحظي",
      Description_Ar:
      " جرد البضاعة لحظي هو جرد سريع لكل البضاعه الموجودة في المحل",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Manager",
        "Supervisor",
        "Purchaser",

      ],
      Allowed_Plans: [ "basic","pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail","GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'جرد البضاعة لحظي',
      date:Timestamp.fromDate(DateTime.now())
  ),
  Restriction(
      Short_Description: "Daily inventory of goods ",
      Description: "The daily inventory of goods is an inventory of the weight and caliber of all the goods in the store.",
      Short_Description_Ar: "جرد يومي للبضاعة",
      Description_Ar:
      " جرد البضاعة اليومي هو جرد وزن و عيار  لكل البضاعه الموجودة في المحل",
     //check
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Manager",
        "Supervisor",
        "Purchaser",

      ],
      Allowed_Plans: ["pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail","GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'جرد يومي للبضاعة',
      date:Timestamp.fromDate(DateTime.now())
  ),
  Restriction(
      Short_Description: "Comprehensive inventory of goods",
      Description: "Comprehensive inventory of goods.",
      Short_Description_Ar: "جرد البضاعة الشامل",
      Description_Ar:
      " جرد البضاعة الشامل",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Manager",
        "Supervisor",
        "Purchaser",

      ],
      Allowed_Plans: [ "basic","pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail","GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'جرد البضاعة الشامل',
      date:Timestamp.fromDate(DateTime.now())
  ),
  Restriction(
      Short_Description: "Quick inventory of goods by entering codes",
      Description: "Quick inventory of goods by entering codes",
      Short_Description_Ar: "جرد بالاكواد",
      Description_Ar:
      " جرد سريع للبضاعه عن طيق اسكان الاكواد.",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Manager",
        "Supervisor",
        "Purchaser",

      ],
      //check
      Allowed_Plans: [ "basic","pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail","GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'جرد بالاكواد',
      date:Timestamp.fromDate(DateTime.now())
  ),
  Restriction(
      Short_Description: "Add new goods",
      Description: "It is the process of bringing new goods into the store.",
      Short_Description_Ar: "اضافة بضاعة جديدة",
      Description_Ar:
      "هو عمليه دخول بضاعه جديدة للمحل .",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Manager",
        "Purchaser",

      ],
      //check
      Allowed_Plans: [ "start","basic","pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail","GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'اضافة بضاعة جديدة',
      date:Timestamp.fromDate(DateTime.now())
  ),
  Restriction(
      Short_Description: "Adding previous goods",
      Description: "It is the registration of the goods for the purpose of coding, and it is not added to the store’s balance.",
      Short_Description_Ar: "اضافة بضاعة سابقة",
      Description_Ar:
      "هو تسجيل البضاعه من اجل التكويد ولا تضاف الي رصيد المحل ",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Manager",
        "Purchaser",

      ],
      //check
      Allowed_Plans: [ "basic","pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail","GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'اضافة بضاعة سابقة',
      date:Timestamp.fromDate(DateTime.now())
  ),
  Restriction(
      Short_Description: "Converting the goods",
      Description: "Transferring goods between items.",
      Short_Description_Ar: "تحويل البضاعه بين البنود",
      Description_Ar:
      "تحويل البضاعه بين البنود.",
      Role_Permission: [
"Owner",
"Admin",
"Accountant",
"Manager",
"Supervisor",
"Purchaser",

      ],
      Allowed_Plans: [ "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail","GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'تحويل بضاعة',
      date:Timestamp.fromDate(DateTime.now())
  ),
  Restriction(
      Short_Description: "Recording goods in Excel",
      Description: "Register goods on the system quickly by entering an Excel sheet",
      Short_Description_Ar: "تسجيل بضاعة بالاكسيل",
      Description_Ar:
      "تسجيل بضاعه علي سيستم بشكل سريع من خلال ادخال شيت اكسل .",
      Role_Permission: [
"Owner",
"Admin",
"Accountant",
"Purchaser",

      ],
      Allowed_Plans: [ "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail","GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'تسجيل بضاعة بالاكسيل',
      date:Timestamp.fromDate(DateTime.now())
  ),

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
      Allowed_Plans: [ "pro", "vip"],

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
  //diamond ....
  Restriction(
      Short_Description: "The diamond system",
      Description: "The diamond system includes sales operations, entry of goods, and inventory.",
      Short_Description_Ar: "نظام الماظ",
      Description_Ar:
      "نظام الماظ من بيع ، دخول بضاعه ، جرد.",
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
      Allowed_Plans: [],
      Store_Type: ["Retail", "Wholesale", "HalfRetail","GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'نظام الماظ',
      date:Timestamp.fromDate(DateTime.now())
  ),
  Restriction(
      Short_Description: "Recording of diamond plots",
      Description: "Recording of diamond plots",
      Short_Description_Ar: "تسجيل قطع الماظ",
      Description_Ar:
      "تسجيل قطع الماظ.",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Manager",
        "Supervisor",
        "Purchaser",

      ],
      Allowed_Plans: [],
      Store_Type: ["Retail", "Wholesale", "HalfRetail","GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'تسجيل قطع الماظ',
      date:Timestamp.fromDate(DateTime.now())
  ),

  //lists .....
  Restriction(
      Short_Description: "Price list.",
      Description: "The price list includes four prices for each item and each supplier.",
      Short_Description_Ar: "قائمة الاسعار",
      Description_Ar:
      "قائمة الاسعار تتضمن الاربع اسعار لكل بند و لكل مورد.",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Manager",
        "Supervisor",
        "Purchaser",
        "Salesman",
      ],
      Allowed_Plans: [ "start","basic","pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail","GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'قائمة الاسعار',
      date:Timestamp.fromDate(DateTime.now())
  ),
  Restriction(
      Short_Description: "الانجرارة list.",
      Description: "The الانجرارة list for stores .",
      Short_Description_Ar: "قائمة الانجرارة",
      Description_Ar:
      "قائمة المحلات المسجله للانجرارة.",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Manager",
        "Supervisor",
        "Salesman",
      ],
      Allowed_Plans: [ "basic","pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail","GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'قائمة الانجرارة',
      date:Timestamp.fromDate(DateTime.now())
  ),
  Restriction(
      Short_Description: "الانجرارة list.",
      Description: "The الانجرارة list for stores .",
      Short_Description_Ar: "قائمة العجز",
      Description_Ar:
      "قائمة المحلات المسجله للانجرارة.",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Manager",

      ],
      //check
      Allowed_Plans: [ "basic","pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail","GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'قائمة العجز',
      date:Timestamp.fromDate(DateTime.now())
  ),
  Restriction(
      Short_Description: "Record prices list in Excel",
      Description: "Quick recording of price list by Excel",
      Short_Description_Ar: "تسجيل قائمه الاسعار بالاكسيل",
      Description_Ar:
      "تسجيل سريع لقايمه الاسعار عن طريق الاكسيل",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Purchaser",
      ],
      Allowed_Plans: [ "pro", "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail","GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'تسجيل قائمه الاسعار بالاكسيل',
      date:Timestamp.fromDate(DateTime.now())
  ),

  //Marketing management .....
  Restriction(
      Short_Description: "e market",
      Description: "e market",
      Short_Description_Ar: "السوق الالكتروني",
      Description_Ar:
      "يتم عرض البضاعه في السوق الالكتروني",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Manager",
        "Supervisor",
        "Marketingmanager",
      ],
      Allowed_Plans: [ "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail","GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'السوق الالكتروني',
      date:Timestamp.fromDate(DateTime.now())
  ),
  Restriction(
      Short_Description: "Adding goods to the market ",
      Description: "Adding goods to the market to display them to customers",
      Short_Description_Ar: "اضافة للسوق الالكتروني",
      Description_Ar:
      "اضافة بضاعه للسوق الالكتروني لعرضها للعملاء",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Manager",
        "Supervisor",
        "Marketingmanager",
      ],
      Allowed_Plans: [ "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail","GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'اضافة للسوق الالكتروني',
      date:Timestamp.fromDate(DateTime.now())
  ),
  Restriction(
      Short_Description: "Search in e market ",
      Description: "Search for items available in the e market",
      Short_Description_Ar: "بحث في السوق الالكتروني",
      Description_Ar:
      "بحث عن البنود المتاحه في السوق الالكتروني",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Manager",
        "Supervisor",
        "Marketingmanager",
      ],
      Allowed_Plans: [ "vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail","GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'اضافة للسوق الالكتروني',
      date:Timestamp.fromDate(DateTime.now())
  ),
  Restriction(
      Short_Description: "Create a gold price publication",
      Description: "Create a gold price brochure to send to clients.",
      Short_Description_Ar: "انشاء منشور اسعار الدهب",
      Description_Ar:
      "انشاء منشور اسعار الدهب لارسالها الي العملاء",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Manager",
        "Supervisor",
        "Marketingmanager",
      ],
      Allowed_Plans: [ "pro","vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail","GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'انشاء منشور اسعار الدهب',
      date:Timestamp.fromDate(DateTime.now())
  ),

//coding


  //tools ....
  Restriction(
      Short_Description: "Daily Coverage .",
      Description: "Daily Coverage includes total sales, purchases, cash, belongings, and coverage percentage.",
      Short_Description_Ar: 'التغطية اليومية',
      Description_Ar:
      "التغطية اليومية تتضمن اجمالي مبيعات و مشتريات و نقدية المتاعه و نسبه التغطية.",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
      ],
      Allowed_Plans: ["basic","pro","vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail","GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'التغطية اليومية',
      date:Timestamp.fromDate(DateTime.now())
  ),
  Restriction(
      Short_Description: "Weekly Coverage .",
      Description: "Weekly Coverage includes total sales, purchases, cash, belongings, and coverage percentage.",
      Short_Description_Ar: 'التغطية الاسبوعية',
      Description_Ar:
      "التغطية الاسبوعية تتضمن اجمالي مبيعات و مشتريات و نقدية المتاعه و نسبه التغطية.",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
      ],
      Allowed_Plans: ["pro","vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail","GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'التغطية الاسبوعية',
      date:Timestamp.fromDate(DateTime.now())
  ),
  Restriction(
      Short_Description: "Coverage over a period.",
      Description: "Coverage over a period includes total sales, purchases, cash, belongings, and coverage percentage.",
      Short_Description_Ar: 'التغطية خلال فترة',
      Description_Ar:
      "التغطية خلال فترة تتضمن اجمالي مبيعات و مشتريات و نقدية المتاعه و نسبه التغطية.",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
      ],
      Allowed_Plans: ["vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail","GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'التغطية خلال فترة',
      date:Timestamp.fromDate(DateTime.now())
  ),
  Restriction(
      Short_Description: "Bar calculation.",
      Description: "Bar calculation",
      Short_Description_Ar: 'حسابات السبيكة',
      Description_Ar:
      "حسابات السبيكة",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Purchaser",
      ],
      Allowed_Plans: ["pro","vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail","GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'حسابات السبيكة',
      date:Timestamp.fromDate(DateTime.now())
  ),
  Restriction(
      Short_Description: "Currency conversion.",
      Description: "Currency conversion",
      Short_Description_Ar: 'تحويل عملات',
      Description_Ar:
      "تحويل عملات",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
      ],
      //check
      Allowed_Plans: ["pro","vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail","GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'تحويل عملات',
      date:Timestamp.fromDate(DateTime.now())
  ),
  Restriction(
      Short_Description: "Shortcuts.",
      Description: "Shortcuts that include icons for the most frequently used places in the system.",
      Short_Description_Ar: 'اختصارات',
      Description_Ar:
      "اختصارات تتضمن ايقونات لاكثر الاماكن استخداما في السيستم.",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Manager",
        "Purchaser",
      ],
      //check
      Allowed_Plans: ["pro","vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail","GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'اختصارات',
      date:Timestamp.fromDate(DateTime.now())
  ),
  Restriction(
      Short_Description: "Recording previous codes.",
      Description: "Recording previous codes.",
      Short_Description_Ar: 'تسجيل اكواد سابقة',
      Description_Ar:
      "تسجيل اكواد سابقة.",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Purchaser",
      ],
      //check
      Allowed_Plans: ["pro","vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail","GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'تسجيل اكواد سابقة',
      date:Timestamp.fromDate(DateTime.now())
  ),
  Restriction(
      Short_Description: "External reader.",
      Description: "External reader.",
      Short_Description_Ar: 'القارئ الخارجي',
      Description_Ar:
      "القارئ الخارجي.",
      //check
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Purchaser",
      ],
      //check
      Allowed_Plans: ["pro","vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail","GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'القارئ الخارجي',
      date:Timestamp.fromDate(DateTime.now())
  ),

  //Attendance - departure ....
  Restriction(
      Short_Description: "ٍRٍecord the attendance and departure.",
      Description: "It is used to record the attendance and departure of employees in the store..",
      Short_Description_Ar: 'تسجيل حضور وانصراف',
      Description_Ar:
      "يستخدم لتسجيل حضور- انصراف العاملين في المحل.",

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
      //check
      Allowed_Plans: ["pro","vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail","GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'تسجيل حضور وانصراف',
      date:Timestamp.fromDate(DateTime.now())
  ),
  Restriction(
      Short_Description: "Create an attendance code.",
      Description: "Create an attendance code in order to scan to record the attendance of employees.",
      Short_Description_Ar: 'انشاء كود حضور',
      Description_Ar:
      "إنشاء كود الحضور من أجل المسح لتسجيل حضور العاملين.",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Manager",
        "Marketingmanager",

      ],
      //check
      Allowed_Plans: ["pro","vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail","GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'انشاء كود حضور',
      date:Timestamp.fromDate(DateTime.now())
  ),

  //others ...
  Restriction(
      Short_Description: "Information Center.",
      Description: "The information center includes an explanation of the basic operations, official news, and steps to start using the system..",
      Short_Description_Ar: 'مركز المعلومات',
      Description_Ar:
      "مركز المعلومات يتضمن شرح للعمليات الاساسية ، الاخبار الرسمية و خطوات بدايه استخدام السيستم.",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Manager",
        "Supervisor",
        "Purchaser",
        "Marketingmanager",
        "Cashier",
        "Salesman",


      ],
      //check
      Allowed_Plans: ["basic","pro","vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail","GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'مركز المعلومات',
      date:Timestamp.fromDate(DateTime.now())
  ),
  Restriction(
      Short_Description: "Education and training.",
      Description: "Education and training in which a trial account is created for trading in buying and selling operations.",
      Short_Description_Ar: 'تعليم وتدريب',
      Description_Ar:
      "تعليم وتدريب يتم فيه عمل حساب تجريبي لتريب علي  عمليات البيع و الشراء.",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Manager",
        "Supervisor",
        "Purchaser",
        "Marketingmanager",
        "Cashier",
        "Salesman",


      ],
      //check
      Allowed_Plans: ["basic","pro","vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail","GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'تعليم وتدريب',
      date:Timestamp.fromDate(DateTime.now())
  ),
  Restriction(
      Short_Description: "Version number.",
      Description: "Indicates your application version number.",
      Short_Description_Ar: 'رقم الاصدار',
      Description_Ar:
      "يوضح رقم نسخه التطبيق الخاصة بك .",
      Role_Permission: [
        "Owner",
        "Admin",
        "Accountant",
        "Manager",
        "Supervisor",
        "Purchaser",
        "Marketingmanager",
        "Cashier",
        "Salesman",


      ],
      //check
      Allowed_Plans: ["basic","pro","vip"],
      Store_Type: ["Retail", "Wholesale", "HalfRetail","GoldTrader"],
      Material_Type: ["Gold", "Silver", "Gold_Silver"],
      Photo_Url:"",
      Visible: true,
      Blurred: false,
      Title: 'رقم الاصدار',
      date:Timestamp.fromDate(DateTime.now())
  ),
];
