import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
  final CarouselSliderController _carouselController =
  CarouselSliderController();
  PageController controller = PageController();
  PageController pictureListController = PageController();
  ScrollController faqController = ScrollController();
  DateAndTime time = DateAndTime();
  int _currentIndex = 0;

  bool _isAutoPlay = true;
  void onTap() {
    setState(() {
      // _carouselController.stopAutoPlay();
      _isAutoPlay = false;
      print(_isAutoPlay);// Stop autoplay when a step is tapped
    });
  }
  int activeStep = 0;
  late List<Info?> filteredInfos;


  // YoutubePlayerController youtubeController = YoutubePlayerController(
  //   initialVideoId: 'HVtfiQ74O5U',
  // );

 //  @override
 //  void initstate() {
 //    super.initState();
 // filteredInfos = widget.tips;
 //
 //  }
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    pictureListController.dispose();
    faqController.dispose();

  }
  List<Info?> searchResults = [];
  final TextEditingController searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
  //  var tips = Provider.of<GuideProvider>(context, listen: false);

    ///error when faq or offical change in all infos
    List<Info?> allInfos = widget.tips;

    bool isFAQ = widget.isForAppOfficialFAQ;
    bool isOfficial = widget.isForAppOfficialInfoTip;

    var guideProvider = Provider.of<GuideProvider>(context, listen: false);

    //
    // allInfo.sort((a, b) =>
    //     (a?.Tip_Order_Number ?? 1).compareTo(b?.Tip_Order_Number ?? 1));


    if (isFAQ == true) {
      filteredInfos = allInfos.where((element) => element?.Is_FAQ == true).toList();
      print(filteredInfos);
    } else if (isOfficial == true) {
      filteredInfos = allInfos.where((element) => element?.Is_Official == true).toList();
      print(filteredInfos);
    } else{
      filteredInfos = allInfos.where((element) => element?.Is_Basic == true).toList();
      print(filteredInfos);
    }
    final List<Widget> imageSliders =  filteredInfos.map((info) {
      final imagePath = info?.Material_Path_List?.isNotEmpty == true
          ? info?.Material_Path_List?.first
          : ''; // Provide a default image path if Material_Path_List is empty
print(imagePath);
      return ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: GestureDetector(
          onTap: () {
            onTap();
          },
          child: Container(
            width: 300,
            color: Colors.blueGrey,
            child: Center(
              child:
              Stack(
                children: [
                  imagePath is String
                    ? imagePath.startsWith('assets/')
                    ? Image.asset(imagePath)
                    : Image.file(File(imagePath),height: 250,  fit: BoxFit.cover, // Add a height to resize the image
                  width: 250,)
                    : Image.file(imagePath as File, fit: BoxFit.cover,  height: 250, // Add a height to resize the image
                  width: 250,),
                  // Image.asset(
                  //   imagePath,
                  //   fit: BoxFit.cover,
                  // ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Text(
                      "${info?.Tip_Title}",
                      style: GoogleFonts.markaziText(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),

                ],
              ),

            ),
          ),
        ),
      );
    }).toList();
    void _searchInfo(String query) {
      final searchedInfo =filteredInfos.where((info) {
        final title = info!.Tip_Title?.toLowerCase() ?? '';
        //  final description = info.Tip_Description_Info?.toLowerCase() ?? '';

        return title.contains(query.toLowerCase()) ;
        //|| description.contains(query.toLowerCase());
      }).toList();

      setState(() {
        print("searchedInfo$searchedInfo");
        searchResults = searchedInfo;
        print(searchResults);
      });
    }

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
          ?
      //step by step
      Stack(
        children: [
          PageView.builder(
              itemCount: filteredInfos.length,
              controller: controller,
              itemBuilder: (context, index) {
                /// todo remove the hard coded part of the youtube link .

                String? youTubeLink = filteredInfos[index]?.Material_Path;

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
                          (filteredInfos[index]?.Is_Material_Lottie == true)
                              ? Container(
                            decoration: const BoxDecoration(
                                color: Colors.white),
                            child: Lottie.network(
                              "${filteredInfos[index]?.Material_Path}",
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
                              : (filteredInfos[index]?.Is_Material_YouTube ==
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
                              : filteredInfos[index]?.Material_Path_List ==
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
                              color: Colors.red[700],
                            ),
                            child: CachedNetworkImage(
                              imageUrl:
                              "${filteredInfos[index]?.Material_Path}",
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
                              :Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width - 30,
                                  height: MediaQuery.of(context).size.height / 1.50,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                                    color: Colors.yellow[700],
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.5),
                                        spreadRadius: 3,
                                        blurRadius: 2,
                                        offset: const Offset(0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child:    Stack(
                                    children: [
                                      Positioned(
                                          top: 0,
                                          left: 0,
                                          bottom: 20,
                                          right: 0,
                                          child: CarouselSlider(
                                            items: filteredInfos[index]?.Material_Path_List?.map((image) {
                                              return ClipRRect(
                                                borderRadius: BorderRadius.circular(40),
                                                child: image is String
                                                    ? image.startsWith('assets/')
                                                    ? Image.asset(image)
                                                    : Image.file(File(image),height: 250,  fit: BoxFit.cover, // Add a height to resize the image
                                                  width: 250,)
                                                    : Image.file(image as File, fit: BoxFit.cover,  height: 250, // Add a height to resize the image
                                                  width: 250,),
                                                // Image.file(
                                                //   File(image),
                                                //   fit: BoxFit.cover,
                                                //   height: 250, // Add a height to resize the image
                                                //   width: 250,
                                                //
                                                // ),
                                              );
                                            }).toList(),
                                            carouselController: _carouselController,
                                            options: CarouselOptions(
                                              height: 550,
                                              autoPlay: _isAutoPlay,
                                              autoPlayInterval: const Duration(seconds: 2),
                                              enlargeCenterPage: true,
                                              viewportFraction: 1.0,
                                              aspectRatio: 1.0,
                                              initialPage: 0,
                                              reverse: true,
                                              onPageChanged: (index, reason) {
                                                setState(() {
                                                  _currentIndex = index;
                                                });
                                              },
                                            ),
                                          )),
                                      Center(
                                        child: Image.asset(
                                          'assets/images/mobleIphone.png',
                                          fit: BoxFit.cover,
                                          //width: 600,
                                          height:600,

                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(8)),
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 5, top: 5),
                                          child: SmoothPageIndicator(
                                            // key: keyButton1,
                                            controller: controller,
                                            count: filteredInfos[index]?.Material_Path_List?.length ?? 1,
                                            effect: WormEffect(
                                              activeDotColor: Colors.yellow[700]!,
                                              radius: 15,
                                              strokeWidth: 1,
                                              dotHeight: 10,
                                              dotWidth: 10,
                                              dotColor: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Padding(
                          //   padding:
                          //   const EdgeInsets.all(12.0),
                          //   child: Stack(
                          //     alignment:
                          //     Alignment.bottomCenter,
                          //     children: [
                          //       Container(
                          //         width:
                          //         MediaQuery.of(context)
                          //             .size
                          //             .width -
                          //             30,
                          //         height:
                          //         MediaQuery.of(context)
                          //             .size
                          //             .height /
                          //             1.50,
                          //         decoration: BoxDecoration(
                          //             borderRadius:
                          //             const BorderRadius
                          //                 .all(Radius
                          //                 .circular(
                          //                 8)),
                          //             color: Colors
                          //                 .yellow[700],
                          //             boxShadow: [
                          //               BoxShadow(
                          //                 color: Colors
                          //                     .black
                          //                     .withOpacity(
                          //                     0.5),
                          //                 spreadRadius: 3,
                          //                 blurRadius: 2,
                          //                 offset: const Offset(
                          //                     0,
                          //                     3), // changes position of shadow
                          //               ),
                          //             ]),
                          //         child: PageView.builder(
                          //           itemBuilder:
                          //               (context, item) {
                          //             return
                          //               CachedNetworkImage(
                          //               imageUrl:
                          //               "${filteredInfos[index]?.Material_Path_List?[item]}",
                          //               progressIndicatorBuilder: (context,
                          //                   url,
                          //                   downloadProgress) =>
                          //                   CircularProgressIndicator(
                          //                       value: downloadProgress
                          //                           .progress),
                          //               errorWidget: (context,
                          //                   url,
                          //                   error) =>
                          //               const Icon(Icons
                          //                   .error),
                          //             );
                          //           },
                          //           controller:
                          //           pictureListController,
                          //           itemCount: filteredInfos[
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
                          //         const EdgeInsets.all(
                          //             8.0),
                          //         child: Container(
                          //           decoration:
                          //           const BoxDecoration(
                          //             borderRadius:
                          //             BorderRadius.all(
                          //                 Radius
                          //                     .circular(
                          //                     8)),
                          //             color: Colors.white,
                          //           ),
                          //           child: Row(
                          //             mainAxisAlignment:
                          //             MainAxisAlignment
                          //                 .center,
                          //             children: [
                          //               Padding(
                          //                 padding:
                          //                 const EdgeInsets
                          //                     .only(
                          //                     bottom: 5,
                          //                     top: 5),
                          //                 child:
                          //                 SmoothPageIndicator(
                          //                   // key: keyButton1,
                          //                     controller:
                          //                     pictureListController,
                          //                     count: filteredInfos[index]
                          //                         ?.Material_Path_List
                          //                         ?.length ??
                          //                         1,
                          //                     effect:
                          //                     WormEffect(
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
                          // ),
                          (widget.isForAppTips == true &&
                              filteredInfos[index]?.Is_Step_By_Step == true)
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
                                        filteredInfos[index]
                                            ?.Is_Required ==
                                            false &&
                                        filteredInfos[index]
                                            ?.Is_Step_By_Step ==
                                            true)
                                        ? " خطوة اختيارية "
                                        : (widget.isForAppTips ==
                                        true &&
                                        filteredInfos[index]
                                            ?.Is_Required ==
                                            true &&
                                        filteredInfos[index]
                                            ?.Is_Step_By_Step ==
                                            true)
                                        ? " خطوة اساسية "
                                        : "",
                                    style: GoogleFonts.cairo(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: (widget.isForAppTips ==
                                          true &&
                                          filteredInfos[index]
                                              ?.Is_Required ==
                                              false)
                                          ? Colors.red
                                          : (widget.isForAppTips ==
                                          true &&
                                          filteredInfos[index]
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
                                "${filteredInfos[index]?.Tip_Title}",
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
                            "${filteredInfos[index]?.Related_Screen}",
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
                                  "${filteredInfos[index]?.Tip_Main_Description}",
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
                                  "${filteredInfos[index]?.Tip_Description_Idea}",
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
                                  "${filteredInfos[index]?.Tip_Description_Info}",
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
          // Container(
          //   color: const Color(0xff212D45),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Padding(
          //         padding: const EdgeInsets.only(bottom: 5, top: 5),
          //         child: SmoothPageIndicator(
          //           // key: keyButton1,
          //             controller: controller,
          //             count: filteredInfos.length,
          //             effect: WormEffect(
          //               activeDotColor: Colors.yellow[700]!,
          //               radius: 15,
          //               strokeWidth: 1,
          //               dotHeight: 10,
          //               dotWidth: 10,
          //               dotColor: Colors.grey,
          //             )),
          //       ),
          //     ],
          //   ),
          // ),
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
                    textAlign: TextAlign.end,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'البحث عن سؤال',
                      hintStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 20),
                      prefixIcon: Icon(Icons.search, color: Colors.grey, size: 40),
                      contentPadding: EdgeInsetsDirectional.only( top: 10, bottom: 10,end: 10), // Set the content padding
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50), // Set the border radius to 50 for a circular shape
                        borderSide: BorderSide(color: Colors.grey), // Set the border color to grey
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.white),
                      ),

                      filled: true, // Set filled to true to set the background color
                      fillColor: Colors.grey[600], // Set the background color to dark grey
                    ),
                    onChanged: (query) => _searchInfo(query),
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
                      itemCount: searchResults.isEmpty ? filteredInfos.length : searchResults.length,
                      controller: faqController,
                      itemBuilder: (context, index) {
                        String? youtubeLink = filteredInfos[index]?.Material_Path;
                        Info? info = searchResults.isEmpty ? filteredInfos[index] : searchResults[index];

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

                              children: [

                                Expanded(
                                  child: Text(
                                    "${info?.Tip_Title}",
                                    style: GoogleFonts.markaziText(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff212D45),
                                    ),textAlign: TextAlign.end,
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
                                "${info?.Tip_Title}",
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

  GestureDetector(
    onTap: () async {
     await launchWhatsapp();
    },
    child: SizedBox(

      child: Center(
           child: Image.asset("assets/images/contactUs.png", scale:5.5,)

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
          ?Column(crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(

            height:
           100,
            decoration: BoxDecoration(
              color: const Color(0xff212D45) ,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade600,
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),

            child: Padding(
              padding: const EdgeInsets.only(right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "(${filteredInfos.length})",
                    style: GoogleFonts.cairo(
                      color:  Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "الاخبار الرسمية",
                    style: GoogleFonts.cairo(
                      color:  Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                ],
              ),
            ),
          ),

          /// todo re-enable the youtube part when it's working soon
          // NotificationListener<ScrollNotification>(
          //   onNotification: (notification) {
          //     if (notification is ScrollStartNotification) {
          //       onTap();
          //     } else if (notification is ScrollEndNotification) {
          //       setState(() {
          //         _isAutoPlay = true;
          //       });
          //     }
          //     return true;
          //   },
          //   child:
            Expanded(
            child: ListView(
            //     itemCount: 1,
               controller: faqController,
            //     itemBuilder: (context, index) {
            //       String? youTubeLink =
            //           filteredInfos[index]?.Material_Path;

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
children:[
Column(crossAxisAlignment: CrossAxisAlignment.end,
  children: [
  SizedBox(height: 30,),
    Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            bottom: 20,
            right: 0,
            child:  CarouselSlider(
        items: imageSliders,
        carouselController: _carouselController,
        options: CarouselOptions(
          height: 300,
          autoPlay: _isAutoPlay,
          autoPlayInterval: const Duration(seconds: 2),
          enlargeCenterPage: false, // Change this to false to test
          viewportFraction: 0.8, // Adjust this if needed
          aspectRatio: 1.0,
          initialPage: 0,
          reverse: false,
            onPageChanged: (index, reason) {
              setState(()  {
                _currentIndex = index;
              print(_currentIndex);

              });})
      ),
    ),
          Center(
            child: Image.asset(
              'assets/images/mobleIphone.png',
              fit: BoxFit.cover,
              //width: 600,
              height:600,

            ),
          ),]),

    SizedBox(height: 10),

    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: filteredInfos.asMap().entries.map((entry) {
        return GestureDetector(
          onTap: () => _carouselController.animateToPage(entry.key),
          child: Container(
            width: 15.0,
            height: 15.0,
            margin: const EdgeInsets.symmetric(
                vertical: 8.0, horizontal: 4.0),
            decoration: BoxDecoration(
              border:Border.all(color: Colors.black,width: 1),
                shape: BoxShape.circle,
                color: (Theme.of(context).brightness ==
                    Brightness.dark
                    ? Colors.white
                    : Colors.black)
                    .withOpacity(
                    _currentIndex == entry.key ? 0.9 : 0)),
          ),
        );
      }).toList(),
    ),

  Padding(
    padding: const EdgeInsets.only(right: 50),
    child: Text("${filteredInfos[_currentIndex]!.Tip_Title}",style: GoogleFonts.cairo(
      color:  Color(0xff212D45),
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),),
  ),
  Padding(
    padding: const EdgeInsets.all(20),
    child: GestureDetector(onTap:(){
      onTap();
      print(_isAutoPlay);
      },
        child:Container(
        height:
    150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        color:Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
                        child: Center(
                          child: Column(

                            children: [
                              Text("${filteredInfos[_currentIndex]!.date}"),
                              Linkify( onOpen: (link) async {
                                                    if (await canLaunch(
                                                        link.url)) {
                                                      await launch(
                                                          link.url);
                                                    } else {
                                                      throw 'Could not launch $link';
                                                    }
                                                  },
                                                  text:
                                                  "${filteredInfos[_currentIndex]?.Tip_Description_Info}",
                                                  style: GoogleFonts
                                                      .markaziText(
                                                      fontSize: 20,
                                                      color:Color(0xff212D45)),
                                                  linkStyle:
                                                  const TextStyle(
                                                      color: Colors
                                                          .blue),
                                                ),
                            ],
                          ),
                        ))),
  ),
    Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        height: 500,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                physics: ClampingScrollPhysics(), // Add this
                itemCount: filteredInfos[_currentIndex]?.Material_Path_List!.length,

                itemBuilder: (context, index) {
                  return Image.asset(
                    filteredInfos[_currentIndex]?.Material_Path_List![index],
                    scale: 3,
                  );
                },
                itemExtent: 300,
      padding: EdgeInsets.all(30),

              ),
            ),
          ],
        ),
      ),
    )])]
                  // return Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Container(
                  //       decoration: BoxDecoration(
                  //           borderRadius: const BorderRadius.all(
                  //               Radius.circular(8)),
                  //           color: const Color(0xff212D45),
                  //           boxShadow: [
                  //             BoxShadow(
                  //               color:
                  //               Colors.black.withOpacity(0.5),
                  //               spreadRadius: 3,
                  //               blurRadius: 2,
                  //               offset: const Offset(0,
                  //                   3), // changes position of shadow
                  //             ),
                  //           ]),
                  //       child: ExpansionTile(
                  //         onExpansionChanged: (value) {
                  //           tips.setTitleAvailability(
                  //               value: value);
                  //         },
                  //         trailing: const Icon(
                  //           Icons.keyboard_arrow_down_outlined,
                  //           color: Colors.white,
                  //         ),
                  //         initiallyExpanded: true,
                  //         title: Row(
                  //           children: [
                  //             Container(
                  //               decoration: BoxDecoration(
                  //                 borderRadius:
                  //                 const BorderRadius.all(
                  //                     Radius.circular(2)),
                  //                 color: Colors.yellow[700],
                  //               ),
                  //               padding: const EdgeInsets.only(
                  //                   left: 8, right: 8.0),
                  //               child: Text(
                  //                 "${index + 1}",
                  //                 style: GoogleFonts.cairo(
                  //                     fontSize: 16,
                  //                     color: Colors.black),
                  //               ),
                  //             ),
                  //             const SizedBox(
                  //               width: 5,
                  //             ),
                  //             Expanded(
                  //               child: Container(
                  //                 decoration: const BoxDecoration(
                  //                   borderRadius:
                  //                   BorderRadius.all(
                  //                       Radius.circular(2)),
                  //                   color: Colors.white,
                  //                 ),
                  //                 child: Padding(
                  //                   padding:
                  //                   const EdgeInsets.only(
                  //                       left: 8.0,
                  //                       right: 8.0),
                  //                   child: Row(
                  //                     children: [
                  //                       Row(
                  //                         children: [
                  //                           Padding(
                  //                             padding:
                  //                             const EdgeInsets
                  //                                 .all(4.0),
                  //                             child: Text(
                  //                               "${allInfo[index]?.Tip_Title}",
                  //                               style: GoogleFonts.markaziText(
                  //                                   fontSize: 20,
                  //                                   fontWeight:
                  //                                   FontWeight
                  //                                       .bold,
                  //                                   color: Colors
                  //                                       .black),
                  //                             ),
                  //                           ),
                  //                         ],
                  //                         mainAxisAlignment:
                  //                         MainAxisAlignment
                  //                             .center,
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //         children: [
                  //           Card(
                  //             color: const Color(0xff212D45),
                  //             child: Column(
                  //               children: [
                  //                 Row(
                  //                   children: [
                  //                     Container(
                  //                       decoration:
                  //                       const BoxDecoration(
                  //                         borderRadius:
                  //                         BorderRadius.all(
                  //                             Radius.circular(
                  //                                 2)),
                  //                         color: Colors.grey,
                  //                       ),
                  //                       padding:
                  //                       const EdgeInsets.only(
                  //                           left: 8,
                  //                           right: 8.0),
                  //                       child: Text(
                  //                         "${time.showDate2(allInfo[index]!.date!.toDate())}",
                  //                         style:
                  //                         GoogleFonts.cairo(
                  //                             fontSize: 16,
                  //                             color: Colors
                  //                                 .black),
                  //                       ),
                  //                     ),
                  //                   ],
                  //                   mainAxisAlignment:
                  //                   MainAxisAlignment.end,
                  //                 ),
                  //                 const SizedBox(
                  //                   height: 10,
                  //                 ),
                  //                 Padding(
                  //                   padding:
                  //                   const EdgeInsets.all(8.0),
                  //                   child: Padding(
                  //                       padding:
                  //                       const EdgeInsets.all(
                  //                           8.0),
                  //                       child: Linkify(
                  //                         onOpen: (link) async {
                  //                           if (await canLaunch(
                  //                               link.url)) {
                  //                             await launch(
                  //                                 link.url);
                  //                           } else {
                  //                             throw 'Could not launch $link';
                  //                           }
                  //                         },
                  //                         text:
                  //                         "${allInfo[index]?.Tip_Description_Info}",
                  //                         style: GoogleFonts
                  //                             .markaziText(
                  //                             fontSize: 20,
                  //                             color: Colors
                  //                                 .white),
                  //                         linkStyle:
                  //                         const TextStyle(
                  //                             color: Colors
                  //                                 .blue),
                  //                       )),
                  //                 ),
                  //                 (allInfo[index]?.Is_Material_Lottie ==
                  //                     true &&
                  //                     allInfo[index]?.Material_Path !=
                  //                         "" &&
                  //                     allInfo[index]?.Material_Path !=
                  //                         null)
                  //                     ? Container(
                  //                   decoration:
                  //                   const BoxDecoration(
                  //                       color: Colors
                  //                           .white),
                  //                   child: Lottie.network(
                  //                     "${allInfo[index]?.Material_Path}",
                  //                     width: MediaQuery.of(
                  //                         context)
                  //                         .size
                  //                         .width -
                  //                         30,
                  //                     height: MediaQuery.of(
                  //                         context)
                  //                         .size
                  //                         .height /
                  //                         1.50,
                  //                   ),
                  //                 )
                  //                     : (allInfo[index]?.Is_Material_YouTube ==
                  //                     true &&
                  //                     allInfo[index]?.Material_Path !=
                  //                         "" &&
                  //                     allInfo[index]?.Material_Path !=
                  //                         null)
                  //                     ? Padding(
                  //                   padding:
                  //                   const EdgeInsets
                  //                       .all(8.0),
                  //                   child: Container(
                  //                     decoration:
                  //                     const BoxDecoration(
                  //                         color: Colors
                  //                             .white),
                  //                     child: Text(
                  //                         "${youTubeLink}"),
                  //                     // YoutubePlayer(
                  //                     //     controller:
                  //                     //         youtubeController,
                  //                     //     showVideoProgressIndicator:
                  //                     //         true),
                  //                   ),
                  //                 )
                  //                     : ((allInfo[index]?.Material_Path_List?.length ?? 0) == 0 &&
                  //                     allInfo[index]
                  //                         ?.Material_Path !=
                  //                         "" &&
                  //                     allInfo[index]
                  //                         ?.Material_Path !=
                  //                         null)
                  //                     ? Container(
                  //                     width: MediaQuery.of(context)
                  //                         .size
                  //                         .width -
                  //                         30,
                  //                     height: MediaQuery.of(context)
                  //                         .size
                  //                         .height /
                  //                         1.50,
                  //                     decoration:
                  //                     const BoxDecoration(
                  //                       color: Color(
                  //                           0xff212D45),
                  //                     ),
                  //                     child:
                  //                     CachedNetworkImage(
                  //                       imageUrl:
                  //                       "${allInfo[index]?.Material_Path}",
                  //                       progressIndicatorBuilder: (context,
                  //                           url,
                  //                           downloadProgress) =>
                  //                           CircularProgressIndicator(
                  //                               value:
                  //                               downloadProgress.progress),
                  //                       errorWidget: (context,
                  //                           url,
                  //                           error) =>
                  //                       const Icon(
                  //                           Icons
                  //                               .error),
                  //                     ))
                  //                     : ((allInfo[index]?.Material_Path_List?.length ??
                  //                     0) >
                  //                     0 &&
                  //                     (allInfo[index]?.Material_Path ==
                  //                         "" ||
                  //                         allInfo[index]?.Material_Path ==
                  //                             null))
                  //                     ? Padding(
                  //                   padding:
                  //                   const EdgeInsets
                  //                       .all(
                  //                       12.0),
                  //                   child:
                  //                   Stack(
                  //                     alignment:
                  //                     Alignment
                  //                         .bottomCenter,
                  //                     children: [
                  //                       Container(
                  //                         width:
                  //                         MediaQuery.of(context).size.width - 30,
                  //                         height:
                  //                         MediaQuery.of(context).size.height / 1.50,
                  //                         decoration: BoxDecoration(
                  //                             borderRadius: const BorderRadius.all(Radius.circular(8)),
                  //                             color: const Color(0xff212D45),
                  //                             boxShadow: [
                  //                               BoxShadow(
                  //                                 color: Colors.black.withOpacity(0.5),
                  //                                 spreadRadius: 3,
                  //                                 blurRadius: 2,
                  //                                 offset: const Offset(0, 3), // changes position of shadow
                  //                               ),
                  //                             ]),
                  //                         child:
                  //                         PageView.builder(
                  //                           itemBuilder:
                  //                               (context, item) {
                  //                             return CachedNetworkImage(
                  //                               imageUrl: "${allInfo[index]?.Material_Path_List?[item]}",
                  //                               progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
                  //                               errorWidget: (context, url, error) => const Icon(Icons.error),
                  //                             );
                  //                           },
                  //                           controller:
                  //                           pictureListController,
                  //                           itemCount:
                  //                           allInfo[index]?.Material_Path_List?.length ?? 1,
                  //                           scrollDirection:
                  //                           Axis.horizontal,
                  //                         ),
                  //                       ),
                  //                       Padding(
                  //                         padding: const EdgeInsets
                  //                             .all(
                  //                             8.0),
                  //                         child:
                  //                         Container(
                  //                           decoration:
                  //                           const BoxDecoration(
                  //                             borderRadius: BorderRadius.all(Radius.circular(8)),
                  //                             color: Colors.white,
                  //                           ),
                  //                           child:
                  //                           Row(
                  //                             mainAxisAlignment: MainAxisAlignment.center,
                  //                             children: [
                  //                               Padding(
                  //                                 padding: const EdgeInsets.only(bottom: 5, top: 5),
                  //                                 child: SmoothPageIndicator(
                  //                                   // key: keyButton1,
                  //                                     controller: pictureListController,
                  //                                     count: allInfo[index]?.Material_Path_List?.length ?? 1,
                  //                                     effect: WormEffect(
                  //                                       activeDotColor: Colors.yellow[700]!,
                  //                                       radius: 15,
                  //                                       strokeWidth: 1,
                  //                                       dotHeight: 10,
                  //                                       dotWidth: 10,
                  //                                       dotColor: Colors.grey,
                  //                                     )),
                  //                               ),
                  //                             ],
                  //                           ),
                  //                         ),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 )
                  //                     : const SizedBox(),
                  //               ],
                  //             ),
                  //           )
                  //         ],
                  //       )),
                  // );
                //}
                ),
         // ),
       // )
            )],
        )
          : const SizedBox(),


    );
  }
}
