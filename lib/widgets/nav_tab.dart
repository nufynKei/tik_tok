import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tik_tok/constants/gaps.dart';

class NavTab extends StatelessWidget {
  const NavTab(
      {Key? key,
      required this.text,
      required this.isSelect,
      required this.icon,
      required this.onTap,
      required this.selectIcon})
      : super(key: key);

  final String text;
  final bool isSelect;
  final IconData icon;
  final IconData selectIcon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          color: Colors.black,
          child: AnimatedOpacity(
            opacity: isSelect ? 1 : 0.6,
            duration: const Duration(milliseconds: 300),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(
                  isSelect ? selectIcon : icon,
                  color: Colors.white,
                ),
                Gaps.h5,
                Text(
                  text,
                  style: const TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
