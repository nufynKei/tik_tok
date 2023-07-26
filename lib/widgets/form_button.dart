import 'package:flutter/material.dart';
import 'package:tik_tok/constants/sizes.dart';

class Button_A extends StatelessWidget {
  const Button_A({
    super.key,
    required this.disabled,
    this.tap,
    this.text = "Next",
  });
  final String text;
  final bool disabled;
  final Function()? tap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: FractionallySizedBox(
        widthFactor: 1,
        child: AnimatedContainer(
          padding: const EdgeInsets.symmetric(vertical: Sizes.size16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Sizes.size5),
              color: disabled
                  ? Colors.grey.shade300
                  : Theme.of(context).primaryColor),
          duration: const Duration(milliseconds: 400),
          child: Center(
            child: AnimatedDefaultTextStyle(
              style: TextStyle(
                  color: disabled ? Colors.grey.shade600 : Colors.white,
                  fontWeight: FontWeight.w300),
              duration: const Duration(milliseconds: 400),
              child: Text(
                text,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
