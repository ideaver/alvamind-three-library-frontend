import 'dart:async';

import 'package:alvamind_three_library_frontend/widget/molecule/app_progress_line.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AppYoutubePlayer extends StatefulWidget {
  final String videoId;
  final Function(YoutubePlayerController)? onReady;
  final Function()? onTapFullScreen;

  const AppYoutubePlayer({
    super.key,
    required this.videoId,
    this.onReady,
    this.onTapFullScreen,
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
  late YoutubePlayerController _controller;

  bool isPlaylistExpanded = false;

  bool controllerVisibility = true;
  Timer? _timer;

  String videoPosition = '';
  String videoDuration = '';
  double maxValue = 100;
  double value = 0;

  bool isPlayed = false;

  void playPauseFunc() {
    isPlayed = true;

    if (_controller.value.isPlaying) {
      if (controllerVisibility == false) {
        // visible controller
        setState(() {
          controllerVisibility = true;
        });

        // auto unvisible controller in 3 seconds
        _timer = Timer(const Duration(seconds: 3), () {
          setState(() {
            controllerVisibility = false;
          });
        });
      } else {
        // prevent screen off disabled
        // Wakelock.disable();

        _controller.pause();

        _timer?.cancel();
        setState(() {
          controllerVisibility = true;
        });

        setState(() {});
      }
    } else {
      // prevent screen off enabled
      // Wakelock.enable();

      _controller.play();

      // auto unvisible controller in 3 seconds
      _timer = Timer(const Duration(seconds: 3), () {
        setState(() {
          controllerVisibility = false;
        });
      });

      setState(() {});
    }
  }

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        hideControls: true,
        controlsVisibleAtStart: false,
      ),
    );

    // init video controller
    _controller.addListener(videoControllerListener);

    super.initState();
  }

  void videoControllerListener() {
    videoPosition =
        '${_controller.value.position.inHours.remainder(60) == 0 ? '' : '${_controller.value.position.inHours.remainder(6)}:'}${_controller.value.position.inMinutes.remainder(60) == 0 ? '' : '${_controller.value.position.inMinutes.remainder(60)}:'}${_controller.value.position.inSeconds.remainder(60) == 0 ? '0' : _controller.value.position.inSeconds.remainder(60).toString()}';

    value = _controller.value.position.inSeconds.toDouble();

    videoDuration =
        '${_controller.metadata.duration.inHours.remainder(60) == 0 ? '' : '${_controller.metadata.duration.inHours.remainder(60)}:'}${_controller.metadata.duration.inMinutes.remainder(60) == 0 ? '' : '${_controller.value.metaData.duration.inMinutes.remainder(60)}:'}${_controller.value.metaData.duration.inSeconds.remainder(60) == 0 ? '0' : _controller.value.metaData.duration.inSeconds.remainder(60).toString()}';

    maxValue = _controller.metadata.duration.inSeconds.toDouble() > 0
        ? _controller.metadata.duration.inSeconds.toDouble()
        : 100;

    setState(() {});
  }

  void onReady() async {
    videoDuration =
        '${_controller.metadata.duration.inHours.remainder(60) == 0 ? '' : '${_controller.metadata.duration.inHours.remainder(60)}:'}${_controller.metadata.duration.inMinutes.remainder(60) == 0 ? '' : '${_controller.value.metaData.duration.inMinutes.remainder(60)}:'}${_controller.value.metaData.duration.inSeconds.remainder(60) == 0 ? '0' : _controller.value.metaData.duration.inSeconds.remainder(60).toString()}';

    maxValue = _controller.metadata.duration.inSeconds.toDouble() > 0
        ? _controller.metadata.duration.inSeconds.toDouble()
        : 100;

    setState(() {});

    if (widget.onReady != null) {
      widget.onReady!(_controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        children: [
          YoutubePlayer(
            controller: _controller,
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
        playPauseOverlay(),
        videoControllers(),
      ],
    );
  }

  Widget videoControllers() {
    return Visibility(
      visible: isPlayed,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: _controller.value.isReady
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
                  colors: [
                    Colors.black87,
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _controller.value.isReady
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
                    : Container(),
                Container(
                  margin: const EdgeInsets.only(left: 8, right: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              playPauseFunc();
                            },
                            child: Container(
                              margin: const EdgeInsets.only(top: 6, bottom: 8),
                              child: Icon(
                                _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 6),
                            child: Text(
                              '${videoPosition != '' ? '$videoPosition/' : ''}$videoDuration',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          if (widget.onTapFullScreen != null) {
                            widget.onTapFullScreen!();
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
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget playPauseOverlay() {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          reverseDuration: const Duration(milliseconds: 200),
          child: _controller.value.isReady
              ? _controller.value.isPlaying
                  ? const SizedBox.shrink()
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
              : Container(),
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
