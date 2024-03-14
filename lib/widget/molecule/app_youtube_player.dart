import 'dart:async';

import 'package:alvamind_three_library_frontend/app/theme/app_colors.dart';
import 'package:alvamind_three_library_frontend/app/theme/app_sizes.dart';
import 'package:alvamind_three_library_frontend/app/utility/console_log.dart';
import 'package:alvamind_three_library_frontend/widget/atom/app_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AppYoutubePlayer extends StatefulWidget {
  final YoutubePlayerController? controller;
  final String videoId;
  final bool fullScreen;
  final Duration? currentPosition;
  final Function()? onTapPlayPauseFunc;
  final Function()? onTapNext;
  final Function()? onTapPrev;
  final Function()? onTapFullScreen;
  final Function()? onReady;

  const AppYoutubePlayer({
    super.key,
    this.controller,
    required this.videoId,
    this.fullScreen = false,
    this.currentPosition,
    this.onTapPlayPauseFunc,
    this.onTapNext,
    this.onTapPrev,
    this.onTapFullScreen,
    this.onReady,
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

  void playPauseFunc() {
    if (controller.value.playerState == PlayerState.playing) {
      if (controllerVisibility == false) {
        // visible controller
        controllerVisibility = true;
        setState(() {});

        // auto unvisible controller in 3 seconds
        _timer = Timer(const Duration(seconds: 3), () {
          controllerVisibility = false;
          setState(() {});
        });
      } else {
        // prevent screen off disabled
        // WakelockPlus.disable();

        controller.pause();
        setState(() {});

        _timer?.cancel();
        controllerVisibility = true;
      }
    } else {
      if (controller.value.playerState == PlayerState.ended) {
        // prevent screen off enabled
        // WakelockPlus.enable();

        cl(controller.value.playerState.name);

        controller.play();
        controller.seekTo(Duration.zero);
        setState(() {});

        // auto unvisible controller in 3 seconds
        _timer = Timer(const Duration(seconds: 3), () {
          controllerVisibility = false;
          setState(() {});
        });
      } else {
        // prevent screen off enabled
        // WakelockPlus.enable();

        controller.play();
        setState(() {});

        // auto unvisible controller in 3 seconds
        _timer = Timer(const Duration(seconds: 3), () {
          controllerVisibility = false;
          setState(() {});
        });
      }
    }

    if (widget.onTapPlayPauseFunc != null) {
      widget.onTapPlayPauseFunc!();
    }

    setState(() {});
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
    controller = widget.controller ??
        YoutubePlayerController(
          initialVideoId: widget.videoId,
          flags: YoutubePlayerFlags(
            autoPlay: true,
            enableCaption: true,
            captionLanguage: 'id',
            hideControls: true,
            hideThumbnail: true,
            startAt: widget.currentPosition?.inSeconds ?? 0,
          ),
        );

    controller.addListener(videoControllerListener);

    super.initState();
  }

  void videoControllerListener() {
    if (mounted) {
      setState(() {});
    }
  }

  void onReady() async {
    if (widget.currentPosition != null) {
      controller.seekTo(widget.currentPosition!);
      controller.play();
      setState(() {});

      _timer = Timer(const Duration(seconds: 3), () {
        controllerVisibility = false;
        setState(() {});
      });
    }

    if (widget.onReady != null) {
      widget.onReady!();
    }
  }

  /// Formats duration in milliseconds to xx:xx:xx format.
  String durationFormatter(int milliSeconds) {
    var seconds = milliSeconds ~/ 1000;
    final hours = seconds ~/ 3600;
    seconds = seconds % 3600;
    var minutes = seconds ~/ 60;
    seconds = seconds % 60;
    final hoursString = hours >= 10
        ? '$hours'
        : hours == 0
            ? '00'
            : '0$hours';
    final minutesString = minutes >= 10
        ? '$minutes'
        : minutes == 0
            ? '00'
            : '0$minutes';
    final secondsString = seconds >= 10
        ? '$seconds'
        : seconds == 0
            ? '00'
            : '0$seconds';
    final formattedTime = '${hoursString == '00' ? '' : '$hoursString:'}$minutesString:$secondsString';
    return formattedTime;
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
                playedColor: AppColors.primary,
                handleColor: AppColors.blueLv2,
              ),
              onReady: onReady,
            ),
            playerController(),
          ],
        ),
      ),
    );
  }

  Widget playerController() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        playPauseOverlay(),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: ProgressBar(
        controller: controller,
        colors: const ProgressBarColors(
          playedColor: AppColors.blueLv2,
          handleColor: AppColors.blueLv3,
          backgroundColor: Colors.white30,
          bufferedColor: Colors.white54,
        ),
      ),
    );
    // return controller.value.isReady
    //     ? LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
    //         return GestureDetector(
    //           onTap: () {
    //             // TODO NOT WORKING ACCURATELY
    //             // var second =
    //             //     controller.value.position.inSeconds / controller.metadata.duration.inSeconds * constraints.maxWidth;
    //             // cl(second.toInt());
    //             // controller.seekTo(Duration(seconds: second.toInt()));
    //           },
    //           child: Container(
    //             margin: const EdgeInsets.symmetric(horizontal: 10),
    //             child: AppProgressLine(
    //               maxValue: maxValue,
    //               value: value,
    //               lineHeight: 3,
    //               borderRadius: 100,
    //               showLabel: false,
    //             ),
    //           ),
    //         );
    //       })
    //     : const SizedBox.shrink();
  }

  Widget playPauseIconButton() {
    return GestureDetector(
      onTap: () {
        playPauseFunc();
      },
      child: Container(
        margin: const EdgeInsets.only(top: 6, bottom: 8),
        child: Icon(
          controller.value.playerState == PlayerState.playing
              ? Icons.pause
              : controller.value.playerState == PlayerState.paused
                  ? Icons.play_arrow
                  : controller.value.playerState == PlayerState.ended
                      ? Icons.replay_rounded
                      : Icons.pause,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }

  Widget videoDurationWidget() {
    return Container(
      margin: const EdgeInsets.only(left: 6),
      child: Row(
        children: [
          CurrentPosition(controller: controller),
          Text(
            ' / ${durationFormatter(controller.metadata.duration.inMilliseconds)}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget fullScreenIconButton() {
    return GestureDetector(
      onTap: widget.onTapFullScreen != null
          ? () {
              widget.onTapFullScreen!();
              setState(() {});
            }
          : () async {
              if (!widget.fullScreen) {
                controller.pause();

                var curr = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AppYoutubePlayerFullScreen(
                      controller: controller,
                      child: AppYoutubePlayer(
                        // controller: controller,
                        currentPosition: controller.value.position,
                        videoId: widget.videoId,
                        fullScreen: true,
                        onTapNext: widget.onTapNext,
                        onTapPrev: widget.onTapPrev,
                        onTapPlayPauseFunc: widget.onTapPlayPauseFunc,
                      ),
                    ),
                  ),
                );

                if (curr != null) {
                  controller.play();
                  controller.seekTo(curr!);

                  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
                  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
                }
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

  Widget playPauseOverlay() {
    return Stack(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            playPauseFunc();
          },
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          reverseDuration: const Duration(milliseconds: 200),
          child: controller.value.playerState != PlayerState.buffering
              ? controller.value.playerState == PlayerState.paused || controller.value.playerState == PlayerState.ended
                  ? Container(
                      color: Colors.black26,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: widget.onTapPrev,
                            child: Container(
                              padding: const EdgeInsets.all(AppSizes.padding),
                              color: Colors.transparent,
                              child: Icon(
                                Icons.skip_previous_rounded,
                                color: widget.onTapPrev == null ? Colors.transparent : Colors.white,
                                size: 45,
                              ),
                            ),
                          ),
                          const SizedBox(width: AppSizes.padding),
                          GestureDetector(
                            onTap: () {
                              playPauseFunc();
                            },
                            child: Container(
                              padding: const EdgeInsets.all(AppSizes.padding),
                              color: Colors.transparent,
                              child: Icon(
                                controller.value.playerState == PlayerState.ended
                                    ? Icons.replay_rounded
                                    : Icons.play_arrow_rounded,
                                color: Colors.white,
                                size: 75,
                              ),
                            ),
                          ),
                          const SizedBox(width: AppSizes.padding),
                          GestureDetector(
                            onTap: widget.onTapNext,
                            child: Container(
                              padding: const EdgeInsets.all(AppSizes.padding),
                              color: Colors.transparent,
                              child: Icon(
                                Icons.skip_next_rounded,
                                color: widget.onTapNext == null ? Colors.transparent : Colors.white,
                                size: 45,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink()
              : const Center(
                  child: AppProgressIndicator(
                    color: AppColors.white,
                    showMessage: false,
                  ),
                ),
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
