import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:marquee/marquee.dart';
import 'package:sante_afrique/core/themes/themes.dart';
import 'package:sizer/sizer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../core/constants/constants.dart';
import '../../../core/widgets/buttons/buttons.dart';
import '../home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late YoutubePlayerController _controller;

  final List<Map<String, String>> videos = [
    {
      "image": "assets/news/person1.jpg",
      "title": "webinaires",
      "time": "Il y a 2H",
      "description":
          "Lorem ipsum dolor sit amet consectetur. Adipiscing tincidunt mus purus condimentum sed dictumst commodo. Pharetra tellus.",
      "url": "https://www.youtube.com/watch?v=HhjHYkPQ8F0",
    },
    {
      "image": "assets/news/person2.jpg",
      "title": "webinaires",
      "time": "Il y a 2H",
      "description":
          "Lorem ipsum dolor sit amet consectetur. Adipiscing tincidunt mus purus condimentum sed dictumst commodo. Pharetra tellus.",
      "url": "https://www.youtube.com/watch?v=HhjHYkPQ8F0",
    },
    {
      "image": "assets/news/person3.jpg",
      "title": "webinaires",
      "time": "Il y a 2H",
      "description":
          "Lorem ipsum dolor sit amet consectetur. Adipiscing tincidunt mus purus condimentum sed dictumst commodo. Pharetra tellus.",
      "url": "https://www.youtube.com/watch?v=bTqVqk7FSmY",
    },
    {
      "image": "assets/news/person4.jpg",
      "title": "webinaires",
      "time": "Il y a 2H",
      "description":
          "Lorem ipsum dolor sit amet consectetur. Adipiscing tincidunt mus purus condimentum sed dictumst commodo. Pharetra tellus.",
      "url": "https://www.youtube.com/watch?v=HhjHYkPQ8F0",
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videos[0]["url"]!)!,
      flags: YoutubePlayerFlags(autoPlay: false, mute: false),
    );
  }

  void _playVideo(String url) {
    final videoId = YoutubePlayer.convertUrlToId(url);
    if (videoId != null) {
      _controller.load(videoId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: appColor,
                height: 40,
                child: Marquee(
                  text:
                      '🚀 Bienvenue sur notre application — Les promos continuent ! — Nouveaux produits disponibles ! ',
                  style: TextStyle(color: appWhite, fontSize: 18.sp),
                  scrollAxis: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  blankSpace: 50.0,
                  // espace vide entre deux répétitions
                  velocity: 50.0,
                  // vitesse
                  pauseAfterRound: Duration(seconds: 1),
                  // pause après un cycle
                  startPadding: 10.0,
                  accelerationDuration: Duration(seconds: 1),
                  decelerationDuration: Duration(milliseconds: 500),
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: 20.h,
                  // ton height adaptatif
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                ),
                items:
                    [
                      "assets/slide/slide.jpg",
                      "assets/slide/slide2.png",
                      "assets/slide/slide3.jpg",
                    ].map((imagePath) {
                      return Image.asset(
                        imagePath,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      );
                    }).toList(),
              ),
              Padding(
                padding: EdgeInsets.all(4.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DetailHome()),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(3.w),
                            child: Image.asset(
                              "assets/news/new.jpg",
                              height: 22.h,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            "Santé univ",
                            style: TextStyle(
                              color: appColor,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            AppConstants.subText,
                            style: TextStyle(
                              color: appBlack,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(1.h),
                    Divider(color: appBlack),
                    Gap(1.h),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 4.w,
                        mainAxisSpacing: 4.w,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailHome(),
                              ),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(3.w),
                                child: Image.asset(
                                  "assets/news/new1.jpg",
                                  height: 15.h,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                AppConstants.subText,
                                style: TextStyle(
                                  color: appBlack,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                maxLines: 6,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    Gap(1.h),
                    Text(
                      "Pharmacie",
                      style: TextStyle(
                        color: appColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gap(1.h),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => Gap(1.h),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailHome(),
                              ),
                            );
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(3.w),
                                  child: Image.asset(
                                    "assets/news/new1.jpg",
                                    height: 15.h,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Gap(2.w),
                              Expanded(
                                child: Text(
                                  AppConstants.subText,
                                  style: TextStyle(
                                    color: appBlack,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  maxLines: 6,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    Gap(2.h),
                    // Lecteur vidéo en haut
                    YoutubePlayer(
                      controller: _controller,
                      showVideoProgressIndicator: true,
                      progressIndicatorColor: Colors.red,
                    ),

                    // Liste des vidéos
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => SizedBox(height: 0),
                      itemCount: videos.length,
                      itemBuilder: (context, index) {
                        final video = videos[index];
                        return InkWell(
                          onTap: () => _playVideo(video["url"]!),
                          child: Container(
                            color: appColor.withValues(alpha: .3),
                            padding: EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Image miniature de la vidéo
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    YoutubePlayer.getThumbnail(
                                      videoId:
                                          YoutubePlayer.convertUrlToId(
                                            video["url"]!,
                                          )!,
                                      quality: ThumbnailQuality.medium,
                                    ),
                                    width: 100,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 10),
                                // Texte
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        video["title"]!,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: appWhite,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        video["description"]!,
                                        style: TextStyle(
                                          color: appBlack,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Heure
                                Text(
                                  video["time"]!,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontStyle: FontStyle.italic,
                                    color: appBlack,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    Gap(2.h),
                    Text(
                      "A la une",
                      style: TextStyle(
                        color: appColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gap(1.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(3.w),
                            child: Image.asset(
                              "assets/news/sante.jpg",
                              height: 25.h,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Gap(2.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppConstants.subText,
                                style: TextStyle(
                                  color: appBlack,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                maxLines: 6,
                              ),
                              Gap(2.h),
                              SubmitButton(
                                AppConstants.btnRead,
                                fontSize: 18.sp,
                                height: 5.h,
                                couleur: appBlack,
                                onPressed: () async {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Gap(2.h),
                    Text(
                      "Interviews et Témoignages",
                      style: TextStyle(
                        color: appColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => Gap(2.h),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "${index + 1}",
                                  style: TextStyle(
                                    color: appBlack,
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Gap(2.w),
                            Expanded(
                              flex: 8,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppConstants.subText,
                                    style: TextStyle(
                                      color: appBlack,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    maxLines: 6,
                                  ),
                                  Gap(2.h),
                                  Text(
                                    AppConstants.textDoctor,
                                    style: TextStyle(
                                      color: appBlack,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
