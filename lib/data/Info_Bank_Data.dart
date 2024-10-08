import '../models/Info.dart';

Map<String, dynamic> infoBank = {
  /// Sales مبيعات
  "SalesMargin": Info(
    Tip_Title: "تغيير المصنعية",
    Tip_Section: "مبيعات",
    Related_Screen: "شاشة المبيعات",
    Tip_Order_Number: '1',
    Tip_Main_Description:
        "  يتم تغيير قيمة المصنعية عن طريق تغيير مكان المؤشر ، تحريكه يمينا تقل المصنعية ،اما يسارا فتزيد المصنعية مع تحديث السعر الاجمالي في نفس الوقت ",
    Tip_Description_Idea:
        " الهدف من تصميم مؤشز تغيير المصنعية هو التسهيل علي المستخدم و ايضا منع الاخطاء الحسابية و منع الحسابات المكررة ",
    Tip_Description_Info:
        " هل تعلم ان متوسط وقت حساب اجمالي قيمة منتج  بالطريقة اليدوية هي ٤٥ ثانية اما عن طريق النظام  فهي ٥ ثوان فقط",
    Tip_Tech_Details: " يمكن تغيير المصنعية حتي و ان اختفت ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  "SalesLimits": Info(
    Tip_Title: "حد المبيعات الاقصي والادني",
    Tip_Section: "مبيعات",
    Related_Screen: "شاشة المبيعات",
    Tip_Order_Number: '2',
    Tip_Main_Description:
        "   يتم تحديد قيمة المصنعية لمبيعات بند ما عن طريق استخدام حدود المبيعات الاقصي و الادني  ",
    Tip_Description_Idea:
        " الهدف هنا هو تنظيم حركة المبيعات و حصر المصنعية بين حدين حتي لا تتم مبيعات باجور مرتفعة تزعج الزبون و ايضا باجور منخفضة تتسبب في خسارة المحل ",
    Tip_Description_Info:
        " هل تعلم ان متوسط عدد بنود الاصناف في كل محل هو ٤٥٠ صنف و لذلك مستحيل علي اي شخص ان يتذكر الاسعار المناسبة لكل بند و ان في الاغلب الجميع يستخدم متوسط غير صحيح",
    Tip_Tech_Details: " ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  "TicketDiscount": Info(
    Tip_Title: "خصم التيكيت",
    Tip_Section: "مبيعات",
    Related_Screen: "شاشة المبيعات",
    Tip_Order_Number: '3',
    Tip_Main_Description:
        "  يتم خصم وزن التيكيت من الاجمالي بشكل تلقائي بمجرد اضافته  ",
    Tip_Description_Idea:
        " الهدف هو تسهيل العمليات الحسابية علي المستخدم و عدم اعادة الحسابات مرة اخري ",
    Tip_Description_Info:
        "هل تعلم ان معظم العملاء ينتظرون خصم التيكيت من البائع و عندها تزداد ثقتهم بالبائع",
    Tip_Tech_Details: " ",

// main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

// material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

// todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

// Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

// roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  "SalesMargin": Info(
    Tip_Title: "تغيير المصنعية",
    Tip_Section: "مبيعات",
    Related_Screen: "شاشة المبيعات",
    Tip_Order_Number: '1',
    Tip_Main_Description:
        "  يتم تغيير قيمة المصنعية عن طريق تغيير مكان المؤشر ، تحريكه يمينا تقل المصنعية ،اما يسارا فتزيد المصنعية مع تحديث السعر الاجمالي في نفس الوقت ",
    Tip_Description_Idea:
        " الهدف من تصميم مؤشز تغيير المصنعية هو التسهيل علي المستخدم و ايضا منع الاخطاء الحسابية و منع الحسابات المكررة ",
    Tip_Description_Info:
        " هل تعلم ان متوسط وقت حساب اجمالي قيمة منتج  بالطريقة اليدوية هي ٤٥ ثانية اما عن طريق النظام  فهي ٥ ثوان فقط",
    Tip_Tech_Details: " يمكن تغيير المصنعية حتي و ان اختفت ",

// main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

// material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

// todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

// Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

// roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  "SalesLimits": Info(
    Tip_Title: "حد المبيعات الاقصي والادني",
    Tip_Section: "مبيعات",
    Related_Screen: "شاشة المبيعات",
    Tip_Order_Number: '2',
    Tip_Main_Description:
        "   يتم تحديد قيمة المصنعية لمبيعات بند ما عن طريق استخدام حدود المبيعات الاقصي و الادني  ",
    Tip_Description_Idea:
        " الهدف هنا هو تنظيم حركة المبيعات و حصر المصنعية بين حدين حتي لا تتم مبيعات باجور مرتفعة تزعج الزبون و ايضا باجور منخفضة تتسبب في خسارة المحل ",
    Tip_Description_Info:
        " هل تعلم ان متوسط عدد بنود الاصناف في كل محل هو ٤٥٠ صنف و لذلك مستحيل علي اي شخص ان يتذكر الاسعار المناسبة لكل بند و ان في الاغلب الجميع يستخدم متوسط غير صحيح",
    Tip_Tech_Details: " ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  "TicketDiscount": Info(
    Tip_Title: "خصم التيكيت",
    Tip_Section: "مبيعات",
    Related_Screen: "شاشة المبيعات",
    Tip_Order_Number: '3',
    Tip_Main_Description:
        "  يتم خصم وزن التيكيت من الاجمالي بشكل تلقائي بمجرد اضافته  ",
    Tip_Description_Idea:
        " الهدف هو تسهيل العمليات الحسابية علي المستخدم و عدم اعادة الحسابات مرة اخري ",
    Tip_Description_Info:
        "هل تعلم ان معظم العملاء ينتظرون خصم التيكيت من البائع و عندها تزداد ثقتهم بالبائع",
    Tip_Tech_Details: " ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  "ReferenceScaleImage": Info(
    Tip_Title: "صورة الميزان المرجعية",
    Tip_Section: "مبيعات",
    Related_Screen: "شاشة المبيعات",
    Tip_Order_Number: '4',
    Tip_Main_Description:
        "  الصورة المرجعية هي صورة المنتج علي الميزان ليتم حفظ تفاصيل المنتج و ارشفة الوزن بشكل لا يقبل الجدال في المراجعة مع الزبون  ",
    Tip_Description_Idea:
        " الهدف هنا هو ايجاد مرجع لا خلاف عليه و الحفاظ علي سمعة المحل من اي تلاعب من بعض العملاء و حفظ حق المحل في كل الاوقات ",
    Tip_Description_Info:
        "هل تعلم ان الصورة المرجعية هي اساس جودة المبيعات  كما ايضا ستساعدك في الفصل في اي خلاف مع اي عميل سريعا",
    Tip_Tech_Details: " ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  "QrcodeScanner": Info(
    Tip_Title: "QR قراءة كود",
    Tip_Section: "مبيعات",
    Related_Screen: "شاشة المبيعات",
    Tip_Order_Number: '5',
    Tip_Main_Description:
        " بمجرد قراءة الكود يتم الحصول علي كافة بيانات المنتج مما ينظم عملية تحديد البيانات للتسعير ",
    Tip_Description_Idea:
        "الهدف هنا هو تسهيل عملية تحديد بيانات المنتج لضمان الجودة و عدم التسبب في خسائر للمحل او للعميل ",
    Tip_Description_Info:
        "هل تعلم ان عدم بيع كل منتج بتفصيله الصحيحة يكلف المحل خسائر فادحة علي مدار العام",
    Tip_Tech_Details: " ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  "GoodsSource": Info(
    Tip_Title: "مصدر البضاعة",
    Tip_Section: "مبيعات",
    Related_Screen: "شاشة المبيعات",
    Tip_Order_Number: '6',
    Tip_Main_Description:
        "عند المبيعات يمكنك تحديد مصدر المبيعات ، ان كانت من البضاعة ام من الكسر ام من انجرارة محل ",
    Tip_Description_Idea:
        "الهدف هنا هو تنظيم مصدر المبيعات حتي يتم تنظيم عملية الجرد و تقفيل يومية الكسر ",
    Tip_Description_Info:
        "هل تعلم ان بتحديد المصدر يتم تحديث البيانات في تقفيل اليومية و تسهيل حساب ارصدة الكسر",
    Tip_Tech_Details: " ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  "ClientData": Info(
    Tip_Title: "بيانات العميل",
    Tip_Section: "مبيعات",
    Related_Screen: "شاشة المبيعات",
    Tip_Order_Number: '7',
    Tip_Main_Description:
        "يتم تسجيل بيانات العميل لكل فاتورة كما يتم تقييم العميل من خلال البائع ",
    Tip_Description_Idea:
        "الهدف هنا هو تسجيل بيانات العملاء لاستخدامها في منظومة ادارة علاقات العملاء ",
    Tip_Description_Info:
        "هل تعلم ان الكثير من الاوقات يتمني البائع فيها  لو كان سجل رقم العميل لمراجعة حسابات المبيعات في حالة وجود اخطاء حسابية",
    Tip_Tech_Details: " ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  "TradeinInSales": Info(
    Tip_Title: "البدل في المبيعات",
    Tip_Section: "مبيعات",
    Related_Screen: "شاشة المبيعات",
    Tip_Order_Number: '8',
    Tip_Main_Description:
        "يمكن تسجيل البدل المباع من العميل في اثناد عملية المبيعات و سيتم حسابه بشكل تلقائي و خصمه من قيمة المبيعات ",
    Tip_Description_Idea:
        "الهدف هنا هو تزويد المستخدم بكل الادوات العملية التي تستخدمها يوميا في البيع و الشراء ",
    Tip_Description_Info:
        "الهدف هنا هو تزويد المستخدم بكل الادوات العملية التي تستخدمها يوميا في البيع و الشراء",
    Tip_Tech_Details: " ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  "SalesTotalPerItem": Info(
    Tip_Title: "تغيير اجمالي(جنيه)",
    Tip_Section: "مبيعات",
    Related_Screen: "شاشة المبيعات",
    Tip_Order_Number: '9',
    Tip_Main_Description:
        " يتم تعديل اجمالي(جنيه) عن طريق الضغط علي زر اجمالي(جنيه) ثم ادخال قيمة بين اقل قيمة واقصي قيمة  ",
    Tip_Description_Idea:
        " الهدف من تغيير الاجمالي بالجنيه هو التسهيل علي المستخدم حساب المصنعية لمنع الاخطاء وتوفير الوقت ",
    Tip_Description_Info:
        " هل تعلم ان متوسط وقت حساب اجمالي قيمة منتج  بالطريقة اليدوية هي ٤٥ ثانية اما عن طريق النظام  فهي ٥ ثوان فقط",
    Tip_Tech_Details: " ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  "ItemPriceDetails": Info(
    Tip_Title: "عرض تفاصيل السعر للبند",
    Tip_Section: "مبيعات",
    Related_Screen: "شاشة المبيعات",
    Tip_Order_Number: '10',
    Tip_Main_Description:
        " يتم عرض تفاصيل السعر للبند عن طريق الضغط علي تفاصيل السعر   ",
    Tip_Description_Idea:
        " الهدف هو عرض اجمالي قيمة الذهب واجمالي قيمة المصنعية واجمالي قيمة الضرايب علي حدا للتوضيح  ",
    Tip_Description_Info:
        "الهدف هو عرض اجمالي قيمة الذهب واجمالي قيمة المصنعية واجمالي قيمة الضرايب علي حدا للتوضيح",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  "ItemSizeChange": Info(
    Tip_Title: "تغيير مقاس البند",
    Tip_Section: "مبيعات",
    Related_Screen: "شاشة المبيعات",
    Tip_Order_Number: '11',
    Tip_Main_Description:
        " يتم تغيير مقاس البند عن طريق الضغط علي تغيير مقاس ثم تفعيل تفعيل الخاصية وإدخال الوزن الصافي بعد التوسيع او التضييق علي الميزان   ",
    Tip_Description_Idea:
        " الهدف هو سهولة توسيع او تضييق اي قطعة ، فاذا كان توسيع فسيخرج وزن الكسر من رصيد الكسر وسيدخل في رصيد البضاعة بشكل لحظي بعد اتمام العملية والعكس صحيح  ",
    Tip_Description_Info:
        "زيادة مقاس: سيتم خروج الزيادة من الكسر مباشرة واضافتها لرصيد البضاعة، تصغير مقاس:سيتم دخول الفرق للكسر،وخروج قيمته من بند البضاعة",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  "SalesItemDeletion": Info(
    Tip_Title: "مسح بند من فاتورة",
    Tip_Section: "مبيعات",
    Related_Screen: "شاشة المبيعات",
    Tip_Order_Number: '12',
    Tip_Main_Description:
        " يتم مسح اي بند من الفاتورة عن طريق الضغط علي ايقونة الفاتورة اعلي يسار الصفحة ستنقلنا الي صفحة تفاصيل الفاتورة ،ثم نختار البند الذي نريد حذفه بالضغط عليه ثم الضغط علي علامة السلة   ",
    Tip_Description_Idea:
        " الهدف هو التسهيل علي المستخدم مسح اي قطعة اذا اراد العميل عدم شرائها او تبديلها بقطعة اخري  ",
    Tip_Description_Info:
        "هل تعلم ان وقت مسح اي بند من الفاتورة لا يستغرق 3 ثواني علي عكس الفواتير الورقية سيتطلب منك الغاء الفاتورة واعادة كتابتها مرة اخري",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  "SalesItemEditData": Info(
    Tip_Title: "تعديل بند من فاتورة",
    Tip_Section: "مبيعات",
    Related_Screen: "شاشة المبيعات",
    Tip_Order_Number: '13',
    Tip_Main_Description:
        " يتم تعديل اي بند من الفاتورة عن طريق الضغط علي ايقونة الفاتورة اعلي يسار الصفحة ستنقلنا الي صفحة تفاصيل الفاتورة ،ثم نختار البند الذي نريد تعديله ثم الضغط علي ايقونة القلم باللون الاخضر ثم تعديل وتعديل البيانات المطلونة ثم الضغط علي اضافة مبيعات بعد التعديل   ",
    Tip_Description_Idea:
        " الهدف هو التسهيل علي المستخدم تعديل اي قطعة اذا اختار العميل قطعة اخري  ",
    Tip_Description_Info:
        "هل تعلم ان وقت تعديل اي بند من الفاتورة لا يستغرق 3 ثواني علي عكس الفواتير الورقية سيتطلب منك الشطب للتعديل او الغاء الفاتورة واعادة كتابتها مرة اخري",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  "SalesItemDeleteData": Info(
    Tip_Title: "مسح بيانات المبيعات",
    Tip_Section: "مبيعات",
    Related_Screen: "شاشة المبيعات",
    Tip_Order_Number: '14',
    Tip_Main_Description:
        " يتم مسح اي بيانات تم ادخالها في صفحة تفاصيل المبيعات عن طريق الضغط علي علامة السلة ",
    Tip_Description_Idea:
        " الهدف هو التسهيل علي المستخدم مسح اي بيانات خاطئة  ",
    Tip_Description_Info:
        "هل تعلم انه يمكنك مسح جميع بيانات المبيعات التي تم ادخالها بضغطة زر بدلا من مسحها واحدة تلو الاخري",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  "GoldbarSerialScan": Info(
    Tip_Title: "scan سيريال السببيكة",
    Tip_Section: "مبيعات",
    Related_Screen: "شاشة المبيعات",
    Tip_Order_Number: '15',
    Tip_Main_Description:
        " يتم عمل (Scan) لسيريال السبيكة عن طريق الضغط علي ايقونة الفاتورة اعلي يسار الصفحة ، ثم اختيار بند السبيكة ثم الضغط علي الايقونة الزرقاء لمسح السيريال    ",
    Tip_Description_Idea:
        " الهدف هو توثيق كود السبيكة علي السيستم وكتابتها علي فاتورة العميل لتفادي الغش  ",
    Tip_Description_Info:
        "هل تعلم ان تسجيل سيريال السبيكة علي السيستم سيحميك لاحقا من اي غش محتمل من قبل اي عميل ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  "PrintInvoice": Info(
    Tip_Title: "طباعة فاتورة",
    Tip_Section: "مبيعات",
    Related_Screen: "شاشة المبيعات",
    Tip_Order_Number: '16',
    Tip_Main_Description:
        " يتم طباعة الفاتورة عن طريق الضغط علي أيقونة الطباعة اعلي يسار الصفحة ، ثم أختيار الطابعة المتصلة بالشبكة ثم اختيار مقاس الورقة (A5) ثم الضغط علي Print لطباعة الفاتورة    ",
    Tip_Description_Idea:
        " الهدف هو اعطاء كل عميل فاتورة خاصة به يسهل عليه قرائتها ولا يوجد بها اي اخطاء املائية أو حسابية ",
    Tip_Description_Info:
        "هل تعلم ان طباعة اي فاتورة لا يستغرق 3 ثواني ولا يوجد بها اخطاء  ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  "ArchiveAnInvoice": Info(
    Tip_Title: "أرشفة الفواتير ",
    Tip_Section: "مبيعات",
    Related_Screen: "شاشة المبيعات",
    Tip_Order_Number: '17',
    Tip_Main_Description:
        " يتم أرشفة الفاتورة عن طريق ادخال بياناتها أولا ثم اضافتها ثم الذهاب لصفحة تفاصيل العميل وادخال البيانات المطلوبة ثم الضغط علي علامة (X) ثم الضغط علي حفظ الفاتورة  ",
    Tip_Description_Idea:
        " الهدف هو التسهيل علي المستخدم حفظ اي فاتورة اذا اراد العميل مغادرة المحل والعودة مرة اخري لاي سبب كان ",
    Tip_Description_Info:
        "هل تعلم ان ارشيف الفواتير يوفر الوقت والجهد للمستخدم ويسهل عليه العودة لاي فاتورة تم أرشفتها مسبقا ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  "InvoicesArchive": Info(
    Tip_Title: "أرشيف الفواتير ",
    Tip_Section: "مبيعات",
    Related_Screen: "شاشة المبيعات",
    Tip_Order_Number: '18',
    Tip_Main_Description:
        " يتم الذهاب إلي ارشيف الفواتير عن طريق الضغط علي الايقونة الزرقاء اعلي يسار الصفحة ثم الضغط علي ارشيف الفواتير ثم الذهاب لاي فاتورة بالأرشيف ",
    Tip_Description_Idea:
        " الهدف هو التسهيل علي المستخدم حفظ اي فاتورة اذا اراد العميل مغادرة المحل والعودة مرة اخري لاي سبب ",
    Tip_Description_Info:
        "هل تعلم ان ارشيف الفواتير يوفر الوقت والجهد للمستخدم ويسهل عليه العودة لاي فاتورة ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  "AddItemToInvoice": Info(
    Tip_Title: "إضافة بند للفاتورة ",
    Tip_Section: "مبيعات",
    Related_Screen: "شاشة المبيعات",
    Tip_Order_Number: '19',
    Tip_Main_Description:
        " يتم إضافة اي بند لفاتورة المبيعات عن طريق الضغط علي اضافة مبيعات ثم الضغط علي تأكيد  ",
    Tip_Description_Idea:
        " الهدف هو التسهيل علي المستخدم اضافة اي بند بسهولة للفاتورة ",
    Tip_Description_Info:
        "هل تعلم ان إضافة اي بند للفاتورة يستغرق وقتا قليلا جدا ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  "PricelistRefresh": Info(
    Tip_Title: "تحديث قايمة الأسعار ",
    Tip_Section: "مبيعات",
    Related_Screen: "شاشة المبيعات",
    Tip_Order_Number: '20',
    Tip_Main_Description:
        " يتم تحديث قايمة الأسعار بشكل يدوي عن طريق النقر مطولا ثم السحب لأسفل ثم الضغط علي تحديث   ",
    Tip_Description_Idea:
        " الهدف هو التسهيل علي المستخدم تحديث قايمة الاسعار يدويا  ",
    Tip_Description_Info:
        "هل تعلم انه يمكنك تحديث قايمة الاسعار يدويا في اقل من ثانية ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  "BarcodeScanner": Info(
    Tip_Title: "مسح الباركود ",
    Tip_Section: "مبيعات",
    Related_Screen: "شاشة المبيعات",
    Tip_Order_Number: '21',
    Tip_Main_Description:
        " يمكنك عمل Scan للباركود بالنقر علي أيقونة الباركود ثم لقط الباركود والضغط علي مسح الكود أو الرقم ثم الضغط علي تأكيد   ",
    Tip_Description_Idea:
        " الهدف هو التسهيل علي المستخدم قراءة الأكواد القديمة بالمحل في اسرع وقت   ",
    Tip_Description_Info:
        "هل تعلم ان السيستم مرن يمكنه قراءة اي كود بسهولة بدون الحاجة لقارئ خارجي وبدون اي تكلفة ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),

  /// Purchase
  'ScrapPurchase': Info(
    Tip_Title: "شراء الكسر",
    Tip_Section: "شراء الكسر",
    Related_Screen: "شاشة شراء الكسر",
    Tip_Order_Number: '1',
    Tip_Main_Description:
        " شراء الكسر يتم تسجيله بنفس طريقة البدل و تصويره ايضا ",
    Tip_Description_Idea:
        " الهدف هو تسجيل البيانات المرجعة لعملية شراء الكسر  ",
    Tip_Description_Info:
        "هل تعلم انت النظام يمكنك من استخراج بيان شراء كسر لزيادة ثقة العملاء ",
    Tip_Tech_Details: "  ",

// main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

// material type , lottie :> animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

// todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

// Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

// roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'CommissionSet': Info(
    Tip_Title: "تغيير العمولة ",
    Tip_Section: "شراء الكسر",
    Related_Screen: "شاشة شراء الكسر",
    Tip_Order_Number: '2',
    Tip_Main_Description:
        " يمكنك تغيير عمولة الشراء بطريقتين اما الضغط علي العمولة وادخال قيمة بين اقل قيمة واكبر قيمة أو الضغط علي عمولة الشراء ثم سحب مؤشر العمولة وتحديد العمولة    ",
    Tip_Description_Idea:
        " الهدف هو التسهيل علي المستخدم تحديد العمولة بأكثر من طريقة   ",
    Tip_Description_Info:
        "هل تعلم انه يمكنك تحديد عمولة الشراء سواء نسبة أو عمولة  ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'PurchaseTotalPerItem': Info(
    Tip_Title: "تغيير اجمالي(جنيه)",
    Tip_Section: "شراء الكسر",
    Related_Screen: "شاشة شراء الكسر",
    Tip_Order_Number: '3',
    Tip_Main_Description:
        " يتم تعديل اجمالي(جنيه) عن طريق الضغط علي زر اجمالي(جنيه) ثم ادخال قيمة بين اقل قيمة واقصي قيمة   ",
    Tip_Description_Idea:
        " الهدف من تغيير الاجمالي بالجنيه هو التسهيل علي المستخدم حساب المصنعية لمنع الاخطاء وتوفير الوقت  ",
    Tip_Description_Info:
        "هل تعلم ان متوسط وقت حساب اجمالي قيمة منتج  بالطريقة اليدوية هي ٤٥ ثانية اما عن طريق النظام  فهي ٥ ثوان فقط  ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'PuchaseItemDeleteData': Info(
    Tip_Title: "مسح بيانات الشراء ",
    Tip_Section: "شراء الكسر",
    Related_Screen: "شاشة شراء الكسر",
    Tip_Order_Number: '4',
    Tip_Main_Description:
        "   يتم مسح اي بيانات تم ادخالها في صفحة تفاصيل الشراء عن طريق الضغط علي علامة السلة  ",
    Tip_Description_Idea:
        " الهدف هو التسهيل علي المستخدم مسح اي بيانات خاطئة   ",
    Tip_Description_Info:
        "هل تعلم انه يمكنك مسح جميع بيانات االشراء التي تم ادخالها بضغطة زر بدلا من مسحها واحدة تلو الاخري  ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'PuchaseItemDeletion': Info(
    Tip_Title: "مسح بند من فاتورة ",
    Tip_Section: "شراء الكسر",
    Related_Screen: "شاشة شراء الكسر",
    Tip_Order_Number: '5',
    Tip_Main_Description:
        " يتم مسح اي بند من الفاتورة عن طريق الضغط علي ايقونة الفاتورة اعلي يسار الصفحة ستنقلنا الي صفحة تفاصيل الفاتورة ،ثم نختار البند الذي نريد حذفه بالضغط عليه ثم الضغط علي علامة السلة   ",
    Tip_Description_Idea:
        " الهدف هو التسهيل علي المستخدم مسح اي قطعة اذا اراد العميل عدم بيعها  ",
    Tip_Description_Info:
        "هل تعلم ان وقت مسح اي بند من الفاتورة لا يستغرق 3 ثواني علي عكس الفواتير الورقية سيتطلب منك الغاء الفاتورة واعادة كتابتها مرة اخري",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'PurchaseItemEditData': Info(
    Tip_Title: "تعديل بند من فاتورة ",
    Tip_Section: "شراء الكسر",
    Related_Screen: "شاشة شراء الكسر",
    Tip_Order_Number: '6',
    Tip_Main_Description:
        " يتم تعديل اي بند من الفاتورة عن طريق الضغط علي ايقونة الفاتورة اعلي يسار الصفحة ستنقلنا الي صفحة تفاصيل الفاتورة ،ثم نختار البند الذي نريد تعديله ثم الضغط علي ايقونة القلم باللون الاخضر ثم تعديل وتعديل البيانات المطلونة ثم الضغط علي اضافة مشتريات بعد التعديل   ",
    Tip_Description_Idea: " الهدف هو التسهيل علي المستخدم تعديل اي قطعة  ",
    Tip_Description_Info:
        "هل تعلم ان وقت تعديل اي بند من الفاتورة لا يستغرق 3 ثواني علي عكس الفواتير الورقية سيتطلب منك الشطب للتعديل او الغاء الفاتورة واعادة كتابتها مرة اخري",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'PurchaseItemPhoto': Info(
    Tip_Title: "الصورة المرجعية للشراء ",
    Tip_Section: "شراء الكسر",
    Related_Screen: "شاشة شراء الكسر",
    Tip_Order_Number: '7',
    Tip_Main_Description:
        " يتم ألتقاط صورة مرجعية للشراء عن طريق الضغط علي ايقونة الفاتورة اعلي يسار الصفحة ستنقلنا الي صفحة تفاصيل الفاتورة ،ثم نختار البند الذي نريد ألتقاط صورة له ثم الضغط علي ايقونة الكاميرا ثم ألتقاط صورة علي الميزان والضغط علي علامة (✓) أعلي يمين الصفحة   ",
    Tip_Description_Idea:
        " الهدف هنا هو ايجاد مرجع لا خلاف عليه والحفاظ علي سمعة المحل من اي تلاعب من بعض العملاء وحفظ حق المحل في كل الأوقات  ",
    Tip_Description_Info:
        "هل تعلم أن الصورة المرجعية هي أساس الجودة كما ايضا ستساعدك في الفصل في اي خلاف مع اي عميل سريعا",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'EnablePurchaseCashback': Info(
    Tip_Title: "تفعيل الاسترداد ",
    Tip_Section: "شراء الكسر",
    Related_Screen: "شاشة شراء الكسر",
    Tip_Order_Number: '8',
    Tip_Main_Description:
        " يتم تفعيل الاسترداد لاسترجاع مبلغ الكاش باك للعميل  ",
    Tip_Description_Idea: " الهدف هنا هو استرجاع الكاش باك للعميل ",
    Tip_Description_Info: "الهدف هنا هو استرجاع الكاش باك للعميل  ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'ChangeScrapStatus': Info(
    Tip_Title: "تغيير حالة الكسر ",
    Tip_Section: "شراء الكسر",
    Related_Screen: "شاشة شراء الكسر",
    Tip_Order_Number: '9',
    Tip_Main_Description:
        " يتم تغيير الحالة لحالة جيدة أو حالة سيئة لمعرفة حالة الكسر  ",
    Tip_Description_Idea:
        " الهدف هنا هو معرفة حالة المنتج ومعرفة هل هو قابل للتجديد ام لا ",
    Tip_Description_Info:
        "الهدف هنا هو معرفة حالة المنتج ومعرفة هل هو قابل للتجديد ام لا  ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'ScrapWeightDiscount': Info(
    Tip_Title: "خصم وزن الكسر",
    Tip_Section: "شراء الكسر",
    Related_Screen: "شاشة شراء الكسر",
    Tip_Order_Number: '10',
    Tip_Main_Description: " يتم خصم وزن اذا كان المنتج به فصوص أو شوائب  ",
    Tip_Description_Idea:
        " الهدف هنا خصم وزن من الكسر لأن المنتج قد يكون به فصوص أو شوائب ",
    Tip_Description_Info: "هل تعلم أن خصم وزن الكسر يخلصك من الخسارة  ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'ClientDetails': Info(
    Tip_Title: "بيانات العميل",
    Tip_Section: "شراء الكسر",
    Related_Screen: "شاشة شراء الكسر",
    Tip_Order_Number: '11',
    Tip_Main_Description:
        " يتم تسجيل بيانات العميل لكل فاتورة كما يتم تقييم العميل من خلال البائع ",
    Tip_Description_Idea:
        " الهدف هنا هو تسجيل بيانات العملاء لاستخدامها في منظومة ادارة علاقات العملاء ",
    Tip_Description_Info:
        "هل تعلم أن الكثير من الاوقات يتمني البائع فيها لو كان سجل رقم العميل لمراجعة حسابات المبيعات في حالة وجود اخطاء حسابية ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'MakeAnEndorsement': Info(
    Tip_Title: "انشاء الاقرار",
    Tip_Section: "شراء الكسر",
    Related_Screen: "شاشة شراء الكسر",
    Tip_Order_Number: '12',
    Tip_Main_Description:
        " يتم عمل الاقرار للحفاظ علس سمعة المحل ولمنع حدوث اي مشاكل مع العملاء لاحقا ",
    Tip_Description_Idea:
        " الهدف هنا هو منع حدوث اي جدال مع العملاء والفصل في اي نزاع لاحقا  ",
    Tip_Description_Info:
        "هل تعلم أن الهدف هنا هو منع حدوث اي جدال مع العملاء والفصل في اي نزاع محتمل ان يحدث لاحقا ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),

  /// Cash Flow
  'CashFlow': Info(
    Tip_Title: "حركة النقدية ",
    Tip_Section: "حركة النقدية",
    Related_Screen: "شاشة النقدية",
    Tip_Order_Number: '1',
    Tip_Main_Description:
        " هنا يتم عمليات دخول و خروج النقدية بابسط طريقة ، لدخول النقدية اضغط دخول و لخروج نقدية اضغط خروج ",
    Tip_Description_Idea:
        " الهدف هنا هو تسهيل عملية تسجيل المصاريف حتي لا يتم نسيان اي بند كما يمكن اضا تصوير اي بيان للتسجيل و الرجوع له اي وقت و من اي مكان  ",
    Tip_Description_Info:
        "هل تعلم ان عدم الالتزام بتسجيل كل المصاريف  ينتج عنه تاخير يومي لكل العاملين مما يكلف المحل في المتوسط ٢٠ يوم في السنة ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),

  /// Scrap Flow
  'ScrapFlow': Info(
    Tip_Title: "حركة الكسر ",
    Tip_Section: "حركة الكسر",
    Related_Screen: "شاشة حركة الكسر",
    Tip_Order_Number: '1',
    Tip_Main_Description:
        " هنا يتم عمليات دخول و خروج الكسر بمختلف عياراته بابسط طريقة ، لدخول الكسر اضغط دخول و لخروج الكسر اضغط خروج ",
    Tip_Description_Idea:
        " الهدف هنا هو تسهيل عملية تسجيل خروج و دخول الكسر و ايضا عمل مرجع  لتفاصيل الكسر لفض اي خلاف  ",
    Tip_Description_Info:
        "هل تعلم انه بنسبة ٤٥ ٪ من الاوقات ما يختلف طرفي تبادل الكسر لوجود قطع غير مطابقة للعيار ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),

  /// Reports
  'SalesApproval': Info(
    Tip_Title: "اعتماد المبيعات",
    Tip_Section: "التقارير",
    Related_Screen: "شاشة تقارير",
    Tip_Order_Number: '1',
    Tip_Main_Description:
        "  يتم مراجعة بيانات العمليات باستخدام الصورة المرجعية للتاكد من صحة المعلومات و اعتماد العمليات ضروري لتقفيل اليومية ",
    Tip_Description_Idea:
        " الهدف هنا هو مراجعة كافة التفاصيل و كآن الادارة متواجدة في تفاصيل كل عملية مع البائع  ",
    Tip_Description_Info:
        "هل تعلم انك تستطيع مراقبة جودة العمليات و ايضا تقييم فريق العمل في كل عملية ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'SalesIncome': Info(
    Tip_Title: "مكسب المبيعات",
    Tip_Section: "التقارير",
    Related_Screen: "شاشة تقارير ",
    Tip_Order_Number: '2',
    Tip_Main_Description:
        "   يتم حساب اجمالي الدخل لكل عملية بعد الاعتماد و يتم عرضها فقط لصاحب المحل ",
    Tip_Description_Idea:
        " الهدف هنا هو مساعدة صاحب المحل في معرفة الدخل الصحيح لكل عملية  ",
    Tip_Description_Info:
        "هل تعلم ان اغلب الاشخاص يتمنون معرفة ارباحهة الحقيقية بدلا من عمل متوسطات غير صحيحة ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'SalesSetBalance': Info(
    Tip_Title: "ترصيد المبيعات",
    Tip_Section: "التقارير",
    Related_Screen: "شاشة تقارير",
    Tip_Order_Number: '3',
    Tip_Main_Description:
        "   بعد اعتماد كل بنود العمليات يمكن الترصيد  في رصيد اليومية ",
    Tip_Description_Idea:
        " الهدف هنا هو ترصيد المعلومات الصحيحة في اليومية بعد المراجعة  ",
    Tip_Description_Info:
        "هل تعلم ان بمجرد ترصيد العمليات ، كآنك كنت حاضر في كل عملية بنفسك و تستطيع ان تفهم طلبات العميل في المبيعات بشكل اوضح ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'SalesTotalInvoice': Info(
    Tip_Title: "اجمالي فاتورة مبيعات",
    Tip_Section: "التقارير",
    Related_Screen: "شاشة تقارير",
    Tip_Order_Number: '4',
    Tip_Main_Description: " مراجعة اجمالي بيع الفاتورة ",
    Tip_Description_Idea: " الهدف هنا هو التعرف علي اجمالي بيع الفاتورة  ",
    Tip_Description_Info: "الهدف هنا هو التعرف علي اجمالي بيع الفاتورة ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'SalesPrintInvoice': Info(
    Tip_Title: "طباعة فاتورة(أصل وطبق الأصل)",
    Tip_Section: "التقارير",
    Related_Screen: "شاشة تقارير",
    Tip_Order_Number: '5',
    Tip_Main_Description: " يمكنك مراجعة تفاصيل بيع االفاتورة ",
    Tip_Description_Idea: " الهدف هنا هو الاطلاع ومراجعة الفاتورة ",
    Tip_Description_Info: "هل تعلم انه يمكنط طباعة فاتورة اصل او طبق الاصل ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'SalesReportsPhotos': Info(
    Tip_Title: "الصورة المرجعية للمبيعات",
    Tip_Section: "التقارير",
    Related_Screen: "شاشة تقارير",
    Tip_Order_Number: '7',
    Tip_Main_Description:
        " الصورة المرجعية هي صورة المنتج علي الميزان مسجلة في تقارير المبيعات لسهولة الرجوع اليها لاحقا   ",
    Tip_Description_Idea:
        " الهدف هنا هو ايجاد مرجع لا خلاف عليه والحفاظ علي سمعة المحل من اي تلاعب من بعض العملاء وحفظ حق المحل في كل الأوقات  ",
    Tip_Description_Info:
        "هل تعلم أن الصورة المرجعية هي أساس الجودة كما ايضا ستساعدك في الفصل في اي خلاف مع اي عميل سريعا",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'SalesPaymentMethods': Info(
    Tip_Title: "معرفة طرق دفع المبيعات",
    Tip_Section: "التقارير",
    Related_Screen: "شاشة تقارير",
    Tip_Order_Number: '8',
    Tip_Main_Description:
        " طرق الدفع التي قام بها العميل سواء كاش او ائتمان او تقسيط أو حساب ",
    Tip_Description_Idea:
        " الهدف هنا هو معرفة طريقة الدفع التي دفع بها العميل ",
    Tip_Description_Info:
        "هل تعلم أن معرفة طرق الدفع تسهل عليك كمستخدم اشياء كثيرة ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'EditSalesReports': Info(
    Tip_Title: "تعديل المبيعات",
    Tip_Section: "التقارير",
    Related_Screen: "شاشة تقارير",
    Tip_Order_Number: '9',
    Tip_Main_Description:
        " تعديل وزن او عيار او مصنع او بند وبند فرعي في حالة حدوث اخطاء ",
    Tip_Description_Idea: " الهدف هنا هو تعديل بيانات اي عملية بيع ",
    Tip_Description_Info: "هل تعلم أنه يمكنك تعديل بيانات اي عملية بيع ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'SalesSource': Info(
    Tip_Title: "معرفة مصدر البضاعة",
    Tip_Section: "التقارير",
    Related_Screen: "شاشة تقارير",
    Tip_Order_Number: '10',
    Tip_Main_Description:
        " معرفة تفاصيل المنتج المباع وكذلك معرفة تفاصيل مصدر البضاعة ",
    Tip_Description_Idea:
        " الهدف هنا هو مراجعة مصدر البضاعة ، اذا كانت جديدة أو كسر ",
    Tip_Description_Info:
        "هل تعلم أنه يمكنك تحديد مصدر البضاعة المباعة جديدة او كسر عند اجراء عملية بيع",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'TradeinDetails': Info(
    Tip_Title: "تفاصيل بيع البدل",
    Tip_Section: "التقارير",
    Related_Screen: "شاشة تقارير",
    Tip_Order_Number: '11',
    Tip_Main_Description: " معرفة تفاصيل بيع البدل ",
    Tip_Description_Idea:
        " الهدف هنا الاطلاع علي جميع تفاصيل البدل (البائع- سعر بيع البدل اثناء عملية البيع -الوزن...الخ)  ",
    Tip_Description_Info: "الاطلاع علي تفاصيل اكثر لعملية البدل ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'ScrapPurchaseDetails': Info(
    Tip_Title: "تفاصيل شراء الكسر",
    Tip_Section: "التقارير",
    Related_Screen: "شاشة تقارير",
    Tip_Order_Number: '12',
    Tip_Main_Description: " معرفة تفاصيل بيع البدل ",
    Tip_Description_Idea:
        " الهدف هنا الاطلاع علي جميع تفاصيل البدل (البائع- سعر بيع البدل اثناء عملية البيع -الوزن...الخ)  ",
    Tip_Description_Info: "الاطلاع علي تفاصيل اكثر لعملية البدل ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'SalesReports': Info(
    Tip_Title: "تقارير المبيعات",
    Tip_Section: "التقارير",
    Related_Screen: "شاشة تقارير",
    Tip_Order_Number: '13',
    Tip_Main_Description: " اظهار جميع التقارير الخاصة بالمبيعات ",
    Tip_Description_Idea:
        " الهدف هنا الاطلاع علي كافة المبيعات اليومية والاسبوعية والشهرية  ",
    Tip_Description_Info:
        "هل تعلم انه يمكنك الاطلاع علي كافة المبيعات بتاريخ قديم جدا ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'TradeinReports': Info(
    Tip_Title: "تقارير البدل",
    Tip_Section: "التقارير",
    Related_Screen: "شاشة تقارير",
    Tip_Order_Number: '14',
    Tip_Main_Description: " اظهار جميع التقارير الخاصة بالبدل ",
    Tip_Description_Idea:
        " الهدف هنا الاطلاع علي كافة عمليات البدل اليومية والاسبوعية والشهرية  ",
    Tip_Description_Info:
        "هل تعلم انه يمكنك الاطلاع علي كافة عمليات البدل في اي وقت ومن اي مكان ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'ScrapReports': Info(
    Tip_Title: "تقارير الكسر",
    Tip_Section: "التقارير",
    Related_Screen: "شاشة تقارير",
    Tip_Order_Number: '14',
    Tip_Main_Description: " اظهار جميع التقارير الخاصة بالكسر  ",
    Tip_Description_Idea: " الهدف هنا الاطلاع علي جميع عمليات الكسر التي تمت ",
    Tip_Description_Info:
        "هل تعلم انه يمكنك الاطلاع علي كافة عمليات الكسر بتفاصيلها في اي وقت ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'CashFlowReports': Info(
    Tip_Title: "تقارير حركة النقدية",
    Tip_Section: "التقارير",
    Related_Screen: "شاشة تقارير",
    Tip_Order_Number: '15',
    Tip_Main_Description: " اظهار جميع التقارير الخاصة بحركة النقدية  ",
    Tip_Description_Idea:
        " الهدف هنا الاطلاع علي جميع عمليات النقدية التي تمت سواء خروج او دخول ",
    Tip_Description_Info: "هل تعلم انه يمكنك الاطلاع علي كافة عمليات النقدية ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'GoodsFlowReports': Info(
    Tip_Title: "تقارير حركة البضاعة",
    Tip_Section: "التقارير",
    Related_Screen: "شاشة تقارير",
    Tip_Order_Number: '15',
    Tip_Main_Description: " اظهار جميع التقارير الخاصة بحركة البضاعة ",
    Tip_Description_Idea:
        " الهدف هنا الاطلاع علي جميع عمليات البضاعة التي تمت سواء خروج او دخول او انجرارة ",
    Tip_Description_Info:
        "هل تعلم انه يمكنك الاطلاع علي كافة عمليات البضاعة من تقارير حركة البضاعة ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'AccountingReports': Info(
    Tip_Title: "تقارير محاسبية",
    Tip_Section: "التقارير",
    Related_Screen: "شاشة تقارير",
    Tip_Order_Number: '15',
    Tip_Main_Description:
        " يمكنك من خلالها الاطلاع وطباعة تقاير ورقية شهرية جاهزة للبضاعة و المبيعات و حركة النقدية و الحجوزات  ",
    Tip_Description_Idea:
        " الهدف هنا الاطلاع علي جميع العمليات الشهرية التي تمت علي مدار الشهر واستخراجها  ",
    Tip_Description_Info:
        "هل تعلم انه يمكنك الاطلاع علي تقاير مفصلة لكافة العمليات التي تمت علي مدار الشهر  ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'InventoryReport': Info(
    Tip_Title: "تقرير الجرد",
    Tip_Section: "التقارير",
    Related_Screen: "شاشة تقارير",
    Tip_Order_Number: '16',
    Tip_Main_Description:
        " يمكنك من خلالها الاطلاع علي تقرير الجرد الخاص ببضاعة المحل بشكل يومي او شهري   ",
    Tip_Description_Idea:
        " الهدف هنا الاطلاع علي تقرير الجرد الخاص ببضاعة المحل بشكل يومي او شهري  ",
    Tip_Description_Info:
        "هل تعلم انه يمكنك الاطلاع علي تقرير الجرد بشكل يومي او شهري   ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),

  /// Basic Interfaces
  /// 1-Main Screen
  'IconsShortcuts': Info(
    Tip_Title: "اختيار ايقونة",
    Tip_Section: "االرئيسية",
    Related_Screen: "الشاشة الرئيسية",
    Tip_Order_Number: '1',
    Tip_Main_Description:
        "  يمكنك اختيار ايقونة من القايمة الرئيسية مثل التقارير-الحسابات المفتوحة-فواتير اليوم-رصيد اليوم-التغطية-الجرد اللحظي .....الخ ",
    Tip_Description_Idea:
        " الهدف هنا هو الوصول لأي خاصية موجودة بالسيستم بسهولة  ",
    Tip_Description_Info:
        "هل تعلم انك تستطيع الوصول لأي خاصية بالسيستم بسهولة من القايمة الرئيسية من الأيقونات ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'StoreName': Info(
    Tip_Title: "معرفة المحل الحالي",
    Tip_Section: "االرئيسية",
    Related_Screen: "الشاشة الرئيسية",
    Tip_Order_Number: '2',
    Tip_Main_Description:
        "  يمكنك معرفة اسم المحل الحالي من القايمة الرئيسية  ",
    Tip_Description_Idea:
        " الهدف هنا هو معرفة اسم المحل المختار بسهولة من القايمة الرئيسية  ",
    Tip_Description_Info:
        "هل تعلم انك تستطيع معرفة المحل المختار الحالي بسهولة ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'GlobalGoldPrice': Info(
    Tip_Title: "معرفة سعر الشاشة",
    Tip_Section: "االرئيسية",
    Related_Screen: "الشاشة الرئيسية",
    Tip_Order_Number: '3',
    Tip_Main_Description:
        "  يمكنك معرفة سعر الشاشة العالمي بالدولار هبوطا او صعودا ، فاذا زاد السعر تضئ الشاشة باللون الاخضر مع سهم اخضر صاعد واذا قل السعر تضئ الشاشة باللون الاحمر مع سهم احمر هابط ",
    Tip_Description_Idea:
        " الهدف هنا هو معرفة سعر الشاشة العالمي بالدولار بشكل لحظي   ",
    Tip_Description_Info:
        "هل تعلم انك تستطيع معرفة سعر الشاشة العالمي بشكل لحظي ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'LocallGoldPriceAndShare': Info(
    Tip_Title: "معرفة سعر الذهب المحلي",
    Tip_Section: "االرئيسية",
    Related_Screen: "الشاشة الرئيسية",
    Tip_Order_Number: '4',
    Tip_Main_Description:
        "  يمكنك معرفة سعر الذهب المحلي الاسترشادي من هذه الشاشة، سعر الشراء وسعر البيع والفرق بينهم وايضا مشاركته مع فريق العمل  ",
    Tip_Description_Idea:
        " الهدف هنا هو معرفة السعر المحلي الذي يعمل عليه السوق الان ومشاركته لفريق العمل ان اردت ذلك ",
    Tip_Description_Info:
        "هل تعلم انك تستطيع معرفة السعر المحلي الذي يعمل عليه جميع تجار الذهب الان في مصر بشكل لحظي لتفادي الخسارة ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'DollarAverageInBanks': Info(
    Tip_Title: "معرفة سعر الدولار بالبنوك",
    Tip_Section: "االرئيسية",
    Related_Screen: "الشاشة الرئيسية",
    Tip_Order_Number: '5',
    Tip_Main_Description: "  يمكنك معرفة متوسط سعر الدولار بالبنوك  ",
    Tip_Description_Idea: " الهدف هنا هو معرفة متوسط سعر الدولار بالبنوك ",
    Tip_Description_Info:
        "هل تعلم انك تستطيع معرفة متوسط سعر الدولار بالبنوك بشكل لحظي ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'DollarInGoldsmiths': Info(
    Tip_Title: "معرفة سعر دولار الصاغة",
    Tip_Section: "االرئيسية",
    Related_Screen: "الشاشة الرئيسية",
    Tip_Order_Number: '6',
    Tip_Main_Description: "  يمكنك معرفة سعر دولار الصاغة  ",
    Tip_Description_Idea: " الهدف هنا هو معرفة سعر دولار الصاغة الان ",
    Tip_Description_Info:
        "هل تعلم انك تستطيع معرفة سعر دولار الصاغة بشكل لحظي ومستمر ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'SystemGoldPriceChangeAndShare': Info(
    Tip_Title: " تغيير سعر الذهب للنظام ومشاركته",
    Tip_Section: "االرئيسية",
    Related_Screen: "الشاشة الرئيسية",
    Tip_Order_Number: '7',
    Tip_Main_Description:
        " يمكنك تغيير سعر الذهب و مشاركته لكل فريق عمل المحل في نفس اللحظة  ",
    Tip_Description_Idea:
        " الهدف هو تسهيل و تنظيم عملية تغيير السعر حتي لا يكون هناك مجال للخسارة نتيجة عدم تغيير السعر ",
    Tip_Description_Info:
        "هل تعلم انه يمكنك ان تنظم عملية البيع و ان تتجنب اي خطأ بشري في عدم تغيير سعر الذهب ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'StartOperations': Info(
    Tip_Title: "الدخول الي العمليات",
    Tip_Section: "االرئيسية",
    Related_Screen: "الشاشة الرئيسية",
    Tip_Order_Number: '8',
    Tip_Main_Description: " يمكنك الدخول الي شاشة العمليات من زر بداية   ",
    Tip_Description_Idea:
        " الهدف هنا معرفة كيفية الدخول الي شاشة العمليات وبدأ تنفيذ عمليات ",
    Tip_Description_Info:
        "هل تعلم انه يمكنك تنفيذ عمليات كثيرة مثل البيع والشراء ودخول وخروج نقدية ودخول وخروج كسر ودخول وخروج بضاعة والكثير من العمليات الاخري ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'DiamondSystemEntry': Info(
    Tip_Title: "الدخول الي نظام الألماظ",
    Tip_Section: "االرئيسية",
    Related_Screen: "الشاشة الرئيسية",
    Tip_Order_Number: '9',
    Tip_Main_Description:
        " يمكنك الدخول الي نظام الألماظ من القايمة الرئيسية   ",
    Tip_Description_Idea:
        " الهدف هنا معرفة كيفية الدخول الي نظام الألماظ من القايمة الرئيسية ",
    Tip_Description_Info:
        "هل تعلم انه يمكنك التحويل بين نظام الذهب ونظام الألماظ بضغطة زر واحدة ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'SystemGoldPriceCopyAndShare': Info(
    Tip_Title: "نسخ ومشاركة سعر الذهب علي وسائل التواصل",
    Tip_Section: "االرئيسية",
    Related_Screen: "الشاشة الرئيسية",
    Tip_Order_Number: '10',
    Tip_Main_Description:
        " يمكنك نسخ سعر الذهب الحالي للمحل ومشاركته للعميل مثلا او اي شخص اخر علي وسائل التواصل الاجتماعي مثل الواتساب  ",
    Tip_Description_Idea:
        " الهدف هنا معرفة كيفية نسخ ومشاركته سعر الذهب الحالي للمحل بسهولة ويسر ",
    Tip_Description_Info:
        "هل تعلم انه يمكنك نسخ ومشاركة سعر الذهب بسهولة جدا عن طريق هذه الخاصية ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'CodeSearch': Info(
    Tip_Title: "بحث عن كود",
    Tip_Section: "االرئيسية",
    Related_Screen: "الشاشة الرئيسية",
    Tip_Order_Number: '11',
    Tip_Main_Description:
        " يمكنك نسخ سعر الذهب الحالي للمحل ومشاركته للعميل مثلا او اي شخص اخر علي وسائل التواصل الاجتماعي مثل الواتساب  ",
    Tip_Description_Idea:
        " الهدف هنا معرفة كيفية نسخ ومشاركته سعر الذهب الحالي للمحل بسهولة ويسر ",
    Tip_Description_Info:
        "هل تعلم انه يمكنك نسخ ومشاركة سعر الذهب بسهولة جدا عن طريق هذه الخاصية ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'QrcodeSearch': Info(
    Tip_Title: "QRcode استعلام",
    Tip_Section: "االرئيسية",
    Related_Screen: "الشاشة الرئيسية",
    Tip_Order_Number: '11',
    Tip_Main_Description: " يمكنك من خلالها الاستعلام عن كود  ",
    Tip_Description_Idea:
        " الهدف هنا الاستعلام عن اي كود في السيستم وعرض تفاصيله من وزن ومصنع وبند وتفاصيل اخري ",
    Tip_Description_Info:
        "هل تعلم انه يمكنك الاستعلام عن اي كود عن طريق Qrcode أو البحث بالرقم ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'BarcodeSearch': Info(
    Tip_Title: "استعلام باركود",
    Tip_Section: "االرئيسية",
    Related_Screen: "الشاشة الرئيسية",
    Tip_Order_Number: '11',
    Tip_Main_Description: " يمكنك من خلالها الاستعلام عن كود  ",
    Tip_Description_Idea:
        " الهدف هنا الاستعلام عن اي كود في السيستم وعرض تفاصيله من وزن ومصنع وبند وتفاصيل اخري ",
    Tip_Description_Info:
        "هل تعلم انه يمكنك الاستعلام عن اي كود عن طريق استعلام Barcode ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'SearchByCode': Info(
    Tip_Title: "بحث بالكود",
    Tip_Section: "االرئيسية",
    Related_Screen: "الشاشة الرئيسية",
    Tip_Order_Number: '11',
    Tip_Main_Description:
        " يمكنك البحث عن اي كود تم تسجيله في السوق الالكتروني سابقا ",
    Tip_Description_Idea: " الهدف هنا الاستعلام عن اي كود في السوق الالكتروني",
    Tip_Description_Info:
        "هل تعلم انه يمكنك الاستعلام عن اي كود عن طريق بحث بالكود  ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'PersonalAccount': Info(
    Tip_Title: "الدخول للحساب الشخصي",
    Tip_Section: "االرئيسية",
    Related_Screen: "الشاشة الرئيسية",
    Tip_Order_Number: '11',
    Tip_Main_Description:
        " يمكنك الدخول ومعرفة تفاصيل حسابك الشخصي مثل الاسم ونوع الحساب والمحمول والايميل وتاريخ التسجيل والمحل الحالي وتفاصيل اخري كثيرة",
    Tip_Description_Idea: " الهدف هنا الاستعلام عن تفاصيل حسابي الشخصي ",
    Tip_Description_Info:
        "هل تعلم انه يمكنك الاستعلام عن كافة تفاصيل حسابك الشخصي من هنا  ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: true,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: false,
    Is_Material_Picture: true,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:"",
        // "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List:['assets/images/openaccount1.jpg',
      'assets/images/openaccount2.jpg',
      'assets/images/openaccount3.jpg',],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'LogoutOfPersonalAccount': Info(

    Tip_Title: "الخروج من الحساب الشخصي",
    Tip_Section: "االرئيسية",
    Related_Screen: "الشاشة الرئيسية",
    Tip_Order_Number: '11',
    Tip_Main_Description:
        " يمكنك الخروج من الحساب الشخصي عن طريق الضغط علي زر خروج",
    Tip_Description_Idea: " الهدف هنا معرفة كيفية الخروج من الحساب الشخصي ",
    Tip_Description_Info:
        "هل تعلم انه يمكنك الخروج من حسابك الشخصي اذا تم تغيير الميل او حدثت اي مشكلة اخري ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: true,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: false,
    Is_Material_Picture: true,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:"",
     //   "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
     Material_Path_List:[
    'assets/images/openaccount2.jpg',
    'assets/images/openaccount3.jpg','assets/images/openaccount1.jpg',],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'PersonalCode': Info(
    Tip_Title: "الكود الشخصي",
    Tip_Section: "االرئيسية",
    Related_Screen: "الشاشة الرئيسية",
    Tip_Order_Number: '11',
    Tip_Main_Description: " يمكنك الدخول ومعرفة الكود الشخصي الخاص بك من هنا ",
    Tip_Description_Idea:
        " الهدف هنا ربط الحساب في محل عن طريق مسح الكود الشخصي من قبل صاحب المحل ",
    Tip_Description_Info:
        "هل تعلم انه يمكن ربطك في اكثر من محل عن طريق الكود الشخصي  ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'ChooseStore': Info(
    Tip_Title: "تغيير المحل",
    Tip_Section: "االرئيسية",
    Related_Screen: "الشاشة الرئيسية",
    Tip_Order_Number: '11',
    Tip_Main_Description: "يمكنك تغيير المحل او اختيار المحل من قائمة المحلات ",
    Tip_Description_Idea: " الهدف هنا هو تغيير او اختيار محل بسهولة ",
    Tip_Description_Info:
        "هل تعلم انه يمكنك تغيير او اختيار محل من هنا بسهولة  ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'ListOfEmployees': Info(
    Tip_Title: "قائمة العاملين",
    Tip_Section: "االرئيسية",
    Related_Screen: "الشاشة الرئيسية",
    Tip_Order_Number: '11',
    Tip_Main_Description: "يمكنك تغيير دور واضافة عاملين جدد للمحل  ",
    Tip_Description_Idea: " الهدف هنا هو تغيير او اختيار محل بسهولة ",
    Tip_Description_Info:
        "هل تعلم انه يمكنك تغيير او اختيار محل من هنا بسهولة  ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'Consumption': Info(
    Tip_Title: "معرفة الاستهلاك",
    Tip_Section: "االرئيسية",
    Related_Screen: "الشاشة الرئيسية",
    Tip_Order_Number: '11',
    Tip_Main_Description:
        "يمكنك معرفة نظامك الحالي وعدد المحلات وعدد فريق العمل وعدد المفوضين ومساحة التخزين من هذه الخاصيه ",
    Tip_Description_Idea: " الهدف هنا هو معرفة تفاصيل النظام والاستهلاك  ",
    Tip_Description_Info:
        "هل تعلم انه يمكنك تغيير او اختيار محل من هنا بسهولة  ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'MonthlyAttendanceAndDeparture': Info(
    Tip_Title: "السجل الشهري الخاص بك للحضور والانصراف",
    Tip_Section: "االرئيسية",
    Related_Screen: "الشاشة الرئيسية",
    Tip_Order_Number: '11',
    Tip_Main_Description:
        "يمكنك معرفة السجل الشهري الخاص بك للحضور والانصراف من هذه الخاصية ",
    Tip_Description_Idea:
        " الهدف هنا هو معرفة تفاصيل الحضور والانصراف الخاصة بك علي مدار الشهر مثل اجمالي وقت الحضور وعدد ايام العمل للشهر  ",
    Tip_Description_Info:
        "هل تعلم انه يمكنك معرفة تفاصيل دقيقة عن حضورك وانصرافك علي مدار الشهر  ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
// باقي استكمال شاشة التحكم التفصيلية

  /// Accounts
  /// Open Accounts
  'GoldCutCalculations': Info(
    Tip_Title: "حسابات القطع",
    Tip_Section: "الحسابات",
    Related_Screen: "حركة القطع اليومية",
    Tip_Order_Number: '1',
    Tip_Main_Description:
        "  الهدف من تنظيم بنود القطع هي اعادة استخدامها في منظومة التغطية و الحفاظ علي تفاصيل القطعيات ",
    Tip_Description_Idea:
        " الهدف من تنظيم بنود القطع هي اعادة استخدامها في منظومة التغطية و الحفاظ علي تفاصيل القطعيات  ",
    Tip_Description_Info:
        "الهدف من تنظيم بنود القطع هي اعادة استخدامها في منظومة التغطية و الحفاظ علي تفاصيل القطعيات ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'ReceiveInOpenAccounts': Info(
    Tip_Title: "استلام(شغل-نقدية-كسر-حوالة)",
    Tip_Section: "الحسابات",
    Related_Screen: "الحسابات المفتوحة",
    Tip_Order_Number: '1',
    Tip_Main_Description:
        "  يمكنك استلام شغل او نقدية او كسر او لوجو او حوالة او سبيكة او مرتجع من ايقونة استلام ",
    Tip_Description_Idea:
        " الهدف هنا هو معرفة كيفية استلام اي شئ في الحسابات المفتوحة  ",
    Tip_Description_Info:
        "الهدف هنا هو معرفة كيفية استلام اي شئ في الحسابات المفتوحة  ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'PayInOpenAccounts': Info(
    Tip_Title: "سداد(شغل-نقدية-كسر-حوالة)",
    Tip_Section: "الحسابات",
    Related_Screen: "الحسابات المفتوحة",
    Tip_Order_Number: '1',
    Tip_Main_Description:
        "  يمكنك سداد شغل او نقدية او كسر او لوجو او حوالة او سبيكة او مرتجع من ايقونة سداد ",
    Tip_Description_Idea:
        " الهدف هنا هو معرفة كيفية سداد اي شئ في الحسابات المفتوحة  ",
    Tip_Description_Info:
        "الهدف هنا هو معرفة كيفية سداد اي شئ في الحسابات المفتوحة  ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'RegisterNewOpenAccount': Info(
    Tip_Title: "تسجيل حساب مفتوح جديد",
    Tip_Section: "الحسابات",
    Related_Screen: "الحسابات المفتوحة",
    Tip_Order_Number: '1',
    Tip_Main_Description:
        "  يمكنك تسجيل حساب مفتوح جديد بسهولة عن طريق ادخال البيانات المطلوبة مثل الاسم ورقم المحمول والمحافظة ونوع الحساب  ",
    Tip_Description_Idea:
        " الهدف هنا هو معرفة كيفية تسجيل حساب مفتوح جديد بسهولة  ",
    Tip_Description_Info:
        "الهدف هنا هو معرفة كيفية تسجيل حساب مفتوح جديد بسهولة  ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  'SearchOpenAccount': Info(
    Tip_Title: "البحث عن حساب مفتوح",
    Tip_Section: "الحسابات",
    Related_Screen: "الحسابات المفتوحة",
    Tip_Order_Number: '1',
    Tip_Main_Description:
        "  يمكنك البحث عن اي حساب مفتوح وسهولة الوصول اليه عن طريق اداة البحث  ",
    Tip_Description_Idea: " الهدف هنا هو سهولة الوصول لاي حساب مفتوح  ",
    Tip_Description_Info:
        "هل تعلم انه يمكنك البحث عن اي حساب مفتوح بطريقتين اما عن طريق الاسم او عن طريق رقم الهاتف  ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: false,
    Is_Material_Picture: true,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:"",
        // "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: ['assets/images/openaccount1.jpg',
      'assets/images/openaccount2.jpg',
      'assets/images/openaccount3.jpg',],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  "FilterOpenAccountByType": Info(
    Tip_Title: "فلترة الحسابات حسب النوع",
    Tip_Section: "الحسابات",
    Related_Screen: "الحسابات المفتوحة",
    Tip_Order_Number: '1',
    Tip_Main_Description:
        "  يمكنك عمل فلترة لحساباتك المفتوحة عن طريق هذه الاداة التي تقسم لك الحسابات حسب نوعها مثل مسوئجي - جملة - مصنع- ورشة - بنوك وهكذا ",
    Tip_Description_Idea:
        " الهدف هنا هو سهولة الوصول لاي حساب مفتوح عن طريق هذه الخاصية  ",
    Tip_Description_Info:
        "هل تعلم انه يمكنك فلترة الحسابات المفتوحة وترتيبها بطريقة منظمة تسهل عليك الوصول لاي حساب تريده ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  "ExtractingReportsForOpenAccounts": Info(
    Tip_Title: "استخراج تقرير اجمالي للحسابات المفتوحة",
    Tip_Section: "الحسابات",
    Related_Screen: "الحسابات المفتوحة",
    Tip_Order_Number: '1',
    Tip_Main_Description:
        "  يمكنك استخراج تقرير اجمالي للحسابات المفتوحة به كل معاملاتك ويمكنك طباعته ",
    Tip_Description_Idea: " الهدف هنا هو طباعة التقرير ومراجعته ",
    Tip_Description_Info:
        "هل تعلم ان التقرير يظهر به اسم الحساب وعدد الحركات التي تمت عليه وتاريخها ونوع الحساب ورصيد النقدية الحالي ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  "PrintOpenAccountReport": Info(
    Tip_Title: "طباعة تقرير حساب مفتوح",
    Tip_Section: "الحسابات",
    Related_Screen: "الحسابات المفتوحة",
    Tip_Order_Number: '1',
    Tip_Main_Description: "  يمكنك استخراج تقرير اي حساب مفتوح وطباعته ",
    Tip_Description_Idea:
        " الهدف هنا هو معرفة كيفية استخراج وطباعة تقرير اي حساب مفتوح ",
    Tip_Description_Info:
        "هل تعلم انه يمكنك طباعة تقرير اجمالي او تقرير سداد فقط او استلام فقط او قطع فقط ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),

  /// Goods
  "NewGoodsEntry": Info(
    Tip_Title: "دخول بضاعة جديدة",
    Tip_Section: "البضاعة",
    Related_Screen: "البضاعة",
    Tip_Order_Number: '1',
    Tip_Main_Description:
        "  يمكنك اضافة بضاعة جديدة (دخول بضاعة) بعيارات مختلفة واخذ صورة مرجعية   ",
    Tip_Description_Idea: " الهدف من هذه الخاصية هو دخول بضاعة للمحل بسهولة ",
    Tip_Description_Info: "هل تعلم انه يمكنك عمل دخول بضاعة جديدة او تيفيت ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  "PreviousGoodsEntry": Info(
    Tip_Title: "دخول بضاعة سابقة",
    Tip_Section: "البضاعة",
    Related_Screen: "البضاعة",
    Tip_Order_Number: '1',
    Tip_Main_Description: "  يمكنك اضافة بضاعة سابقة من اجل التكويد فقط   ",
    Tip_Description_Idea:
        " الهدف من هذه الخاصية هو دخول بضاعة سابقة لهدف التكويد ",
    Tip_Description_Info:
        "هل تعلم ان استخدام هذه الخاصية لن يضيف إلي رصيد البضاعة اي شئ ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  "GoodsTransfer": Info(
    Tip_Title: "تحويل بضاعة",
    Tip_Section: "البضاعة",
    Related_Screen: "البضاعة",
    Tip_Order_Number: '1',
    Tip_Main_Description:
        "  يمكنك تحويل بضاعة من بند لبند عن طريق هذه الخاصية   ",
    Tip_Description_Idea: " الهدف من هذه الخاصية هو تحويل بند الي بند اخر  ",
    Tip_Description_Info:
        "هل تعلم ان استخدام هذه الخاصية يتيح لك تحويل البضاعة من بند لبند اخر",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  "GoodsEntryEngerara": Info(
    Tip_Title: "دخول بضاعة انجرارة",
    Tip_Section: "البضاعة",
    Related_Screen: "البضاعة",
    Tip_Order_Number: '1',
    Tip_Main_Description:
        "  يمكنك عمل دخول لبضاعة انجرارة بين المحلات او انجرارة مع عميل   ",
    Tip_Description_Idea:
        " الهدف من هذه الخاصية هو دخول انجرارة بين محل او عميل يدوي او بالكود  ",
    Tip_Description_Info: "هل تعلم انه يمكنك عمل دخول انجرارة ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  "GoodsBalance": Info(
    Tip_Title: "معرفة ارصدة البضاعة",
    Tip_Section: "البضاعة",
    Related_Screen: "البضاعة",
    Tip_Order_Number: '1',
    Tip_Main_Description:
        "  يمكنك معرفة رصيد البضاعة اجمالي وزن وتحييف عيار 21 واجمالي عدد وعدد المعروض ",
    Tip_Description_Idea: " الهدف هنا هو معرفة رصيد البضاعة بشكل لحظي لأي بند ",
    Tip_Description_Info:
        "هل تعلم انه يمكنك معرفة رصيد بضاعتك بشكل لحظي وجردها يوميا ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  "RecordGoodsInExcel": Info(
    Tip_Title: "تسجيل بضاعة بالاكسيل",
    Tip_Section: "البضاعة",
    Related_Screen: "البضاعة",
    Tip_Order_Number: '1',
    Tip_Main_Description:
        "  يمكنك تسجيل وعمل دخول لبضاعة جديدة عن طريق شيت الاكسيل  ",
    Tip_Description_Idea:
        " الهدف هنا هو عمل دخول للبضاعة بطريقة سريعة توفر الوقت ",
    Tip_Description_Info:
        "هل تعلم انه يمكنك عمل دخول لبضاعتك عن طريق شيت اكسيل ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),

  /// Lists And Prices
  "PricelistEntry": Info(
    Tip_Title: "الدخول لقايمة الاسعار",
    Tip_Section: "القوائم",
    Related_Screen: "القوائم",
    Tip_Order_Number: '1',
    Tip_Main_Description:
        "  يمكنك الدخول لقايمة الاسعار وتعديل اسعارك من هنا   ",
    Tip_Description_Idea: " الهدف من هذه الخاصية هو دخول بضاعة للمحل بسهولة ",
    Tip_Description_Info: "هل تعلم انه يمكنك عمل دخول لبضاعتك بخاصية الاكسيل  ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  "CreateNewPricelist": Info(
    Tip_Title: "انشاء قايمة أسعار جديدة",
    Tip_Section: "القوائم",
    Related_Screen: "القوائم",
    Tip_Order_Number: '1',
    Tip_Main_Description:
        "  يمكنك انشاء قايمة اسعار بكل بساطة عن طريق ادخال اسم المورد و العيار ومنشأ المورد    ",
    Tip_Description_Idea:
        " الهدف من هذه الخاصية هو اضافة مورد جديد لقايمة الاسعار بشكل يدوي  ",
    Tip_Description_Info: "هل تعلم انه يمكنك ادخال مورد جديد بعيارات مختلفة  ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  "DeleteSupplierFromPricelist": Info(
    Tip_Title: "مسح مورد من قايمة الأسعار",
    Tip_Section: "القوائم",
    Related_Screen: "القوائم",
    Tip_Order_Number: '1',
    Tip_Main_Description: "  يمكنك مسح مورد من قايمة الاسعار    ",
    Tip_Description_Idea:
        " الهدف من هذه الخاصية هو مسح اي مورد من قايمة الاسعار بشكل يدوي  ",
    Tip_Description_Info:
        "هل تعلم انه يمكنك مسح اي مورد من قايمة الاسعار في اقل من 3 ثواني  ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  "ExtractExcelReportForPriceList": Info(
    Tip_Title: "إستخراج تقرير اكسيل لقايمة الاسعار",
    Tip_Section: "القوائم",
    Related_Screen: "القوائم",
    Tip_Order_Number: '1',
    Tip_Main_Description: "  يمكنك استخراج تقرير اكسيل من قائمة الاسعار ",
    Tip_Description_Idea:
        " الهدف من هذه الخاصية هو استخراج كل الموردين وكل البنود في قايمة الاسعار بسهولة ",
    Tip_Description_Info:
        "هل تعلم انه يمكنك استخراج شيت اكسيل به كل اسعار الموردين في اقل من 3 ثواني  ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  "PrintAllPriceLists": Info(
    Tip_Title: "طباعة كل قوائم الاسعار",
    Tip_Section: "القوائم",
    Related_Screen: "القوائم",
    Tip_Order_Number: '1',
    Tip_Main_Description: "  يمكنك طباعة كل قوائم الاسعار ",
    Tip_Description_Idea: " الهدف من هذه الخاصية هو طباعة كل الاسعار  ",
    Tip_Description_Info:
        "هل تعلم انه يمكنك طباعة كل قوائم الاسعار للاطلاع عليها بضغطة زر ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  "PrintASupplierSpecificPriceList": Info(
    Tip_Title: "طباعة قائمة اسعار خاصة بمورد",
    Tip_Section: "القوائم",
    Related_Screen: "القوائم",
    Tip_Order_Number: '1',
    Tip_Main_Description:
        "  يمكنك طباعة قايمة اسعار خاصة بمورد من هذه الخاصية ",
    Tip_Description_Idea:
        " الهدف من هذه الخاصية هو طباعة قائمة اسعار خاصة بمورد  ",
    Tip_Description_Info:
        "هل تعلم انه يمكنك طباعة قائمة اسعار خاصة بمورد واحد فقط  ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  "AddASubitemToThePriceList": Info(
    Tip_Title: "اضافة بند فرعي لقايمة الاسعار",
    Tip_Section: "القوائم",
    Related_Screen: "القوائم",
    Tip_Order_Number: '1',
    Tip_Main_Description:
        "  يمكنك اضافة بند فرعي جديد لاي مورد عن طريق هذه الخاصية  ",
    Tip_Description_Idea: " الهدف من هذه الخاصية هو اضافة بند فرعي للمورد  ",
    Tip_Description_Info:
        "هل تعلم انه يمكنك اضافة بند فرعي جديد لاي مورد تريده ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  "EditAndDeleteASubitemToThePriceList": Info(
    Tip_Title: "مسح وتعديل بند فرعي لقايمة الاسعار",
    Tip_Section: "القوائم",
    Related_Screen: "القوائم",
    Tip_Order_Number: '1',
    Tip_Main_Description: "  يمكنك مسح وتعديل  لاي مورد عن طريق هذه الخاصية  ",
    Tip_Description_Idea:
        " الهدف من هذه الخاصية هو مسح وتعديل اي بند فرعي للمورد  ",
    Tip_Description_Info: "هل تعلم انه يمكنك مسح وتعديل لأي بند فرعي  للمورد ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  "ShowPricesOfAllSubitemsOfTheSupplier": Info(
    Tip_Title: "اظهار اسعار كل البنود الفرعية للمورد ",
    Tip_Section: "القوائم",
    Related_Screen: "القوائم",
    Tip_Order_Number: '1',
    Tip_Main_Description:
        "  يمكنك اظهار اسعار كل البنود الفرعية للمورد عن طريق هذه الخاصية  ",
    Tip_Description_Idea:
        " الهدف من هذه الخاصية هو اظهار اسعار كل البنود الفرعية للمورد  ",
    Tip_Description_Info:
        "هل تعلم انه يمكنك اظهار اسعار كل البنود الفرعية للمورد ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  "ReceiveApriceListFromAnotherStore": Info(
    Tip_Title: "إستقبال قائمة اسعار من محل اخر ",
    Tip_Section: "القوائم",
    Related_Screen: "القوائم",
    Tip_Order_Number: '1',
    Tip_Main_Description:
        "  يمكنك استقبال قائمة اسعار من محل اخر عن طريق هذه الخاصية  ",
    Tip_Description_Idea:
        " الهدف من هذه الخاصية هواستقبال قائمة اسعار من محل اخر  ",
    Tip_Description_Info: "هل تعلم انه يمكنك استقبال قائمة اسعار من محل اخر ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  "SharePriceListWithTeam": Info(
    Tip_Title: "مشاركة قائمة الاسعار لفريق العمل ",
    Tip_Section: "القوائم",
    Related_Screen: "القوائم",
    Tip_Order_Number: '1',
    Tip_Main_Description:
        "  يمكنك مشاركة قايمة الاسعار مع فريق العمل عن طريق هذه الخاصية ",
    Tip_Description_Idea:
        " الهدف من هذه الخاصية هو مشاركة قايمة الاسعار مع فريق العمل ",
    Tip_Description_Info:
        "هل تعلم انه يمكنك مشاركة قايمة الاسعار مع فريق العمل ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  "DownloadPricelist": Info(
    Tip_Title: "تحميل قايمة الاسعار",
    Tip_Section: "القوائم",
    Related_Screen: "القوائم",
    Tip_Order_Number: '1',
    Tip_Main_Description: "  يمكنك تحميل قايمة الاسعار عن طريق هذه الخاصية ",
    Tip_Description_Idea: " الهدف من هذه الخاصية هو تحميل قايمة الاسعار ",
    Tip_Description_Info: "هل تعلم انه يمكنك تحميل قايمة الاسعار بسهولة ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  "IncreaseThePriceOfAllItemsByTheSameAmountForAllSuppliers": Info(
    Tip_Title: " زيادة سعر كل البنود بنفس العيار لكل الموردين ",
    Tip_Section: "القوائم",
    Related_Screen: "القوائم",
    Tip_Order_Number: '1',
    Tip_Main_Description: "  يمكنك تحميل قايمة الاسعار عن طريق هذه الخاصية ",
    Tip_Description_Idea: " الهدف من هذه الخاصية هو تحميل قايمة الاسعار ",
    Tip_Description_Info: "هل تعلم انه يمكنك تحميل قايمة الاسعار بسهولة ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: true,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  "RegisterApriceListInExcel": Info(
    Tip_Title: "تسجيل قائمة اسعار بالاكسيل",
    Tip_Section: "القوائم",
    Related_Screen: "القوائم",
    Tip_Order_Number: '1',
    Tip_Main_Description:
        "  يمكنك تسجيل قائمة اسعار بالاكسيلعن طريق هذه الخاصية ",
    Tip_Description_Idea:
        " الهدف من هذه الخاصية هو تسجيل قائمة اسعار بالاكسيل ",
    Tip_Description_Info:
        "هل تعلم انه يمكنك تسجيل قائمة اسعار بالاكسيل بسهولة ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: true,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),

  ///Customer Management
  "CustomerRecord": Info(
    Tip_Title: "البحث عن تفاصيل فاتورة سابقة برقم العميل",
    Tip_Section: "القوائم",
    Related_Screen: "القوائم",
    Tip_Order_Number: '1',
    Tip_Main_Description: "  يمكنك البحث عن تفاصيل فاتورة سابقة برقم العميل   ",
    Tip_Description_Idea:
        " الهدف هنا هو البحث عن تفاصيل اي فواتير سابقة للعميل برقم الموبايل ",
    Tip_Description_Info:
        "هل تعلم انه يمكن عرض 20 فاتورة لعملية البحث الواحدة  ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: true,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  "ExportMonthlyCustomerRecordInExcel": Info(
    Tip_Title: "تصدير شيت اكسيل بسجل العملاء الشهري ",
    Tip_Section: "القوائم",
    Related_Screen: "القوائم",
    Tip_Order_Number: '1',
    Tip_Main_Description:
        "  يمكنك تصدير سجل العملاء علي مدار الشهر بصيغة الاكسيل   ",
    Tip_Description_Idea:
        " الهدف هنا هو تصدير سجل العملاء الشهري بتفاصيله في شيت اكسيل  ",
    Tip_Description_Info:
        "هل تعلم انه يمكنك تصدير شيت اكسيل لسجل العملاء لأي شهر   ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: true,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  "ExportCompleteCustomerRecordInExcel": Info(
    Tip_Title: "تصدير شيت اكسيل بسجل العملاء الكامل ",
    Tip_Section: "القوائم",
    Related_Screen: "القوائم",
    Tip_Order_Number: '1',
    Tip_Main_Description: "  يمكنك تصدير سجل العملاء الكامل بصيغة الاكسيل   ",
    Tip_Description_Idea:
        " الهدف هنا هو تصدير سجل كل العملاء الذين سبق لهم التعامل مع المحل في شيت اكسيل للتواصل معهم   ",
    Tip_Description_Info:
        "هل تعلم انه يمكنك ارسال عروض للعملاء من خلال هذه الخاصيه ومراسلتعم علي الواتساب بالعروض المتاحة  ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: true,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),

  /// Daily Balance
  "DailyClosing": Info(
    Tip_Title: "تقفيل اليومية",
    Tip_Section: "اليومية",
    Related_Screen: "رصيد اليوم",
    Tip_Order_Number: '1',
    Tip_Main_Description:
        " بعد ترصيد العمليات اليومية و ترصيد الكسر و النقدية ، يتم تقفيل اليومية و استعراض الدخل و العجز ان وجد ",
    Tip_Description_Idea:
        " الهدف هنا هو تسهيل عملية التقفيل و منع الحسابات المكررة و الاخطاء التي تستهلك وقت و مجهود كبير ",
    Tip_Description_Info:
        "هل تعلم ان النظام يستعرض فقط للمدير قيمة العجز فقط اما لصاحب المحل فيستعرض كافة التفاصيل",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: true,
    Is_Official: false,
    Is_Step_By_Step: false,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),
  "SetBalance": Info(
    Tip_Title: "الترصيد",
    Tip_Section: "اليومية",
    Related_Screen: "رصيد اليوم",
    Tip_Order_Number: '1',
    Tip_Main_Description: " يمكنك ترصيد جميع العمليات من رصيد اليوم  ",
    Tip_Description_Idea: " الهدف هنا هو ترصيد جميع عملياتك علي مدار اليوم ",
    Tip_Description_Info:
        "هل تعلم انه يمكنك ترصيد جميع العمليات التي تمت علي مدار اليوم بضغطة زر ",
    Tip_Tech_Details: "  ",

    // main info type
    Is_Basic: true,
    Is_New: false,
    Is_FAQ: false,
    Is_Official: false,
    Is_Step_By_Step: true,

    // material type , lottie => animation
    Is_Material_Lottie: true,
    Is_Material_Picture: false,
    Is_Material_YouTube: false,

    // todo development part
    Related_App_Screen: "Sales_Screen",
    Material_Path:
        "https://firebasestorage.googleapis.com/v0/b/nebu-6ff28.appspot.com/o/tips%2Fmargin_slider_compressed.json?alt=media&token=9b35877b-1d5b-4eb6-84aa-a7135b81b72a",
    Material_Path_List: [],
    Android_Ver: 133,
    IOS_Ver: 94,

    // Fixed values do not change
    Is_Optional: false,
    Is_Required: true,
    Is_Take_Time: false,
    Is_ComingSoon: false,

    // roles
    Is_For_Admin: true,
    Is_For_SalesTeam: true,
    Is_ForOwner: true,
  ),


"FAQ1":Info (
Material_Path:"",
Material_Path_List: [],
Tip_Title: "هل هناك نسخة تجريبية من نظام نيبو ؟",
//details
Tip_Main_Description: "نعم هناك نسخة تجريبية من نظام نيبو صالحة لمدة ٧ ايام",
Tip_Order_Number: "8",

// material
Is_Material_Lottie: false ,
Is_Material_Picture: false,
Is_Material_YouTube: false,

// basic types
Is_Step_By_Step: false,
Is_New: false,
Is_Basic: false ,
Is_FAQ: true,
Is_Official: false,
  Tip_Section: '', Related_Screen: '', Related_App_Screen: '', Is_ForOwner: null, Is_For_Admin: null, Is_For_SalesTeam: null, Android_Ver: null, IOS_Ver: null,
),
  "FAQ2":Info (
Material_Path:"",
Material_Path_List: [],
Tip_Title: "كيف ابيع حلق عيار ٢١؟",
//details
Tip_Main_Description: "ادخل علي مبيعات و اختار مصنع و عيار.",
Tip_Order_Number: "8",

// material
Is_Material_Lottie: false ,
Is_Material_Picture: false,
Is_Material_YouTube: false,

// basic types
Is_Step_By_Step: false,
Is_New: false,
Is_Basic: false ,
Is_FAQ: true,
Is_Official: false,
  Tip_Section: '', Related_Screen: '', Related_App_Screen: '', Is_ForOwner: null, Is_For_Admin: null, Is_For_SalesTeam: null, Android_Ver: null, IOS_Ver: null,
)

};
