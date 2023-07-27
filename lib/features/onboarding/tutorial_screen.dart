import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tik_tok/constants/gaps.dart';
import 'package:tik_tok/constants/sizes.dart';
import 'package:tik_tok/features/main_navigation/main_navigation_screen.dart';

enum Direction { right, left }

enum Page { first, second }

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({Key? key}) : super(key: key);

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  
  Direction _direction = Direction.right;
  Page _showingPage = Page.first;

  void _onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dx > 0) {
      setState(() {
        _direction = Direction.right;
      });
    } else {
      setState(() {
        _direction = Direction.left;
      });
    }
  }

  void _onPanEnd(DragEndDetails detail) {
    if (_direction == Direction.left) {
      setState(() {
        _showingPage = Page.second;
      });
    } else {
      setState(() {
        _showingPage = Page.first;
      });
    }
  }

  void _onEndterAppTap() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const MainNavigationScreen()),
      (route) => false,
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Scaffold(
          //AppBar 가 없기 때문에 SafeArea를 활용 함으로써 앱 화면의 시계부분을 벗어날 수 있음.
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size24),
            child: SafeArea(
              child: AnimatedCrossFade(
                firstChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "This is first page",
                        style: TextStyle(
                            fontSize: Sizes.size36,
                            fontWeight: FontWeight.w500),
                      ),
                      Gaps.v20,
                      Text(
                        "Videos are personalized for you based on what you watch, like, and share.",
                        style: TextStyle(
                          fontSize: Sizes.size20,
                        ),
                      ),
                    ]),
                secondChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "This is seconds page",
                        style: TextStyle(
                            fontSize: Sizes.size36,
                            fontWeight: FontWeight.w500),
                      ),
                      Gaps.v20,
                      Text(
                        "i love you",
                        style: TextStyle(
                          fontSize: Sizes.size20,
                        ),
                      ),
                    ]), 
                crossFadeState: _showingPage == Page.first
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 300),
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
              child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size24,
              horizontal: Sizes.size24,
            ),
            child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: _showingPage == Page.first ? 0 : 1,
                child: CupertinoButton(
                  onPressed: _onEndterAppTap,
                  color: Theme.of(context).primaryColor,
                  child: const Text('Enter the app!'),
                )),
          ))),
    );
  }
}
  

