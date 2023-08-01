import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tik_tok/constants/gaps.dart';
import 'package:tik_tok/constants/sizes.dart';

class VideoIconButton extends StatelessWidget {
  const VideoIconButton(
      {Key? key, required this.icon, required this.text, this.onTap})
      : super(key: key);

  final IconData icon;
  final String text;
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      child: Column(
        children: [
          FaIcon(
            icon,
            color: Colors.white,
            size: Sizes.size36,
          ),
          Gaps.v6,
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
