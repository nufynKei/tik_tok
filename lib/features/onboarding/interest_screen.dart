import 'package:flutter/material.dart';
import 'package:tik_tok/constants/gaps.dart';
import 'package:tik_tok/constants/sizes.dart';

class InterestScreen extends StatelessWidget {
  const InterestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose your interests"),
      ),
      body: SingleChildScrollView(
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
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: Sizes.size14, horizontal: Sizes.size16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(color: Colors.black.withOpacity(0.1)),
                        borderRadius: BorderRadius.circular(Sizes.size32),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 5,
                              spreadRadius: 5)
                        ]),
                    child: Text(
                      interest,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
              ],
            )
          ]),
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
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: Sizes.size20),
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: const Text(
                "Next",
                style: TextStyle(color: Colors.white, fontSize: Sizes.size16),
                textAlign: TextAlign.center,
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