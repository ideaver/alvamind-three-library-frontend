import 'dart:async';

import 'package:alvamind_three_library_frontend/widget/molecule/app_progress_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AppYoutubePlayer extends StatefulWidget {
  final String videoId;
  final bool fullScreen;
  final Duration? currentPosition;

  const AppYoutubePlayer({
    super.key,
    required this.videoId,
    this.fullScreen = false,
    this.currentPosition,
  });

  // Utility
  // Convert url to video id
  static String? converUrlToId(String url) {
    return YoutubePlayer.convertUrlToId(url);
  }

  // Get video thumbnail
  static String getThumbnail(String videoId) {
    return YoutubePlayer.getThumbnail(videoId: videoId);
  }

  @override
  AppYoutubePlayerState createState() => AppYoutubePlayerState();
}

class AppYoutubePlayerState extends State<AppYoutubePlayer> {
  late YoutubePlayerController controller;

  bool controllerVisibility = true;
  Timer? _timer;

  String videoPosition = '';
  String videoDuration = '';
  double maxValue = 100;
  double value = 0;

  void playPauseFunc() {
    if (controller.value.isPlaying) {
      if (controllerVisibility == false) {
        // visible controller
        setState(() {
          controllerVisibility = true;
        });

        // auto unvisible controller in 3 seconds
        _timer = Timer(const Duration(seconds: 3), () {
          controllerVisibility = false;
          setState(() {});
        });
      } else {
        // prevent screen off disabled
        WakelockPlus.disable();

        controller.pause();

        _timer?.cancel();
        setState(() {
          controllerVisibility = true;
        });

        setState(() {});
      }
    } else {
      // prevent screen off enabled
      WakelockPlus.enable();

      controller.play();

      // auto unvisible controller in 3 seconds
      _timer = Timer(const Duration(seconds: 3), () {
        controllerVisibility = false;
        setState(() {});
      });

      setState(() {});
    }
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      fn;
    }
    super.setState(fn);
  }

  @override
  void initState() {
    controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        hideControls: true,
        controlsVisibleAtStart: false,
      ),
    );

    // init video controller
    controller.addListener(videoControllerListener);

    super.initState();
  }

  void videoControllerListener() {
    videoPosition =
        '${controller.value.position.inHours.remainder(60) == 0 ? '' : '${controller.value.position.inHours.remainder(6)}:'}${controller.value.position.inMinutes.remainder(60) == 0 ? '' : '${controller.value.position.inMinutes.remainder(60)}:'}${controller.value.position.inSeconds.remainder(60) == 0 ? '0' : controller.value.position.inSeconds.remainder(60).toString()}';

    value = controller.value.position.inSeconds.toDouble();

    videoDuration =
        '${controller.metadata.duration.inHours.remainder(60) == 0 ? '' : '${controller.metadata.duration.inHours.remainder(60)}:'}${controller.metadata.duration.inMinutes.remainder(60) == 0 ? '' : '${controller.value.metaData.duration.inMinutes.remainder(60)}:'}${controller.value.metaData.duration.inSeconds.remainder(60) == 0 ? '0' : controller.value.metaData.duration.inSeconds.remainder(60).toString()}';

    maxValue =
        controller.metadata.duration.inSeconds.toDouble() > 0 ? controller.metadata.duration.inSeconds.toDouble() : 100;

    setState(() {});
  }

  void onReady() async {
    videoDuration =
        '${controller.metadata.duration.inHours.remainder(60) == 0 ? '' : '${controller.metadata.duration.inHours.remainder(60)}:'}${controller.metadata.duration.inMinutes.remainder(60) == 0 ? '' : '${controller.value.metaData.duration.inMinutes.remainder(60)}:'}${controller.value.metaData.duration.inSeconds.remainder(60) == 0 ? '0' : controller.value.metaData.duration.inSeconds.remainder(60).toString()}';

    maxValue =
        controller.metadata.duration.inSeconds.toDouble() > 0 ? controller.metadata.duration.inSeconds.toDouble() : 100;

    if (widget.currentPosition != null) {
      controller.play();
      controller.seekTo(widget.currentPosition!);

      _timer = Timer(const Duration(seconds: 3), () {
        controllerVisibility = false;
        setState(() {});
      });
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return body();
  }

  Widget body() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            YoutubePlayer(
              controller: controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.amber,
              progressColors: const ProgressBarColors(
                playedColor: Colors.amber,
                handleColor: Colors.amberAccent,
              ),
              onReady: onReady,
            ),
            playerController(),
          ],
        ),
      ),
    );
  }

  Widget controllerWidget() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        children: [
          playerController(),
        ],
      ),
    );
  }

  Widget playerController() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        playPlayPauseOverlay(),
        videoControllers(),
      ],
    );
  }

  Widget videoControllers() {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: controller.value.isReady
          ? controllerVisibility
              ? 1.0
              : 0.0
          : 0.0,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 75,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.black87, Colors.transparent],
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              videoSeekLine(),
              Container(
                margin: const EdgeInsets.only(left: 8, right: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        playPauseIconButton(),
                        videoDurationWidget(),
                      ],
                    ),
                    fullScreenIconButton(),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget videoSeekLine() {
    return controller.value.isReady
        ? Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: AppProgressLine(
              maxValue: maxValue,
              value: value,
              lineHeight: 2,
              borderRadius: 100,
              showLabel: false,
            ),
          )
        : Container();
  }

  Widget playPauseIconButton() {
    return GestureDetector(
      onTap: () {
        playPauseFunc();
      },
      child: Container(
        margin: const EdgeInsets.only(top: 6, bottom: 8),
        child: Icon(
          controller.value.isPlaying && controller.value.position != controller.value.metaData.duration
              ? Icons.pause
              : Icons.play_arrow,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }

  Widget videoDurationWidget() {
    return Container(
      margin: const EdgeInsets.only(left: 6),
      child: Text(
        '${videoPosition != '' ? '$videoPosition/' : ''}$videoDuration',
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  Widget fullScreenIconButton() {
    return GestureDetector(
      onTap: () async {
        if (!widget.fullScreen) {
          controller.pause();

          var curr = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AppYoutubePlayerFullScreen(
                controller: controller,
                child: AppYoutubePlayer(
                  videoId: widget.videoId,
                  fullScreen: true,
                  currentPosition: controller.value.position,
                ),
              ),
            ),
          );

          if (curr != null) {
            controller.play();
            controller.seekTo(curr!);
          }
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
          SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
        } else {
          Navigator.pop(context, controller.value.position);
        }
      },
      child: Container(
        margin: const EdgeInsets.only(top: 6, bottom: 8),
        child: const Icon(
          Icons.fullscreen,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }

  Widget playPlayPauseOverlay() {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          reverseDuration: const Duration(milliseconds: 200),
          child: controller.value.isReady
              ? controller.value.isPlaying
                  ? controller.value.position == controller.value.metaData.duration
                      ? Container(
                          color: Colors.black26,
                          child: const Center(
                            child: Icon(
                              Icons.replay,
                              color: Colors.white,
                              size: 75.0,
                            ),
                          ),
                        )
                      : const SizedBox.shrink()
                  : Container(
                      color: Colors.black26,
                      child: const Center(
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 75.0,
                        ),
                      ),
                    )
              : const Center(child: CircularProgressIndicator(color: Colors.white)),
        ),
        GestureDetector(
          onTap: () {
            playPauseFunc();
          },
        ),
      ],
    );
  }
}

class AppYoutubePlayerFullScreen extends StatelessWidget {
  final Widget child;
  final YoutubePlayerController controller;

  const AppYoutubePlayerFullScreen({
    super.key,
    required this.child,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);

    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, controller.value.position);
        return Future.value(true);
      },
      child: child,
    );
  }
}
