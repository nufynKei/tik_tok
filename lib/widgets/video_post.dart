import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tik_tok/constants/gaps.dart';
import 'package:tik_tok/widgets/see_more.dart';
import 'package:tik_tok/widgets/video_comments.dart';
import 'package:tik_tok/widgets/video_icon_button.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../constants/sizes.dart';

class VideoPost extends StatefulWidget {
  final Function onVideoFinished;
  final int index;

  const VideoPost({
    super.key,
    required this.onVideoFinished,
    required this.index,
  });

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost>
    with SingleTickerProviderStateMixin {
  final VideoPlayerController _videoPlayerController =
      VideoPlayerController.asset("assets/videos/traffic.mp4");
  bool isPaused = false;
  double screenWidth = 0.0;
  final Duration _animationDuration = const Duration(milliseconds: 200);
  late final AnimationController _animationController;

  void _onVideoChange() {
    if (_videoPlayerController.value.isInitialized) {
      if (_videoPlayerController.value.duration ==
          _videoPlayerController.value.position) {
        widget.onVideoFinished();
      }
    }
  }

  void _initVideoPlayer() async {
    await _videoPlayerController.initialize();
    await _videoPlayerController.setLooping(true);
    setState(() {});
    _videoPlayerController.addListener(_onVideoChange);
  }

  @override
  void initState() {
    super.initState();
    _initVideoPlayer();
    _animationController = AnimationController(
        vsync: this,
        lowerBound: 1.0,
        upperBound: 1.5,
        value: 1.5,
        duration: _animationDuration);
  }
  @override
  void didChangeDependencies() {
    screenWidth = MediaQuery.of(context).size.width;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction == 1 &&
        !_videoPlayerController.value.isPlaying &&
        !isPaused) {
      _videoPlayerController.play();
    }
    if (_videoPlayerController.value.isPlaying && info.visibleFraction == 0) {
      _onTogglePause();
    }
  }

  void _onTogglePause() {
    if (_videoPlayerController.value.isPlaying) {
      _videoPlayerController.pause();
      _animationController.reverse();
    } else {
      _videoPlayerController.play();
      _animationController.forward();
    }
    setState(() {
      isPaused = !isPaused;
    });
  }

  void _onCommentsTap(BuildContext context) async {
    if (_videoPlayerController.value.isPlaying) {
      _onTogglePause();
    }
    await showModalBottomSheet(
      isScrollControlled: true,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.size14)),
      context: context,
      builder: (context) => const VideoComments(),
    );
    _onTogglePause();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key("${widget.index}"),
      onVisibilityChanged: _onVisibilityChanged,
      child: Stack(
        children: [
          Positioned.fill(
            child: _videoPlayerController.value.isInitialized
                ? VideoPlayer(_videoPlayerController)
                : Container(
                    color: Colors.black,
                  ),
          ),
          Positioned.fill(
            child: GestureDetector(
              onTap: _onTogglePause,
            ),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: Center(
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return
                        //animationController의 값이 변할 때마다 실행
                        Transform.scale(
                      scale: _animationController.value,
                      child: child,
                    );
                  },
                  child: AnimatedOpacity(
                    opacity: isPaused ? 1 : 0,
                    duration: _animationDuration,
                    child: FaIcon(
                      isPaused ? FontAwesomeIcons.pause : FontAwesomeIcons.play,
                      color: Colors.white,
                      size: Sizes.size48,
                    ),
                  ),
                ),
              ),
            ),
          )
          ,
          Positioned(
              bottom: Sizes.size24,
              left: Sizes.size10,
              width: screenWidth * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "@kei",
                    style: TextStyle(
                        fontSize: Sizes.size20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Gaps.v10,
                  Text(
                    "This is my cities traffic",
                    style:
                        TextStyle(color: Colors.white, fontSize: Sizes.size14),
                  ),
                  Gaps.v4,
                  SeeMoreText(
                    text:
                        "A VisibilityDetector widget wraps an existing Flutter widget and fires a callback when the widget's visibility changes. (It actually reports when the visibility of the VisibilityDetector itself changes, and its visibility is expected to be identical to that of its child.)",
                    max: 0.1,
                  )
                ],
              ))
           ,
          Positioned(
            bottom: 20,
            right: 10,
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  foregroundImage: NetworkImage(
                    "https://avatars.githubusercontent.com/u/91458522?v=4",
                  ),
                  child: Text("니꼬"),
                ),
                Gaps.v24,
                const VideoIconButton(
                  icon: FontAwesomeIcons.solidHeart,
                  text: "2.9M",
                ),
                Gaps.v24,
                VideoIconButton(
                  onTap: () => _onCommentsTap(context),
                  icon: FontAwesomeIcons.solidComment,
                  text: "33K",
                ),
                Gaps.v24,
                const VideoIconButton(
                  icon: FontAwesomeIcons.share,
                  text: "Share",
                )
              ],
            ),
          ),
        ], 
      ),
    );
  }
}
