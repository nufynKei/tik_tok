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
      required this.selectIcon,
      required this.selectedIndex})
      : super(key: key);

  final String text;
  final bool isSelect;
  final IconData icon;
  final IconData selectIcon;
  final Function onTap;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          color: selectedIndex == 0 ? Colors.black : Colors.white,
          child: AnimatedOpacity(
            opacity: isSelect ? 1 : 0.6,
            duration: const Duration(milliseconds: 300),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(
                  isSelect ? selectIcon : icon,
                  color: selectedIndex == 0 ? Colors.white : Colors.black,
                ),
                Gaps.h5,
                Text(
                  text,
                  style: TextStyle(
                      color: selectedIndex == 0 ? Colors.white : Colors.black),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
