import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tik_tok/constants/sizes.dart';

class DiscoverTextField extends StatefulWidget {
  const DiscoverTextField({Key? key, required this.textEditingController})
      : super(key: key);
  final TextEditingController textEditingController;

  @override
  State<DiscoverTextField> createState() => _DiscoverTextFieldState();
}

class _DiscoverTextFieldState extends State<DiscoverTextField> {
  @override
  void dispose() {
    super.dispose();
  }

  void _onClearText() {
    widget.textEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 40,
        child: TextField(
          controller: widget.textEditingController,
          cursorColor: Theme.of(context).primaryColor,
          decoration: InputDecoration(
              hintText: "Search",
              contentPadding: const EdgeInsets.symmetric(vertical: Sizes.size6),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  Sizes.size4,
                ),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey.shade200,
              prefixIcon: const Padding(
                padding: EdgeInsets.symmetric(horizontal: Sizes.size10),
                child: FaIcon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: Colors.black,
                  size: Sizes.size16,
                ),
              ),
              prefixIconConstraints:
                  const BoxConstraints(minWidth: Sizes.size20),
              suffixIcon: GestureDetector(
                onTap: _onClearText,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: Sizes.size10),
                  child: FaIcon(
                    FontAwesomeIcons.circleXmark,
                    color: Colors.black,
                    size: Sizes.size16,
                  ),
                ),
              ),
              suffixIconConstraints:
                  const BoxConstraints(minWidth: Sizes.size20)),
        ),
      ),
    );
  }
}
