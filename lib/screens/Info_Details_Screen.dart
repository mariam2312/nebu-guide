import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constant.dart';
import '../format/Date_and_Time.dart';
import '../models/Info.dart';
import '../providers/GuideProvider.dart';

class InfoDetailsScreen extends StatefulWidget {
  static String id = "InfoDetailsScreen";

  List<Info?> tips;
  bool isForAppOfficialInfoTip;
  bool isForAppOfficialFAQ;
  bool isForAppTips;

  InfoDetailsScreen(
      {super.key, required this.tips,
        required this.isForAppOfficialInfoTip,
        required this.isForAppOfficialFAQ,
        required this.isForAppTips});

  @override
  InfoDetailsScreenState createState() => InfoDetailsScreenState();
}

class InfoDetailsScreenState extends State<InfoDetailsScreen> {
  PageController controller = PageController();
  PageController pictureListController = PageController();
  ScrollController faqController = ScrollController();

  DateAndTime time = DateAndTime();

  // YoutubePlayerController youtubeController = YoutubePlayerController(
  //   initialVideoId: 'HVtfiQ74O5U',
  // );

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    pictureListController.dispose();
    faqController.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    var tips = Provider.of<GuideProvider>(context, listen: false);

    List<Info?> allInfo = widget.tips;

    bool isFAQ = widget.isForAppOfficialFAQ;
    bool isOfficial = widget.isForAppOfficialInfoTip;
    List<Info?> searchResults = [];
    var guideProvider = Provider.of<GuideProvider>(context, listen: false);

    //
    // allInfo.sort((a, b) =>
    //     (a?.Tip_Order_Number ?? 1).compareTo(b?.Tip_Order_Number ?? 1));

