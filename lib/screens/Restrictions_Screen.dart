import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:provider/provider.dart';

import '../data/Restrictions_Data.dart';
import '../models/Restriction.dart';
import '../providers/FirestoreDataBase.dart';
import '../providers/GuideProvider.dart';

class RestrictionsScreen extends StatefulWidget {
  static String id = "RestrictionsScreen";
  const RestrictionsScreen({super.key});

  @override
  State<RestrictionsScreen> createState() => _InfoBankScreenState();
}

class _InfoBankScreenState extends State<RestrictionsScreen> {
  List<Restriction> restrictionsList = [];
  //stream and subscription
  StreamSubscription<DocumentSnapshot>? restrictionsSubscription;
  Stream<DocumentSnapshot>? restrictionsStream;

  void callStream() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //get data from database as stream
      var database = Provider.of<FirestoreDataBase>(context, listen: false);
      var guideProvider = Provider.of<GuideProvider>(context, listen: false);
      // stream
      restrictionsStream = database.allRestrictionsStream();

      // listen
      restrictionsSubscription = restrictionsStream?.listen((event) {
        if (event.exists) {
          Map<String, dynamic> bigMap = event.data() as Map<String, dynamic>;
          Map<String, dynamic> allRestrictionsData = bigMap['restrictions'];

          List<Restriction> restrictionList = [];

          // Iterate over the allRestrictionsData map
          allRestrictionsData.forEach((key, value) {
            Restriction restriction = Restriction.fromMap(value);
            restrictionList.add(restriction);
          });

          setState(() {
            restrictionsList = restrictionList;
            guideProvider.setRestrictionList(restrictionList: restrictionList);
          });
        }
      });
    });
  }

  Future<void> restrictionsToFirestore() async {
    final CollectionReference restrictionsDataCollection =
        FirebaseFirestore.instance.collection('RestrictionsData');
    final Map<String, dynamic> bigMap = {'restrictions': {}};
    for (var restriction in restrictions) {
      final Map<String, dynamic> restrictionMap =
          restriction.toMap(Path: 'RestrictionsData/AllRestrictionsData');
      bigMap['restrictions'][restriction.Title!] = restrictionMap;
    }
    await restrictionsDataCollection.doc('AllRestrictionsData').set(bigMap);
  }

  Future<void> deleteAllRestrictionsToFirestore() async {
    final CollectionReference restrictionsDataCollection =
        FirebaseFirestore.instance.collection('RestrictionsData');
    // Get all documents in the collection
    QuerySnapshot snapshot = await restrictionsDataCollection.get();
    // Loop through the documents and delete each one
    for (DocumentSnapshot document in snapshot.docs) {
      await document.reference.delete();
    }
    // Clear the restrictionsList in the GuideProvider
    var guideProvider = Provider.of<GuideProvider>(context, listen: false);
    guideProvider.clearRestrictionsList();
  }

  @override
  void initState() {
    super.initState();
    callStream();
  }

  void cancelAllSubscriptions() {
    restrictionsSubscription?.cancel();
    debugPrint(" Cancel Subscriptions !!! ");
  }

  @override
  void dispose() {
    cancelAllSubscriptions();
    super.dispose();
  }

  @override
  void deactivate() {
    cancelAllSubscriptions();
    super.deactivate();
  }

  bool isTodaysRestriction(Restriction restriction) {
    if (restriction.date == null) {
      return false;
    }

    // Convert Timestamp to DateTime
    final restrictionDate = restriction.date!.toDate();

    // Get today's date
    final today = DateTime.now();

    // Compare year, month, and day
    return today.year == restrictionDate.year &&
        today.month == restrictionDate.month &&
        today.day == restrictionDate.day;
  }

  bool isCurrentMonthRestriction(Restriction restriction) {
    if (restriction.date == null) {
      return false;
    }

    // Convert Timestamp to DateTime
    final restrictionDate = restriction.date!.toDate();

    // Get current month and year
    final currentMonth = DateTime.now().month;
    final currentYear = DateTime.now().year;

    // Compare year and month
    return currentYear == restrictionDate.year &&
        currentMonth == restrictionDate.month;
  }

  Future<List<String>?> showRoleSelectionDialog(
      BuildContext context, List<String> allRoles) async {
    List<String> selectedRoles = [];
    bool selectAllRestrictions = false;
    bool selectTodaysRestrictions = false;
    bool selectMonthRestrictions = false;
    bool selectVip = false;
    bool selectPro = false;
    bool selectBasic = false;
    bool selectAll = false;
    return showDialog<List<String>>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: const Center(child: Text('Select Restrictions')),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    CheckboxListTile(
                      title: const Text('All Restrictions'),
                      value: selectAllRestrictions,
                      controlAffinity: ListTileControlAffinity.leading,
                      checkColor: Colors.white,
                      activeColor: Colors.green,
                      onChanged: (bool? checked) {
                        setState(() {
                          selectAllRestrictions = checked ?? false;
                          if (selectAllRestrictions) {
                            selectedRoles
                                .clear(); // Clear selected roles if 'All Restrictions' is checked
                            selectTodaysRestrictions = false;
                            selectMonthRestrictions = false;
                            selectVip = false;
                            selectPro = false;
                            selectBasic = false;
                            selectAll = false;
                          }
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text('All Rolles'),
                      value: selectAll,
                      controlAffinity: ListTileControlAffinity.leading,
                      checkColor: Colors.white,
                      activeColor: Colors.green,
                      onChanged: (bool? checked) {
                        setState(() {
                          selectAll = checked ?? false;
                          if (selectAll) {
                            selectedRoles = List.from(allRoles);
                            selectAllRestrictions = false;
                            selectAllRestrictions = false;
                            selectMonthRestrictions = false;
                            selectVip = false;
                            selectPro = false;
                            selectBasic = false;
                          } else {
                            selectedRoles.clear();
                          }
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text('Today\'s Restrictions'),
                      value: selectTodaysRestrictions,
                      controlAffinity: ListTileControlAffinity.leading,
                      checkColor: Colors.white,
                      activeColor: Colors.green,
                      onChanged: (bool? checked) {
                        setState(() {
                          selectTodaysRestrictions = checked ?? false;
                          if (selectTodaysRestrictions) {
                            selectedRoles
                                .clear(); // Clear selected roles if 'Today\'s Restrictions' is checked
                            selectAllRestrictions = false;
                            selectMonthRestrictions = false;
                            selectVip = false;
                            selectPro = false;
                            selectBasic = false;
                            selectAll = false;
                          }
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text('Month\'s Restrictions'),
                      value: selectMonthRestrictions,
                      controlAffinity: ListTileControlAffinity.leading,
                      checkColor: Colors.white,
                      activeColor: Colors.green,
                      onChanged: (bool? checked) {
                        setState(() {
                          selectMonthRestrictions = checked ?? false;
                          if (selectMonthRestrictions) {
                            selectedRoles
                                .clear(); // Clear selected roles if 'Month\'s Restrictions' is checked
                            selectAllRestrictions = false;
                            selectTodaysRestrictions = false;
                            selectVip = false;
                            selectPro = false;
                            selectBasic = false;
                            selectAll = false;
                          }
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text('VIP'),
                      value: selectVip,
                      controlAffinity: ListTileControlAffinity.leading,
                      checkColor: Colors.white,
                      activeColor: Colors.green,
                      onChanged: (bool? checked) {
                        setState(() {
                          selectVip = checked ?? false;
                          if (selectVip) {
                            selectedRoles.clear();
                            selectAllRestrictions = false;
                            selectTodaysRestrictions = false;
                            selectMonthRestrictions = false;
                            selectPro = false;
                            selectBasic = false;
                            selectAll = false;
                          }
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text('PRO'),
                      value: selectPro,
                      controlAffinity: ListTileControlAffinity.leading,
                      checkColor: Colors.white,
                      activeColor: Colors.green,
                      onChanged: (bool? checked) {
                        setState(() {
                          selectPro = checked ?? false;
                          if (selectPro) {
                            selectedRoles.clear();
                            selectAllRestrictions = false;
                            selectTodaysRestrictions = false;
                            selectMonthRestrictions = false;
                            selectVip = false;
                            selectBasic = false;
                            selectAll = false;
                          }
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text('Basic'),
                      value: selectBasic,
                      controlAffinity: ListTileControlAffinity.leading,
                      checkColor: Colors.white,
                      activeColor: Colors.green,
                      onChanged: (bool? checked) {
                        setState(() {
                          selectBasic = checked ?? false;
                          if (selectBasic) {
                            selectedRoles.clear();
                            selectAllRestrictions = false;
                            selectTodaysRestrictions = false;
                            selectMonthRestrictions = false;
                            selectVip = false;
                            selectPro = false;
                            selectAll = false;
                          }
                        });
                      },
                    ),
                    ...allRoles.map((role) {
                      return CheckboxListTile(
                        title: Text(role),
                        value: selectedRoles.contains(role),
                        controlAffinity: ListTileControlAffinity.leading,
                        checkColor: Colors.white,
                        activeColor: Colors.green,
                        onChanged: (bool? checked) {
                          setState(() {
                            if (checked == true) {
                              selectedRoles.add(role);
                              selectAllRestrictions = false;
                              selectTodaysRestrictions = false;
                              selectMonthRestrictions = false;
                              selectVip = false;
                              selectPro = false;
                              selectBasic = false;
                              selectAll = false;
                            } else {
                              selectedRoles.remove(role);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop<List<String>>([]);
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    // Ensure that user selects at least one restriction or role
                    if (selectedRoles.isEmpty &&
                        !selectAllRestrictions &&
                        !selectTodaysRestrictions &&
                        !selectMonthRestrictions &&
                        !selectVip &&
                        !selectPro &&
                        !selectBasic) {
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              'Please select at least one role or restriction.'),
                          duration: Duration(seconds: 4),
                        ),
                      );
                    } else {
                      // Create a list of selected restrictions
                      List<String> restrictions = [];
                      if (selectAllRestrictions) restrictions.add('ALL');
                      if (selectTodaysRestrictions) restrictions.add('TODAY');
                      if (selectMonthRestrictions) restrictions.add('MONTH');
                      if (selectVip) restrictions.add('VIP');
                      if (selectPro) restrictions.add('PRO');
                      if (selectBasic) restrictions.add('BASIC');

                      // Add selected roles to the list
                      restrictions.addAll(selectedRoles);

                      Navigator.of(context).pop(restrictions);
                    }
                  },
                  child: const Text('Generate'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<void> generatePdf() async {
    try {
      var guideProvider = Provider.of<GuideProvider>(context, listen: false);

      final allRoles = guideProvider.restrictionsList
          .expand((r) =>
              r.Role_Permission ??
              []) // Replace Role_Permission with the actual property name
          .toSet()
          .toList()
          .cast<String>();

      final selectedRoles = await showRoleSelectionDialog(context, allRoles);

      if (selectedRoles == null || selectedRoles.isEmpty) {
        return;
      }

      final pdf = pw.Document();
      final ttf = pw.Font.ttf(await rootBundle.load("assets/fonts/Cairo.ttf"));
      final check = (await rootBundle.load('assets/images/check.png'))
          .buffer
          .asUint8List();

      // Helper function to create content for given restrictions
      List<pw.Widget> createContent(
          List<Restriction> restrictions, String title) {
        return [
          pw.Center(
              child: pw.Text(
            title,
            style: pw.TextStyle(fontSize: 30, font: ttf),
          )),
          pw.SizedBox(height: 20),
          pw.Table(
            border: pw.TableBorder.all(),
            children: [
              pw.TableRow(
                children: [
                  pw.Center(
                      child: pw.Text('VIP',
                          style: pw.TextStyle(font: ttf, fontSize: 12))),
                  pw.Center(
                      child: pw.Text('PRO',
                          style: pw.TextStyle(font: ttf, fontSize: 12))),
                  pw.Center(
                      child: pw.Text('BASIC',
                          style: pw.TextStyle(font: ttf, fontSize: 12))),
                  pw.Center(
                      child: pw.Text('الامكانيات',
                          style: pw.TextStyle(font: ttf, fontSize: 12),
                          textDirection: pw.TextDirection.rtl)),
                ],
              ),
              for (var restriction in restrictions)
                pw.TableRow(
                  children: [
                    pw.Container(
                      height: 30,
                      child: restriction.Allowed_Plans?.contains("vip") ?? false
                          ? pw.Center(
                              child: pw.Image(pw.MemoryImage(check),
                                  width: 10, height: 10))
                          : pw.Container(),
                    ),
                    pw.Container(
                      height: 30,
                      child: restriction.Allowed_Plans?.contains("pro") ?? false
                          ? pw.Center(
                              child: pw.Image(pw.MemoryImage(check),
                                  width: 10, height: 10))
                          : pw.Container(),
                    ),
                    pw.Container(
                      height: 30,
                      child:
                          restriction.Allowed_Plans?.contains("basic") ?? false
                              ? pw.Center(
                                  child: pw.Image(pw.MemoryImage(check),
                                      width: 10, height: 10))
                              : pw.Container(),
                    ),
                    pw.Container(
                        height: 30,
                        child: pw.Center(
                            child: pw.Text("${restriction.Title}",
                                style: pw.TextStyle(font: ttf, fontSize: 12),
                                textDirection: pw.TextDirection.rtl))),
                  ],
                )
            ],
          )
        ];
      }

      // Add a page for each selected restriction or role
      if (selectedRoles.contains('ALL')) {
        final allRestrictions = guideProvider.restrictionsList.toList();
        pdf.addPage(
          pw.MultiPage(
            build: (pw.Context context) =>
                createContent(allRestrictions, "All Restrictions"),
          ),
        );
      } else {
        if (selectedRoles.contains('TODAY')) {
          final todayRestrictions = guideProvider.restrictionsList
              .where((r) => isTodaysRestriction(r))
              .toList();
          pdf.addPage(
            pw.MultiPage(
              build: (pw.Context context) =>
                  createContent(todayRestrictions, "Today's Restrictions"),
            ),
          );
        }
        if (selectedRoles.contains('MONTH')) {
          final monthRestrictions = guideProvider.restrictionsList
              .where((r) => isCurrentMonthRestriction(r))
              .toList();
          pdf.addPage(
            pw.MultiPage(
              build: (pw.Context context) =>
                  createContent(monthRestrictions, "Month's Restrictions"),
            ),
          );
        }
        if (selectedRoles.contains('VIP')) {
          final vipRestrictions = guideProvider.restrictionsList
              .where((r) => r.Allowed_Plans?.contains('vip') ?? false)
              .toList();
          pdf.addPage(
            pw.MultiPage(
              build: (pw.Context context) =>
                  createContent(vipRestrictions, "VIP Restrictions"),
            ),
          );
        }
        if (selectedRoles.contains('PRO')) {
          final proRestrictions = guideProvider.restrictionsList
              .where((r) => r.Allowed_Plans?.contains('pro') ?? false)
              .toList();
          pdf.addPage(
            pw.MultiPage(
              build: (pw.Context context) =>
                  createContent(proRestrictions, "PRO Restrictions"),
            ),
          );
        }
        if (selectedRoles.contains('BASIC')) {
          final basicRestrictions = guideProvider.restrictionsList
              .where((r) => r.Allowed_Plans?.contains('basic') ?? false)
              .toList();
          pdf.addPage(
            pw.MultiPage(
              build: (pw.Context context) =>
                  createContent(basicRestrictions, "Basic Restrictions"),
            ),
          );
        }
        if (selectedRoles.isNotEmpty) {
          for (var role in selectedRoles) {
            if (['VIP', 'PRO', 'BASIC', 'TODAY', 'MONTH', 'ALL']
                .contains(role)) {
              continue; // Skip these options
            }
            final roleRestrictions = guideProvider.restrictionsList
                .where((r) => r.Role_Permission?.contains(role) ?? false)
                .toList();
            pdf.addPage(
              pw.MultiPage(
                  build: (pw.Context context) => createContent(
                      roleRestrictions, "Restrictions for $role")),
            );
          }
        }
      }

      final Uint8List bytes = await pdf.save();
      final directory = await getTemporaryDirectory();
      final file = File('${directory.path}/Restrictions.pdf');
      await file.writeAsBytes(bytes);
      await OpenFile.open(file.path);
    } catch (e) {
      // Handle errors here
      print("An error occurred while generating the PDF: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Restrictions"),
          actions: [
            IconButton(
                icon: const Icon(Icons.picture_as_pdf),
                onPressed: () {
                  generatePdf();
                })
          ],
        ),
        body: Consumer<GuideProvider>(builder: (context, guideProvider, child) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      restrictionsToFirestore();
                    },
                    child: const Text("set")),
                ElevatedButton(
                    onPressed: () {
                      deleteAllRestrictionsToFirestore();
                    },
                    child: const Text("delete")),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 150, // specify a width for the inner Row
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "VIP",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Spacer(flex: 2), // add space between VIP and PRO
                            Text(
                              "PRO",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Spacer(flex: 2), // add space between PRO and BASIC
                            Text(
                              "BASIC",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Spacer(flex: 2),
                          ],
                        ),
                      ),
                      Text(
                        "الامكانيات (${guideProvider.restrictionsList.length})",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                (guideProvider.restrictionsList.isNotEmpty)
                    ? Expanded(
                        child: ListView.builder(
                        itemCount: guideProvider
                            .restrictionsList.length, // number of items
                        itemBuilder: (context, index) {
                          // Sort the list by date in descending order (newest first)
                          guideProvider.restrictionsList
                              .sort((a, b) => b.date!.compareTo(a.date!));
                          Restriction restriction =
                              guideProvider.restrictionsList[index];
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 140, // specify a width for the inner Row
                                child: Row(
                                  children: [
                                    restriction.Allowed_Plans!.contains("vip")
                                        ? const Icon(Icons.check_circle,
                                            color: Colors.green)
                                        : Container(
                                            width: 20,
                                          ),
                                    const Spacer(
                                        flex:
                                            2), // add space between VIP and PRO
                                    restriction.Allowed_Plans!.contains("pro")
                                        ? const Icon(
                                            Icons.check_circle,
                                            color: Colors.green,
                                          )
                                        : Container(
                                            width: 20,
                                          ),
                                    const Spacer(
                                        flex:
                                            2), // add space between PRO and BASIC
                                    restriction.Allowed_Plans!.contains("basic")
                                        ? const Icon(Icons.check_circle,
                                            color: Colors.green)
                                        : Container(
                                            width: 20,
                                          ),
                                    const Spacer(flex: 2),
                                  ],
                                ),
                              ),
                              Row(children: [
                                Text(
                                    "${restriction.Title!.split(' ').take(3).join(' ')}"),
                                Text("(${index + 1})"),
                              ])
                            ],
                          );
                        },
                      ))
                    : const Center(
                        child: Text(
                          'No Items Available for now',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
              ],
            ),
          );
        }));
  }
}
