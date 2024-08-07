import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nebu_guid_master/providers/FirestoreDataBase.dart';
import 'package:nebu_guid_master/providers/GuideProvider.dart';
import 'package:nebu_guid_master/screens/Info_Bank_Screen.dart';
import 'package:nebu_guid_master/screens/Restrictions_Screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  /// todo add firebase project config and init.

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
            RestrictionsScreen.id: (context) => RestrictionsScreen(),
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
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
