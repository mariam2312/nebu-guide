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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text(widget.title)),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchDelegateClass(guideProvider.infoBankList),
              );
            },
            icon: const Icon(
              Icons.search,
            ),
          )
        ],
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
class SearchDelegateClass extends SearchDelegate {
  final List<InfoBank> infoBankList;

  SearchDelegateClass(this.infoBankList);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.toLowerCase() == 'new') {
      final suggestions = infoBankList.where((element) => element.Is_New!).toList();
      return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(suggestions[index].Tip_Title ?? ''),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InfoScreen(infoBank: suggestions[index]),
                ),
              );
            },
          );
        },
      );
    } else {
      final suggestions = infoBankList.where((element) {
        final title = element.Tip_Title?.toLowerCase() ?? '';
        final section = element.Tip_Section?.toLowerCase() ?? '';
        final description = element.Tip_Description_Info?.toLowerCase() ?? '';

        return title.contains(query.toLowerCase()) ||
            section.contains(query.toLowerCase()) ||
            description.contains(query.toLowerCase());
      }).toList();
      return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(suggestions[index].Tip_Title ?? ''),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InfoScreen(infoBank: suggestions[index]),
                ),
              );
            },
          );
        },
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.toLowerCase() == 'new') {
      final suggestions = infoBankList.where((element) => element.Is_New!)
          .toList();
      return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(suggestions[index].Tip_Title ?? ''),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(suggestions[index].Tip_Section ?? ''),
                Text(suggestions[index].Tip_Description_Info ?? ''),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      InfoScreen(infoBank: suggestions[index]),
                ),
              );
            },
          );
        },
      );
    } else {
      final suggestions = infoBankList.where((element) {
        final title = element.Tip_Title?.toLowerCase() ?? '';
        final section = element.Tip_Section?.toLowerCase() ?? '';
        final description = element.Tip_Description_Info?.toLowerCase() ?? '';

        return title.contains(query.toLowerCase()) ||
            section.contains(query.toLowerCase()) ||
            description.contains(query.toLowerCase());
      }).toList();
      return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(suggestions[index].Tip_Title ?? ''),
            // subtitle: Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Text(suggestions[index].Tip_Section ?? ''),
            //     Text(suggestions[index].Tip_Description_Info ?? ''),
            //   ],
            // ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      InfoScreen(infoBank: suggestions[index]),
                ),
              );
            },
          );
        },
      );
    }
  }}