    (isFAQ == true)
        ? allInfo.removeWhere((element) => (element?.Is_FAQ == false))
        : (isOfficial == true)
        ? allInfo.removeWhere((element) => (element?.Is_Official == false))
        : allInfo.removeWhere((element) => (element?.Is_Basic == false));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // Navigator.pushNamed(context, TipsScreen.id);
              Navigator.pop(context);
              // tips.resetAllTips();
              // tips.setTipsAlive();
            }),
        centerTitle: true,
        backgroundColor: const Color(0xff212D45),
        title: const Text("NEBU GUIDE",style: TextStyle(color: Colors.amber),),
      ),
      body: (isFAQ == false && isOfficial == false)
          ? Stack(
        children: [
          PageView.builder(
              itemCount: allInfo.length,
              controller: controller,
              itemBuilder: (context, index) {
                /// todo remove the hard coded part of the youtube link .

                String? youTubeLink = allInfo[index]?.Material_Path;

                // YoutubePlayerController youtubeController =
                //     YoutubePlayerController(
                //   initialVideoId:
                //       (allTips[index]?.Material_Path) ?? "HVtfiQ74O5U",
                //   flags: YoutubePlayerFlags(
                //     autoPlay: false,
                //     mute: false,
                //   ),
                // );
                return ListView(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          (allInfo[index]?.Is_Material_Lottie == true)
                              ? Container(
                            decoration: const BoxDecoration(
                                color: Colors.white),
                            child: Lottie.network(
                              "${allInfo[index]?.Material_Path}",
                              width: MediaQuery.of(context)
                                  .size
                                  .width -
                                  30,
                              height: MediaQuery.of(context)
                                  .size
                                  .height /
                                  1.50,
                            ),
                          )
                              : (allInfo[index]?.Is_Material_YouTube ==
                              true)
                              ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white),
                              child: Linkify(
                                onOpen: (link) async {
                                  if (await canLaunch(
                                      link.url)) {
                                    await launch(link.url);
                                  } else {
                                    throw 'Could not launch $link';
                                  }
                                },
                                text:
                                " youtube link : https://www.youtube.com/watch?v=$youTubeLink",
                                style: GoogleFonts.markaziText(
                                    fontSize: 20,
                                    color: Colors.black),
                                linkStyle: const TextStyle(
                                    color: Colors.blue),
                              ),
                              //Text("${youTubeLink}")

                              // YoutubePlayer(
                              //     controller: youtubeController,
                              //     showVideoProgressIndicator:
                              //         true),
                            ),
                          )
                              : allInfo[index]?.Material_Path_List ==
                              []
                              ? Container(
                            width: MediaQuery.of(context)
                                .size
                                .width -
                                30,
                            height: MediaQuery.of(context)
                                .size
                                .height /
                                1.50,
                            decoration: BoxDecoration(
                              color: Colors.yellow[700],
                            ),
                            child: CachedNetworkImage(
                              imageUrl:
                              "${allInfo[index]?.Material_Path}",
                              progressIndicatorBuilder: (context,
                                  url,
                                  downloadProgress) =>
                                  CircularProgressIndicator(
                                      value:
                                      downloadProgress
                                          .progress),
                              errorWidget: (context, url,
                                  error) =>
                              const Icon(Icons.error),
                            ),
                          )
                              : Padding(
                            padding:
                            const EdgeInsets.all(12.0),
                            child: Stack(
                              alignment:
                              Alignment.bottomCenter,
                              children: [
                                Container(
                                  width:
                                  MediaQuery.of(context)
                                      .size
                                      .width -
                                      30,
                                  height:
                                  MediaQuery.of(context)
                                      .size
                                      .height /
                                      1.50,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      const BorderRadius
                                          .all(Radius
                                          .circular(
                                          8)),
                                      color: Colors
                                          .yellow[700],
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors
                                              .black
                                              .withOpacity(
                                              0.5),
                                          spreadRadius: 3,
                                          blurRadius: 2,
                                          offset: const Offset(
                                              0,
                                              3), // changes position of shadow
                                        ),
                                      ]),
                                  child: PageView.builder(
                                    itemBuilder:
                                        (context, item) {
                                      return CachedNetworkImage(
                                        imageUrl:
                                        "${allInfo[index]?.Material_Path_List?[item]}",
                                        progressIndicatorBuilder: (context,
                                            url,
                                            downloadProgress) =>
                                            CircularProgressIndicator(
                                                value: downloadProgress
                                                    .progress),
                                        errorWidget: (context,
                                            url,
                                            error) =>
                                        const Icon(Icons
                                            .error),
                                      );
                                    },
                                    controller:
                                    pictureListController,
                                    itemCount: allInfo[
                                    index]
                                        ?.Material_Path_List
                                        ?.length ??
                                        1,
                                    scrollDirection:
                                    Axis.horizontal,
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.all(
                                      8.0),
                                  child: Container(
                                    decoration:
                                    const BoxDecoration(
                                      borderRadius:
                                      BorderRadius.all(
                                          Radius
                                              .circular(
                                              8)),
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .center,
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets
                                              .only(
                                              bottom: 5,
                                              top: 5),
                                          child:
                                          SmoothPageIndicator(
                                            // key: keyButton1,
                                              controller:
                                              pictureListController,
                                              count: allInfo[index]
                                                  ?.Material_Path_List
                                                  ?.length ??
                                                  1,
                                              effect:
                                              WormEffect(
                                                activeDotColor:
                                                Colors.yellow[700]!,
                                                radius:
                                                15,
                                                strokeWidth:
                                                1,
                                                dotHeight:
                                                10,
                                                dotWidth:
                                                10,
                                                dotColor:
                                                Colors.grey,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          (widget.isForAppTips == true &&
                              allInfo[index]?.Is_Step_By_Step == true)
                              ? Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Text(
                                    (widget.isForAppTips == true &&
                                        allInfo[index]
                                            ?.Is_Required ==
                                            false &&
                                        allInfo[index]
                                            ?.Is_Step_By_Step ==
                                            true)
                                        ? " خطوة اختيارية "
                                        : (widget.isForAppTips ==
                                        true &&
                                        allInfo[index]
                                            ?.Is_Required ==
                                            true &&
                                        allInfo[index]
                                            ?.Is_Step_By_Step ==
                                            true)
                                        ? " خطوة اساسية "
                                        : "",
                                    style: GoogleFonts.cairo(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: (widget.isForAppTips ==
                                          true &&
                                          allInfo[index]
                                              ?.Is_Required ==
                                              false)
                                          ? Colors.red
                                          : (widget.isForAppTips ==
                                          true &&
                                          allInfo[index]
                                              ?.Is_Required ==
                                              true)
                                          ? Colors.green
                                          : Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0,
                                  right: 8.0,
                                  top: 0,
                                  bottom: 0),
                              child: Text(
                                "${index + 1}",
                                style: GoogleFonts.cairo(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0,
                                  right: 8.0,
                                  top: 0,
                                  bottom: 0),
                              child: Text(
                                "${allInfo[index]?.Tip_Title}",
                                style: GoogleFonts.cairo(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, top: 0, bottom: 0),
                          child: Text(
                            "${allInfo[index]?.Related_Screen}",
                            style: GoogleFonts.cairo(
                                fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 4, bottom: 0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: const BorderRadius.all(
                                Radius.circular(5))),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                                right: 8.0,
                                top: 4,
                              ),
                              child: Center(
                                child: Text(
                                  " الشرح 👨🏻‍🏫",
                                  style: GoogleFonts.cairo(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Linkify(
                                  onOpen: (link) async {
                                    if (await canLaunch(link.url)) {
                                      await launch(link.url);
                                    } else {
                                      throw 'Could not launch $link';
                                    }
                                  },
                                  text:
                                  "${allInfo[index]?.Tip_Main_Description}",
                                  style: GoogleFonts.markaziText(
                                      fontSize: 17, color: Colors.black),
                                  linkStyle:
                                  const TextStyle(color: Colors.blue),
                                )),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 4, bottom: 0),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                            BorderRadius.all(Radius.circular(5))),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                                right: 8.0,
                                top: 4,
                              ),
                              child: Text(
                                " الفكرة 💡",
                                style: GoogleFonts.cairo(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.white),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Linkify(
                                  onOpen: (link) async {
                                    if (await canLaunch(link.url)) {
                                      await launch(link.url);
                                    } else {
                                      throw 'Could not launch $link';
                                    }
                                  },
                                  text:
                                  "${allInfo[index]?.Tip_Description_Idea}",
                                  style: GoogleFonts.markaziText(
                                      fontSize: 17, color: Colors.black),
                                  linkStyle:
                                  const TextStyle(color: Colors.blue),
                                )),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 4, bottom: 0),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius:
                            BorderRadius.all(Radius.circular(5))),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                                right: 8.0,
                                top: 4,
                              ),
                              child: Text(
                                " هل تعلم 😲",
                                style: GoogleFonts.cairo(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.white),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Linkify(
                                  onOpen: (link) async {
                                    if (await canLaunch(link.url)) {
                                      await launch(link.url);
                                    } else {
                                      throw 'Could not launch $link';
                                    }
                                  },
                                  text:
                                  "${allInfo[index]?.Tip_Description_Info}",
                                  style: GoogleFonts.markaziText(
                                      fontSize: 17, color: Colors.black),
                                  linkStyle:
                                  const TextStyle(color: Colors.blue),
                                )),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                );
              }),
          Container(
            color: const Color(0xff212D45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5, top: 5),
                  child: SmoothPageIndicator(
                    // key: keyButton1,
                      controller: controller,
                      count: allInfo.length,
                      effect: WormEffect(
                        activeDotColor: Colors.yellow[700]!,
                        radius: 15,
                        strokeWidth: 1,
                        dotHeight: 10,
                        dotWidth: 10,
                        dotColor: Colors.grey,
                      )),
                ),
              ],
            ),
          ),
        ],
      )
          : (isFAQ == true)
          ? Column(crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius:
              const BorderRadius.all(Radius.circular(1)),
              color: Color(0xff212D45),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "الاسئلة الشائعة",
                    style: GoogleFonts.cairo(
                      color:  Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextField(
                    cursorColor: Colors.white,
                    controller: searchController,

                    decoration: InputDecoration(
                      suffix: Text('البحث عن سؤال', style: TextStyle(color: Colors.grey)), // Set the hint text as a suffix
                      hintStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 20),
                      prefixIcon: Icon(Icons.search, color: Colors.grey, size: 40),
                      contentPadding: EdgeInsetsDirectional.only( top: 10, bottom: 10,end: 10), // Set the content padding
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50), // Set the border radius to 50 for a circular shape
                        borderSide: BorderSide(color: Colors.grey), // Set the border color to grey
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      filled: true, // Set filled to true to set the background color
                      fillColor: Colors.grey[600], // Set the background color to dark grey
                    ),
                    onChanged: (text) {
                      setState(() {
                        if (text.isEmpty) {
                          searchResults = allInfo;
                        }else {
                          searchResults = guideProvider.allInfo
                              .where((element) {
                            final title =
                                element.Tip_Title?.toLowerCase() ??
                                    '';
                            final section = element.Tip_Section
                                ?.toLowerCase() ??
                                '';
                            final description =
                                element.Tip_Description_Info
                                    ?.toLowerCase() ??
                                    '';

                            return title
                                .contains(text.toLowerCase()) ||
                                section
                                    .contains(text.toLowerCase()) ||
                                description
                                    .contains(text.toLowerCase());
                          }).toList();
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child:
                Text(
                  "نحن هنا لمساعدتك في اي سؤال لنظام نيبو للدهب،شاركنا سؤالك و سنسعد بمساعدتك !!",
                  style: GoogleFonts.cairo(
                  color: Color(0xff212D45),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),textAlign: TextAlign.end,),),
                Expanded(
                  child: ListView.builder(
                      itemCount: allInfo.length,
                      controller: faqController,
                      itemBuilder: (context, index) {
                        String? youtubeLink = allInfo[index]?.Material_Path;

                        // YoutubePlayerController youtubeController =
                        //     YoutubePlayerController(
                        //   initialVideoId: (allTips[index]?.Material_Path) ??
                        //       "HVtfiQ74O5U",
                        //   flags: YoutubePlayerFlags(
                        //     autoPlay: false,
                        //     mute: false,
                        //   ),
                        // );
                        return Container(
                            color:  Colors.white,
                          child: ExpansionTile(
                            title: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [

                                Expanded(
                                  child: Text(
                                    "${allInfo[index]?.Tip_Title}",
                                    style: GoogleFonts.markaziText(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff212D45),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "${index + 1}",
                                  style: GoogleFonts.cairo(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff212D45),
                                  ),
                                ),

                              ],
                            ),
                            children: [
                           Text(
                                "${allInfo[index]?.Tip_Title}",
                                style: GoogleFonts.markaziText(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff212D45),
                                ),
                              ),
                              // const SizedBox(
                              //   height: 10,
                              // ),
                              // (allInfo[index]?.Is_Material_Lottie == true &&
                              //     allInfo[index]?.Material_Path !=
                              //         "" &&
                              //     allInfo[index]?.Material_Path !=
                              //         null)
                              //     ? Container(
                              //   decoration: const BoxDecoration(
                              //       color: Colors.white),
                              //   child: Lottie.network(
                              //     "${allInfo[index]?.Material_Path}",
                              //     width: MediaQuery.of(context)
                              //         .size
                              //         .width -
                              //         30,
                              //     height: MediaQuery.of(context)
                              //         .size
                              //         .height /
                              //         1.50,
                              //   ),
                              // )
                              //     : (allInfo[index]
                              //     ?.Is_Material_YouTube ==
                              //     true &&
                              //     allInfo[index]?.Material_Path !=
                              //         "" &&
                              //     allInfo[index]?.Material_Path !=
                              //         null)
                              //     ? Padding(
                              //   padding:
                              //   const EdgeInsets.all(8.0),
                              //   child: Container(
                              //       decoration:
                              //       const BoxDecoration(
                              //           color:
                              //           Colors.white),
                              //       child:
                              //       Text("$youtubeLink")
                              //     // YoutubePlayer(
                              //     //     controller:
                              //     //         youtubeController,
                              //     //     showVideoProgressIndicator:
                              //     //         true),
                              //   ),
                              // )
                              //     : ((allInfo[index]
                              //     ?.Material_Path_List
                              //     ?.isEmpty ??
                              //     false) &&
                              //     allInfo[index]
                              //         ?.Material_Path !=
                              //         "" &&
                              //     allInfo[index]
                              //         ?.Material_Path !=
                              //         null)
                              //     ? Container(
                              //   width:
                              //   MediaQuery.of(context)
                              //       .size
                              //       .width -
                              //       30,
                              //   height:
                              //   MediaQuery.of(context)
                              //       .size
                              //       .height /
                              //       1.50,
                              //   decoration: BoxDecoration(
                              //     color: Colors.yellow[700],
                              //   ),
                              //   child: CachedNetworkImage(
                              //     imageUrl:
                              //     "${allInfo[index]?.Material_Path}",
                              //     progressIndicatorBuilder: (context,
                              //         url,
                              //         downloadProgress) =>
                              //         CircularProgressIndicator(
                              //             value:
                              //             downloadProgress
                              //                 .progress),
                              //     errorWidget: (context,
                              //         url, error) =>
                              //     const Icon(
                              //         Icons.error),
                              //   ),
                              // )
                              //     : ((allInfo[index]
                              //     ?.Material_Path_List
                              //     ?.length ??
                              //     0) >
                              //     0 &&
                              //     (allInfo[index]
                              //         ?.Material_Path ==
                              //         "" ||
                              //         allInfo[index]
                              //             ?.Material_Path ==
                              //             null))
                              //     ? Padding(
                              //   padding:
                              //   const EdgeInsets
                              //       .all(12.0),
                              //   child: Stack(
                              //     alignment: Alignment
                              //         .bottomCenter,
                              //     children: [
                              //       Container(
                              //         width: MediaQuery.of(
                              //             context)
                              //             .size
                              //             .width -
                              //             30,
                              //         height: MediaQuery.of(
                              //             context)
                              //             .size
                              //             .height /
                              //             1.50,
                              //         decoration: BoxDecoration(
                              //             borderRadius:
                              //             const BorderRadius
                              //                 .all(
                              //                 Radius.circular(
                              //                     8)),
                              //             color: Colors
                              //                 .yellow[
                              //             700],
                              //             boxShadow: [
                              //               BoxShadow(
                              //                 color: Colors
                              //                     .black
                              //                     .withOpacity(
                              //                     0.5),
                              //                 spreadRadius:
                              //                 3,
                              //                 blurRadius:
                              //                 2,
                              //                 offset: const Offset(
                              //                     0,
                              //                     3), // changes position of shadow
                              //               ),
                              //             ]),
                              //         child: PageView
                              //             .builder(
                              //           itemBuilder:
                              //               (context,
                              //               item) {
                              //             return CachedNetworkImage(
                              //               imageUrl:
                              //               "${allInfo[index]?.Material_Path_List?[item]}",
                              //               progressIndicatorBuilder: (context,
                              //                   url,
                              //                   downloadProgress) =>
                              //                   CircularProgressIndicator(
                              //                       value:
                              //                       downloadProgress.progress),
                              //               errorWidget: (context,
                              //                   url,
                              //                   error) =>
                              //               const Icon(
                              //                   Icons.error),
                              //             );
                              //           },
                              //           controller:
                              //           pictureListController,
                              //           itemCount: allInfo[
                              //           index]
                              //               ?.Material_Path_List
                              //               ?.length ??
                              //               1,
                              //           scrollDirection:
                              //           Axis.horizontal,
                              //         ),
                              //       ),
                              //       Padding(
                              //         padding:
                              //         const EdgeInsets
                              //             .all(8.0),
                              //         child: Container(
                              //           decoration:
                              //           const BoxDecoration(
                              //             borderRadius:
                              //             BorderRadius.all(
                              //                 Radius.circular(
                              //                     8)),
                              //             color: Colors
                              //                 .white,
                              //           ),
                              //           child: Row(
                              //             mainAxisAlignment:
                              //             MainAxisAlignment
                              //                 .center,
                              //             children: [
                              //               Padding(
                              //                 padding: const EdgeInsets
                              //                     .only(
                              //                     bottom:
                              //                     5,
                              //                     top:
                              //                     5),
                              //                 child: SmoothPageIndicator(
                              //                   // key: keyButton1,
                              //                     controller: pictureListController,
                              //                     count: allInfo[index]?.Material_Path_List?.length ?? 1,
                              //                     effect: WormEffect(
                              //                       activeDotColor:
                              //                       Colors.yellow[700]!,
                              //                       radius:
                              //                       15,
                              //                       strokeWidth:
                              //                       1,
                              //                       dotHeight:
                              //                       10,
                              //                       dotWidth:
                              //                       10,
                              //                       dotColor:
                              //                       Colors.grey,
                              //                     )),
                              //               ),
                              //             ],
                              //           ),
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // )
                              //     : const SizedBox(),
                              // Padding(
                              //     padding: const EdgeInsets.all(8.0),
                              //     child: Linkify(
                              //       onOpen: (link) async {
                              //         if (await canLaunch(link.url)) {
                              //           await launch(link.url);
                              //         } else {
                              //           throw 'Could not launch $link';
                              //         }
                              //       },
                              //       text:
                              //       "${allInfo[index]?.Tip_Description_Info}",
                              //       style: GoogleFonts.markaziText(
                              //           fontSize: 17,
                              //           color: Colors.white),
                              //       linkStyle: const TextStyle(
                              //           color: Colors.blue),
                              //     )),

                            ],

                          ),
                        );
                      }),
                ),


          Container(
            height: 100,
            color: Color(0xff212D45),
child:Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [

  MouseRegion(
    cursor: SystemMouseCursors.click,
    child: GestureDetector(
      onTap: () async {
        launchWhatsapp();
      },
      child: SizedBox(

        child: Center(
             child: Image.asset("assets/images/contactUs.png", scale:5.5,)

        ),
      ),
    ),
  ),
    Text("لديك اسئلة اخري ؟ اضغط هنا ", style: GoogleFonts.cairo(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),),

],)
          )
        ],
      )
          : (isOfficial == true)
          ? Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                const BorderRadius.all(Radius.circular(3)),
                color: Colors.yellow[700],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "الاخبار الرسمية",
                          style: GoogleFonts.cairo(
                            color:  Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "(${allInfo.length})",
                          style: GoogleFonts.cairo(
                            color: const Color(0xff212D45),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ),

          /// todo re-enable the youtube part when it's working soon
          Expanded(
            child: ListView.builder(
                itemCount: allInfo.length,
                controller: faqController,
                itemBuilder: (context, index) {
                  String? youTubeLink =
                      allInfo[index]?.Material_Path;

                  // YoutubePlayerController youtubeController =
                  //     YoutubePlayerController(
                  //   initialVideoId:
                  //       (allTips[index]?.Material_Path) ??
                  //           "HVtfiQ74O5U",
                  //   flags: YoutubePlayerFlags(
                  //     autoPlay: false,
                  //     mute: false,
                  //   ),
                  // );

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                                Radius.circular(8)),
                            color: const Color(0xff212D45),
                            boxShadow: [
                              BoxShadow(
                                color:
                                Colors.black.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 2,
                                offset: const Offset(0,
                                    3), // changes position of shadow
                              ),
                            ]),
                        child: ExpansionTile(
                          onExpansionChanged: (value) {
                            tips.setTitleAvailability(
                                value: value);
                          },
                          trailing: const Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Colors.white,
                          ),
                          initiallyExpanded: true,
                          title: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                  const BorderRadius.all(
                                      Radius.circular(2)),
                                  color: Colors.yellow[700],
                                ),
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8.0),
                                child: Text(
                                  "${index + 1}",
                                  style: GoogleFonts.cairo(
                                      fontSize: 16,
                                      color: Colors.black),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Container(
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(
                                        Radius.circular(2)),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.only(
                                        left: 8.0,
                                        right: 8.0),
                                    child: Row(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .center,
                                          children: [
                                            Padding(
                                              padding:
                                              const EdgeInsets
                                                  .all(4.0),
                                              child: Text(
                                                "${allInfo[index]?.Tip_Title}",
                                                style: GoogleFonts.markaziText(
                                                    fontSize: 20,
                                                    fontWeight:
                                                    FontWeight
                                                        .bold,
                                                    color: Colors
                                                        .black),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          children: [
                            Card(
                              color: const Color(0xff212D45),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        decoration:
                                        const BoxDecoration(
                                          borderRadius:
                                          BorderRadius.all(
                                              Radius.circular(
                                                  2)),
                                          color: Colors.grey,
                                        ),
                                        padding:
                                        const EdgeInsets.only(
                                            left: 8,
                                            right: 8.0),
                                        child: Text(
                                          time.showDate2(allInfo[index]!.date!.toDate()),
                                          style:
                                          GoogleFonts.cairo(
                                              fontSize: 16,
                                              color: Colors
                                                  .black),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.all(8.0),
                                    child: Padding(
                                        padding:
                                        const EdgeInsets.all(
                                            8.0),
                                        child: Linkify(
                                          onOpen: (link) async {
                                            if (await canLaunch(
                                                link.url)) {
                                              await launch(
                                                  link.url);
                                            } else {
                                              throw 'Could not launch $link';
                                            }
                                          },
                                          text:
                                          "${allInfo[index]?.Tip_Description_Info}",
                                          style: GoogleFonts
                                              .markaziText(
                                              fontSize: 20,
                                              color: Colors
                                                  .white),
                                          linkStyle:
                                          const TextStyle(
                                              color: Colors
                                                  .blue),
                                        )),
                                  ),
                                  (allInfo[index]?.Is_Material_Lottie ==
                                      true &&
                                      allInfo[index]?.Material_Path !=
                                          "" &&
                                      allInfo[index]?.Material_Path !=
                                          null)
                                      ? Container(
                                    decoration:
                                    const BoxDecoration(
                                        color: Colors
                                            .white),
                                    child: Lottie.network(
                                      "${allInfo[index]?.Material_Path}",
                                      width: MediaQuery.of(
                                          context)
                                          .size
                                          .width -
                                          30,
                                      height: MediaQuery.of(
                                          context)
                                          .size
                                          .height /
                                          1.50,
                                    ),
                                  )
                                      : (allInfo[index]?.Is_Material_YouTube ==
                                      true &&
                                      allInfo[index]?.Material_Path !=
                                          "" &&
                                      allInfo[index]?.Material_Path !=
                                          null)
                                      ? Padding(
                                    padding:
                                    const EdgeInsets
                                        .all(8.0),
                                    child: Container(
                                      decoration:
                                      const BoxDecoration(
                                          color: Colors
                                              .white),
                                      child: Text(
                                          "$youTubeLink"),
                                      // YoutubePlayer(
                                      //     controller:
                                      //         youtubeController,
                                      //     showVideoProgressIndicator:
                                      //         true),
                                    ),
                                  )
                                      : ((allInfo[index]?.Material_Path_List?.length ?? 0) == 0 &&
                                      allInfo[index]
                                          ?.Material_Path !=
                                          "" &&
                                      allInfo[index]
                                          ?.Material_Path !=
                                          null)
                                      ? Container(
                                      width: MediaQuery.of(context)
                                          .size
                                          .width -
                                          30,
                                      height: MediaQuery.of(context)
                                          .size
                                          .height /
                                          1.50,
                                      decoration:
                                      const BoxDecoration(
                                        color: Color(
                                            0xff212D45),
                                      ),
                                      child:
                                      CachedNetworkImage(
                                        imageUrl:
                                        "${allInfo[index]?.Material_Path}",
                                        progressIndicatorBuilder: (context,
                                            url,
                                            downloadProgress) =>
                                            CircularProgressIndicator(
                                                value:
                                                downloadProgress.progress),
                                        errorWidget: (context,
                                            url,
                                            error) =>
                                        const Icon(
                                            Icons
                                                .error),
                                      ))
                                      : ((allInfo[index]?.Material_Path_List?.length ??
                                      0) >
                                      0 &&
                                      (allInfo[index]?.Material_Path ==
                                          "" ||
                                          allInfo[index]?.Material_Path ==
                                              null))
                                      ? Padding(
                                    padding:
                                    const EdgeInsets
                                        .all(
                                        12.0),
                                    child:
                                    Stack(
                                      alignment:
                                      Alignment
                                          .bottomCenter,
                                      children: [
                                        Container(
                                          width:
                                          MediaQuery.of(context).size.width - 30,
                                          height:
                                          MediaQuery.of(context).size.height / 1.50,
                                          decoration: BoxDecoration(
                                              borderRadius: const BorderRadius.all(Radius.circular(8)),
                                              color: const Color(0xff212D45),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black.withOpacity(0.5),
                                                  spreadRadius: 3,
                                                  blurRadius: 2,
                                                  offset: const Offset(0, 3), // changes position of shadow
                                                ),
                                              ]),
                                          child:
                                          PageView.builder(
                                            itemBuilder:
                                                (context, item) {
                                              return CachedNetworkImage(
                                                imageUrl: "${allInfo[index]?.Material_Path_List?[item]}",
                                                progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
                                                errorWidget: (context, url, error) => const Icon(Icons.error),
                                              );
                                            },
                                            controller:
                                            pictureListController,
                                            itemCount:
                                            allInfo[index]?.Material_Path_List?.length ?? 1,
                                            scrollDirection:
                                            Axis.horizontal,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets
                                              .all(
                                              8.0),
                                          child:
                                          Container(
                                            decoration:
                                            const BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(8)),
                                              color: Colors.white,
                                            ),
                                            child:
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(bottom: 5, top: 5),
                                                  child: SmoothPageIndicator(
                                                    // key: keyButton1,
                                                      controller: pictureListController,
                                                      count: allInfo[index]?.Material_Path_List?.length ?? 1,
                                                      effect: WormEffect(
                                                        activeDotColor: Colors.yellow[700]!,
                                                        radius: 15,
                                                        strokeWidth: 1,
                                                        dotHeight: 10,
                                                        dotWidth: 10,
                                                        dotColor: Colors.grey,
                                                      )),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                      : const SizedBox(),
                                ],
                              ),
                            )
                          ],
                        )),
                  );
                }),
          ),
        ],
      )
          : const SizedBox(),
    );
  }
}
