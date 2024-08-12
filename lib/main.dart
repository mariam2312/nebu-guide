import 'package:flutter/material.dart';
import 'package:nebu_guid_master/providers/FirestoreDataBase.dart';
import 'package:nebu_guid_master/providers/GuideProvider.dart';
import 'package:nebu_guid_master/screens/Info_Bank_Screen.dart';
import 'package:nebu_guid_master/screens/Restrictions_Screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'models/Info.dart';
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
            InfoBankScreen.id: (context) => InfoBankScreen(),
            RestrictionsScreen.id: (context) => const RestrictionsScreen(),
          }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    var guideProvider = Provider.of<GuideProvider>(context, listen: false);
    final TextEditingController _searchController = TextEditingController();
    List<InfoBank> _searchResults = [];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text(widget.title)),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                _searchController.clear(); // clear the search field
                setState(() {
                  _searchResults = guideProvider.infoBankList; // show all items initially
                });
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true, // allow the sheet to be scrollable
                  builder: (BuildContext context) {
                    return StatefulBuilder(
                      builder: (context, setState) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.8, // adjust the height
                          child: Column(
                            children: [
                              TextField(
                                controller: _searchController,
                                decoration: InputDecoration(
                                  labelText: 'Search in Info Bank',
                                  prefixIcon: Icon(Icons.search),
                                ),
                                onChanged: (text) {
                                  setState(() {
                                    if (text.isEmpty) {
                                      _searchResults = guideProvider.infoBankList;
                                    } else if (text.toLowerCase() == 'new') {
                                      _searchResults = guideProvider.infoBankList.where((element) => element.Is_New == true).toList();
                                    } else {
                                      _searchResults = guideProvider.infoBankList.where((element) {
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
                                  itemCount: _searchResults.length,
                                  itemBuilder: (context, index) {
                                    final item = _searchResults[index];
                                    return Container(
                                      height: 300,
                                      child: Card(
                                        margin: EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 300, // Set the height of the Container
                                          child: ListTile(
                                            contentPadding: EdgeInsets.all(0), // Remove the default padding
                                            leading: Stack(
                                              children: [
                                                Image.asset(
                                                  'Assets/images/iPhone.png', // Use local asset
                                                  width: 200,
                                                  height: 200,
                                                  fit: BoxFit.contain,
                                                ),
                                                Image.asset(
                                                  'Assets/images/openaccount.jpeg', // Use local asset
                                                  width: 200,
                                                  height: 200,
                                                  fit: BoxFit.contain,
                                                ),
                                              ],
                                            ),
                                            title: Text(item.Tip_Title ?? ''),
                                            subtitle: Text(item.Tip_Description_Info ?? ''),
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => InfoScreen(infoBank: _searchResults[index]),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
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


