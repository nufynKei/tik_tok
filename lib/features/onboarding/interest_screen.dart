import 'package:flutter/material.dart';
import 'package:tik_tok/constants/gaps.dart';
import 'package:tik_tok/constants/sizes.dart';
import 'package:tik_tok/features/onboarding/tutorial_screen.dart';
import 'package:tik_tok/widgets/interest_button.dart';

class InterestScreen extends StatefulWidget {
  //controller를 사용하기 위해서 less 에서 ful 로 변경
  const InterestScreen({Key? key}) : super(key: key);

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  final ScrollController _scrollController = ScrollController();

  bool _showTitle = false;

  /** if (_scrollController.offset > 112) {
        _showTitle = true;
      } else {
        _showTitle = false;
      }
      여기의 문제점은 112에서 offset 수치가 커질 때 마다, setState가 계속 해서 생긴다는 것. 
      그래서 setState를 각각 마다 넣어줘서 바꿔주게 하고, _showTitle이 true면 retrun으로 만들어줌.
      */

  /// _scrollController.offset
  /// offset 은 얼마나 움직였는지 보여준다. 수치로 표현
  void _onScroll() {
    if (_scrollController.offset > 112) {
      if (_showTitle) return;
      setState(() {
        _showTitle = true;
      });
    } else {
      setState(() {
        _showTitle = false;
      });
    }
  }

  void _onNextTap() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const TutorialScreen(),
        ));
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: _showTitle ? 1 : 0,
            child: const Text("Choose your interests")),
      ),
      body: Scrollbar(
        controller: _scrollController,
        thickness: 2,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size20, vertical: Sizes.size10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Gaps.v16,
              const Text(
                "Choose your interests",
                style: TextStyle(
                    fontSize: Sizes.size40, fontWeight: FontWeight.w500),
              ),
              Gaps.v20,
              const Text(
                "Get better video recommendations",
                style: TextStyle(
                    fontSize: Sizes.size16, fontWeight: FontWeight.w300),
              ),
              Gaps.v64,
              Wrap(
                //가로로 배치
                //한 줄에 안들어가면 다음 줄로 자동으로 넘어감
                //padding없이도, 사이 간격을 조절할 수 있음.
                //vertical
                runSpacing: Sizes.size14,
                //horizontal
                spacing: Sizes.size10,
                children: [
                  for (var interest in interests)
                    InterestButton(interest: interest)
                ],
              )
            ]),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.only(
                bottom: Sizes.size36,
                top: Sizes.size16,
                left: Sizes.size24,
                right: Sizes.size24),
            child: GestureDetector(
              onTap: _onNextTap,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: Sizes.size20),
                decoration:
                    BoxDecoration(color: Theme.of(context).primaryColor),
                child: const Text(
                  "Next",
                  style: TextStyle(color: Colors.white, fontSize: Sizes.size16),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )),
    ); 
  }
}


const interests = [
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
];


                // ListView.builder(
                //     scrollDirection: Axis.vertical,
                //     itemCount: interests.length,
                //     itemBuilder: (BuildContext context, int index) {
                //       return Container(
                //         padding: const EdgeInsets.symmetric(
                //             vertical: Sizes.size14, horizontal: Sizes.size16),
                //         decoration: BoxDecoration(
                //             color: Colors.white,
                //             border: Border.all(
                //                 color: Colors.black.withOpacity(0.1)),
                //             borderRadius: BorderRadius.circular(Sizes.size32),
                //             boxShadow: [
                //               BoxShadow(
                //                   color: Colors.black.withOpacity(0.05),
                //                   blurRadius: 5,
                //                   spreadRadius: 5)
                //             ]),
                //         child: Text(
                //           interests[index],
                //           style: const TextStyle(fontWeight: FontWeight.bold),
                //         ),
                //       );
                //     }),