import 'package:flutter/material.dart';
import 'package:nebu_guid_master/providers/FirestoreDataBase.dart';
import 'package:nebu_guid_master/providers/GuideProvider.dart';
import 'package:nebu_guid_master/screens/InfoSectionScreen.dart';
import 'package:nebu_guid_master/screens/Info_Bank_Screen.dart';
import 'package:nebu_guid_master/screens/Restrictions_Screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'models/Info.dart';
import 'screens/Info_Details_Screen.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GuideProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FirestoreDataBase(),
        ),
      ],
      child: MaterialApp(
          title: 'NEBU GUIDE',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: const Color(0xff212D45)),
            useMaterial3: true,
          ),
          home: const MyHomePage(title: 'NEBU Guide'),
          routes: {
            MyHomePage.id: (context) => const MyHomePage(title: 'NEBU Guide'),
            InfoBankScreen.id: (context) => const InfoBankScreen(),
            RestrictionsScreen.id: (context) => const RestrictionsScreen(),
            InfoDetailsScreen.id: (context) => InfoDetailsScreen(
              isForAppOfficialFAQ: true,
              isForAppOfficialInfoTip: true,
              isForAppTips: true,
              tips: const [],
            ),          }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  static String id = "MyHomePage";
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    var guideProvider = Provider.of<GuideProvider>(context, listen: false);
    final TextEditingController searchController = TextEditingController();
    List<Info> searchResults = [];
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text(widget.title)),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                searchController.clear(); // clear the search field
                setState(() {
                  searchResults = guideProvider.allInfo; // show all items initially
                });
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true, // allow the sheet to be scrollable
                  builder: (BuildContext context) {
                    return StatefulBuilder(
                      builder: (context, setState) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.8, // adjust the height
                          child: Column(
                            children: [
                              TextField(
                                controller: searchController,
                                decoration: const InputDecoration(
                                  labelText: 'Search in Info Bank',
                                  prefixIcon: Icon(Icons.search),
                                ),
                                onChanged: (text) {
                                  setState(() {
                                    if (text.isEmpty) {
                                      searchResults = guideProvider.allInfo;
                                    } else if (text.toLowerCase() == 'new') {
                                      searchResults = guideProvider.allInfo.where((element) => element.Is_New == true).toList();
                                    } else {
                                      searchResults = guideProvider.allInfo.where((element) {
                                        final title = element.Tip_Title?.toLowerCase() ?? '';
                                        final section = element.Tip_Section?.toLowerCase() ?? '';
                                        final description = element.Tip_Description_Info?.toLowerCase() ?? '';

                                        return title.contains(text.toLowerCase()) ||
                                            section.contains(text.toLowerCase()) ||
                                            description.contains(text.toLowerCase());
                                      }).toList();
                                    }
                                  });
                                },
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: searchResults.length,
                                  itemBuilder: (context, index) {
                                    final item = searchResults[index];
                                    return  GestureDetector(
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        height: 300,
                                        child: Card(
                                          margin: const EdgeInsets.all(10),
                                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [

                                              SizedBox(width: width/2.5,
                                                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [

                                                    Text(item.Tip_Title ?? '',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),

                                                    Text(item.Tip_Description_Info ?? '',style: TextStyle( fontSize: 16),),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 250, width: width/2.5,
                                                child: Stack(
                                                  children: [

                                                    Positioned(
                                                      top: 7,
                                                      left: 18,
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(20),
                                                        child: Image.asset(
                                                          'assets/images/openaccount1.jpg',
                                                          height: 230,
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    ), Image.asset(
                                                      'assets/images/mobleIphone.png', // Use local asset
                                                      height: 250,

                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                        onTap: () {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => InfoScreen(infoBank: searchResults[index]),
    ));}
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ]
    ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RestrictionsScreen.id);
                    },
                    child: Container(
                        height: MediaQuery.of(context).size.width / 2.2,
                        width: MediaQuery.of(context).size.width / 2.2,
                        decoration: BoxDecoration(color: Colors.yellow[700]),
                        child: const Center(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Restrictions"),
                        ))),
                  ),
                )),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, InfoBankScreen.id);
                    },
                    child: SizedBox(
                        height: MediaQuery.of(context).size.width / 2.2,
                        width: MediaQuery.of(context).size.width / 2.2,
                        child: Container(
                            decoration:
                                BoxDecoration(color: Colors.yellow[700]),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(child: Text("Info Bank")),
                            ))),
                  ),
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}


