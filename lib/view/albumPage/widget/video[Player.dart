import 'package:catalougeapp/view/homepage/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CustomVideoPlayer extends StatelessWidget {
  final String? videoUrl;
  final HomePageController? controller;
  final int? index;
  final double? width;
  final Function ontap;
  final double? height;
  final bool ishide;
  const CustomVideoPlayer(
      {super.key,
      this.videoUrl,
      this.controller,
      this.index,
      this.width,
      required this.ontap,
      this.height,
      this.ishide = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ontap();
        // print("dasdgs");
      },
      child: Stack(
        children: [
          Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              width: width,
              height: height,
              child: YoutubePlayer(
                  controller: YoutubePlayerController(
                    initialVideoId: YoutubePlayer.convertUrlToId(videoUrl!)!,
                    flags: YoutubePlayerFlags(
                      hideControls: ishide,
                      autoPlay: false,
                      mute: false,
                    ),
                  ),
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.amber,
                  progressColors: const ProgressBarColors(
                    playedColor: Colors.amber,
                    handleColor: Colors.amberAccent,
                  ))),
          InkWell(
            child: Container(
                height: height, width: 150.w, color: Colors.transparent),
            onTap: () {
              ontap();
            },
          ),
        ],
      ),
    );
  }
}
