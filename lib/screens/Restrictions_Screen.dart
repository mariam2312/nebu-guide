import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
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
  // void callStream() {
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     //get data from database as stream
  //     var database = Provider.of<FirestoreDataBase>(context, listen: false);
  //     var guideProvider = Provider.of<GuideProvider>(context, listen: false);
  //     // stream
  //     restrictionsStream = database.allRestrictionsStream();
  //
  //     // listen
  //     restrictionsSubscription = restrictionsStream?.listen((event) {
  //       if (event.exists) {
  //         Map<String, dynamic> allRestrictionsData = event.data() as Map<String, dynamic>;
  //         List<Restriction> restrictionList = [];
  //
  //
  //         // Iterate over the allRestrictionsData map
  //         allRestrictionsData.forEach((key, value) {
  //           Restriction restriction =Restriction.fromMap(value);
  //           restrictionList.add(restriction);
  //         });
  //
  //         setState(() {
  //           restrictionsList = restrictionList;
  //           guideProvider.setRestrictionList(restrictionList: restrictionList);
  //         });
  //       }
  //     });
  //   });
  // }

  Future<void> restrictionsToFirestore() async {



    final CollectionReference restrictionsDataCollection = FirebaseFirestore.instance.collection('RestrictionsData');
    final Map<String, dynamic> bigMap = {
      'restrictions': {}
    };

    for (var restriction in restrictions) {
      final Map<String, dynamic> restrictionMap = restriction.toMap(Path: 'RestrictionsData/AllRestrictionsData');
      bigMap['restrictions'][restriction.Title!] = restrictionMap;
    }

    restrictionsDataCollection.doc('AllRestrictionsData').set(bigMap);
  }

  Future<void> deleteAllRestrictionsToFirestore() async {
    final CollectionReference restrictionsDataCollection = FirebaseFirestore.instance.collection('RestrictionsData');

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
  Future generatePdf() async {
    var guideProvider = Provider.of<GuideProvider>(context, listen: false);
    final pdf = pw.Document();
    final checkmarkImage = await _loadIconAsImage(Icons.check, 24.0, PdfColors.green);
    final font = await rootBundle.load("assets/HelveticaWorld-Bold.ttf");
    final ttf = pw.Font.ttf(font);

    final int maxRowsPerPage = 20; // Adjust as needed
    final List<List<Restriction>> paginatedRestrictions = [];

    // Split data into chunks
    for (int i = 0; i < guideProvider.restrictionsList.length; i += maxRowsPerPage) {
      int end = (i + maxRowsPerPage < guideProvider.restrictionsList.length)
          ? i + maxRowsPerPage
          : guideProvider.restrictionsList.length;
      paginatedRestrictions.add(guideProvider.restrictionsList.sublist(i, end));
    }

    // Create pages
    for (var restrictions in paginatedRestrictions) {
      pdf.addPage(
        pw.Page(
          build: (pw.Context context) {
            return pw.Column(
              children: [
                pw.Text("Restrictions", style: pw.TextStyle(fontSize: 30)),
                pw.SizedBox(height: 30),
                pw.Table(
                  border: pw.TableBorder.all(),
                  children: [
                    pw.TableRow(
                      children: [
                        pw.Center(child: pw.Text('VIP')),
                        pw.Center(child: pw.Text('PRO')),
                        pw.Center(child: pw.Text('BASIC')),
                        pw.Center(child: pw.Text('الامكانيات', style: pw.TextStyle(font: ttf,), textDirection: pw.TextDirection.rtl)),
                      ],
                    ),
                    for (var restriction in restrictions)
                      pw.TableRow(
                        children: [
                          restriction.Allowed_Plans!.contains("vip")
                              ? pw.Center(child: pw.Image(checkmarkImage))
                              : pw.Container(),
                          restriction.Allowed_Plans!.contains("pro")
                              ? pw.Center(child: pw.Image(checkmarkImage))
                              : pw.Container(),
                          restriction.Allowed_Plans!.contains("basic")
                              ? pw.Center(child: pw.Image(checkmarkImage))
                              : pw.Container(),
                          pw.Center(child: pw.Text("${restriction.Title?.split(" ").take(3).join(" ")} "))
                        ],
                      ),
                  ],
                )
              ],
            );
          },
        ),
      );
    }

    final Uint8List bytes = await pdf.save();
    final directory = await getTemporaryDirectory();
    final file = File('${directory.path}/Restrictions.pdf');
    await file.writeAsBytes(bytes);
    await OpenFile.open(file.path);
  }

  // Future generatePdf() async {
  //   var guideProvider = Provider.of<GuideProvider>(context, listen: false);
  //   final pdf = pw.Document();
  //   final checkmarkImage = await _loadIconAsImage(Icons.check, 24.0, PdfColors.green);
  //
  //
  //   final font = await rootBundle.load("Assets/HelveticaWorld-Bold.ttf");
  //   final ttf = pw.Font.ttf(font);
  //   pdf.addPage(
  //       pw.Page(
  //           build: (pw.Context context) {
  //             return
  //               pw.Column(children: [pw.Text("Restrictions",style: pw.TextStyle(fontSize: 30)),
  //                 pw.SizedBox(height: 30),
  //                 pw.Table(
  //                 border: pw.TableBorder.all(),
  //                 children: [
  //                   pw.TableRow(
  //                     children: [
  //                       pw.Center(child:pw.Text('VIP',)),
  //                       pw.Center(child:pw.Text('PRO', )),
  //                       pw.Center(child:pw.Text('BASIC', )),
  //                       pw.Center(child:pw.Text('الامكانيات', style: pw.TextStyle(font: ttf,),textDirection: pw.TextDirection.rtl)),
  //                     ],
  //                   ),
  //
  //                   for (var restriction in guideProvider.restrictionsList)
  //                     pw.TableRow(
  //                       children: [
  //                         restriction.Allowed_Plans!.contains("vip")
  //                             ? pw.Center(child:pw.Image(checkmarkImage))
  //                             : pw.Container(),
  //                         restriction.Allowed_Plans!.contains("pro")
  //                             ? pw.Center(child:pw.Image(checkmarkImage))
  //                             : pw.Container(),
  //                         restriction.Allowed_Plans!.contains("basic")
  //                             ? pw.Center(child:pw.Image(checkmarkImage))
  //                             : pw.Container(),
  //                         pw.Center(child:pw.Text("${restriction.Title?.split(" ").take(3).join(" ")} "))
  //
  //                       ],
  //                     ),
  //                 ],
  //               )]);
  //           }));
  //   final Uint8List bytes = await pdf.save();
  //
  //   final directory = await getTemporaryDirectory();
  //   final file = File('${directory.path}/Restrictions.pdf');
  //   await file.writeAsBytes(bytes);
  //   await OpenFile.open(file.path);
  //
  //   // final outputFile = await _getOutputFile();
  //   // await outputFile.writeAsBytes(await pdf.save());
  //   // return outputFile;
  // }
  Future<pw.ImageProvider> _loadIconAsImage(IconData icon, double size, PdfColor circleColor) async {
    final recorder = ui.PictureRecorder();
    final canvasSize = size;
    final canvas = Canvas(recorder, Rect.fromLTWH(0, 0, canvasSize, canvasSize));

    // Draw the green circle
    final circlePaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(canvasSize / 3, canvasSize / 3), canvasSize / 3, circlePaint);

    // Draw the white checkmark icon

    final textPainter = TextPainter(
      text: TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(
          fontSize: size * 0.6, // Adjust size if necessary
          fontFamily: icon.fontFamily,
          color: Colors.white,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    final offset = Offset(
      (canvasSize - textPainter.width) / 5,
      (canvasSize - textPainter.height) / 5,
    );
    textPainter.paint(canvas, offset);

    final picture = recorder.endRecording();
    final img = await picture.toImage(canvasSize.toInt(), canvasSize.toInt());
    final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
    final uint8List = byteData!.buffer.asUint8List();
    return pw.MemoryImage(uint8List);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Restrictions"),
          actions: [
    IconButton(
    icon: const Icon(Icons.print),
    onPressed: () {
       generatePdf();
    })
          ],
        ),
        body:Consumer<GuideProvider>(builder: (context, guideProvider, child) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                ElevatedButton(onPressed: (){restrictionsToFirestore();}, child: Text("set")),
                ElevatedButton(onPressed: (){deleteAllRestrictionsToFirestore();}, child: Text("delete")),
                Container(decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                 color: Colors.black12
                ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 150, // specify a width for the inner Row
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("VIP",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                            Spacer(flex: 2), // add space between VIP and PRO
                            Text("PRO",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                            Spacer(flex: 2), // add space between PRO and BASIC
                            Text("BASIC",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                             Spacer(flex: 2),
                          ],
                        ),
                      ),
                      Text("الامكانيات (${guideProvider.restrictionsList.length})",style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                (guideProvider.restrictionsList.isNotEmpty)
                    ?
                Expanded(
                    child:  ListView.builder(
                      itemCount: guideProvider.restrictionsList.length, // number of items
                      itemBuilder: (context, index) {

                        Restriction restriction=guideProvider.restrictionsList[index];
                        return
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 140, // specify a width for the inner Row
                                child: Row(
                                  children: [
                                    restriction.Allowed_Plans!.contains("vip") ? const Icon(Icons.check_circle,color: Colors.green)
                                        : Container(width: 20,),
                                    const Spacer(flex: 2), // add space between VIP and PRO
                                    restriction.Allowed_Plans!.contains("pro") ? const Icon(Icons.check_circle,color: Colors.green,)
                                        :Container(width: 20,),
                                    const Spacer(flex: 2), // add space between PRO and BASIC
                                    restriction.Allowed_Plans!.contains("basic") ? const Icon(Icons.check_circle,color: Colors.green)
                                        : Container(width: 20,),
                                    const Spacer(flex: 2),
                                  ],
                                ),
                              ),
                              Text("${restriction.Short_Description?.split(" ").take(3).join(" ")} (${index+1})")
                            ],
                          );
                      },
                    ) ): const Center(
                      child: Text(
                  'No Items Available for now',
                  style: TextStyle(color: Colors.red),
                ),
                    ),
              ],
            ),
          );}));
  }

}
