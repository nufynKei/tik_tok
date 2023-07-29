import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VideoComments extends StatefulWidget {
  const VideoComments({Key? key}) : super(key: key);

  @override
  State<VideoComments> createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments> {
  double screenHeight = 0.0;

  void _onBack() {
    Navigator.of(context).pop();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenHeight = MediaQuery.of(context).size.height;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.6,
      child: Scaffold(
        appBar: AppBar(
          //AbbBar에 자동적으로 나오는 backButton icon 기능 끄기
          automaticallyImplyLeading: false,
          title: const Text("123123 comments"),
          actions: [
            IconButton(
                onPressed: _onBack, icon: const FaIcon(FontAwesomeIcons.xmark))
          ],
        ),
        body: Container(),
      ),
    );
  }
}
