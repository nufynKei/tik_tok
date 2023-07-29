import 'package:flutter/material.dart';
import 'package:tik_tok/constants/sizes.dart';

class SeeMoreText extends StatefulWidget {
  final String text;
  final double max;
  const SeeMoreText({Key? key, required this.text, required this.max})
      : super(key: key);

  @override
  _SeeMoreTextState createState() => _SeeMoreTextState();
}

class _SeeMoreTextState extends State<SeeMoreText> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
      maxLines: isOpen ? null : 2,
      text: TextSpan(
        style: const TextStyle(fontSize: Sizes.size12, color: Colors.white),
        children: [
          TextSpan(
            text: isOpen
                ? widget.text
                : "${widget.text.substring(0, (widget.text.length * widget.max).toInt())}...",
          ),
          WidgetSpan(
            child: InkWell(
              onTap: () {
                setState(() {
                  isOpen = !isOpen;
                });
              },
              child: Text(
                isOpen ? "  Less" : "  More",
                style:
                    const TextStyle(color: Colors.blue, fontSize: Sizes.size14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
