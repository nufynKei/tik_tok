import 'package:flutter/material.dart';
import 'package:tik_tok/constants/gaps.dart';
import 'package:tik_tok/constants/sizes.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({Key? key}) : super(key: key);

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          //AppBar 가 없기 때문에 SafeArea를 활용 함으로써 앱 화면의 시계부분을 벗어날 수 있음.
          body: SafeArea(
            child: TabBarView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size20, vertical: Sizes.size32),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Wathch cool video",
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
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size24, vertical: Sizes.size32),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Wathch cool video",
                          style: TextStyle(
                              fontSize: Sizes.size40,
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
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size24, vertical: Sizes.size32),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Wathch cool video",
                          style: TextStyle(
                              fontSize: Sizes.size40,
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
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: Sizes.size48,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  TabPageSelector(
                    color: Colors.white,
                    selectedColor: Colors.black38,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
