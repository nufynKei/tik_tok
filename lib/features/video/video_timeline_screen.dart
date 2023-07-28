import 'package:flutter/material.dart';
import 'package:tik_tok/widgets/video_post.dart';

class VideoTimaline extends StatefulWidget {
  const VideoTimaline({Key? key}) : super(key: key);

  @override
  State<VideoTimaline> createState() => _VideoTimalineState();
}

class _VideoTimalineState extends State<VideoTimaline> {
  
  int _itemCount = 4;
  final PageController _pageController = PageController();
  final _scrollDuration = const Duration(milliseconds: 200);
  final _scrollCurve = Curves.decelerate;

  ///page의 index번호와 _itemCount 숫자를 비교
  ///만약 page가 3번째 이면, itemcount - 1 과 숫자가 같아지니 itemcount는 다시 늘어나고,
  ///그것에 맞춰서, addAll 함수를 이용해, color 갯수도 늘린다.
  ///단지 이것은 무한스크롤이 가능하게 만들기 위해서 이다.
  // void _onPageChanged(int page) {
  //   if (page == _itemCount - 1) {
  //     _itemCount = _itemCount + 4;
  //     colors.addAll([
  //       Colors.blue,
  //       Colors.red,
  //       Colors.yellow,
  //       Colors.teal,
  //     ]);
  //     setState(() {});
  //   }
  // }
  void _onPageChanged(int page) {
    _pageController.animateToPage(page,
        duration: _scrollDuration, curve: _scrollCurve);
    if (page == _itemCount - 1) {
      _itemCount = _itemCount + 4;
    }
    setState(() {});
  }

  void _onVideoFinished() {
    _pageController.nextPage(duration: _scrollDuration, curve: _scrollCurve);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        onPageChanged: _onPageChanged,
        itemCount: _itemCount,
        itemBuilder: (context, index) => VideoPost(
              onVideoFinished: _onVideoFinished,
              index: index
            )
    );
  }
}
