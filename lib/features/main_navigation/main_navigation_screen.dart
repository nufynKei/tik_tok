import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tik_tok/constants/gaps.dart';
import 'package:tik_tok/constants/sizes.dart';
import 'package:tik_tok/features/video/video_timeline_screen.dart';
import 'package:tik_tok/widgets/nav_tab.dart';
import 'package:tik_tok/widgets/post_video_button.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({Key? key}) : super(key: key);

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPVBTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: ((context) => Container()), fullscreenDialog: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Offstage(
          offstage: _selectedIndex != 0,
          child: const VideoTimaline(),
        ),
        Offstage(
          offstage: _selectedIndex != 1,
          child: Container(),
        ),
        Offstage(
          offstage: _selectedIndex != 3,
          child: Container(),
        ),
        Offstage(
          offstage: _selectedIndex != 4,
          child: Container(),
        )
      ]),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.size12),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            NavTab(
              onTap: () => _onTap(0),
              text: "Home",
              isSelect: _selectedIndex == 0,
              icon: FontAwesomeIcons.house,
              selectIcon: FontAwesomeIcons.houseChimney,
            ),
            NavTab(
              onTap: () => _onTap(1),
              text: "Discover",
              isSelect: _selectedIndex == 1,
              icon: FontAwesomeIcons.compass,
              selectIcon: FontAwesomeIcons.solidCompass,
            ),
            Gaps.h24,
            GestureDetector(onTap: _onPVBTap, child: const PostVideoButton()),
            Gaps.h24,
            NavTab(
              onTap: () => _onTap(3),
              text: "Inbox",
              isSelect: _selectedIndex == 3,
              icon: FontAwesomeIcons.message,
              selectIcon: FontAwesomeIcons.solidMessage,
            ),
            NavTab(
              onTap: () => _onTap(4),
              text: "Profile",
              isSelect: _selectedIndex == 4,
              icon: FontAwesomeIcons.user,
              selectIcon: FontAwesomeIcons.solidUser,
            )
          ]),
        ),
      ),
    );
  }
}
