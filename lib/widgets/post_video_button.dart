import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tik_tok/constants/sizes.dart';

class PostVideoButton extends StatelessWidget {
  const PostVideoButton({Key? key, required this.inverted}) : super(key: key);

  final bool inverted;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          right: Sizes.size16 + Sizes.size8,
          child: Container(
            height: Sizes.size28 + Sizes.size2,
            width: Sizes.size24,
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size8),
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(Sizes.size11)),
          ),
        ),
        Positioned(
          left: Sizes.size16 + Sizes.size8,
          child: Container(
            height: Sizes.size28 + Sizes.size2,
            width: Sizes.size24,
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size8),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(Sizes.size11)),
          ),
        ),
        Container(
          height: Sizes.size28 + Sizes.size2,
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size12),
          decoration: BoxDecoration(
              color: inverted ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(Sizes.size10)),
          child: Center(
              child: FaIcon(
            FontAwesomeIcons.plus,
            size: Sizes.size20,
            color: inverted ? Colors.white : Colors.black,
          )),
        )
      ],
    );
  }
}
