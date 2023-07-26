import 'package:flutter/material.dart';
import 'package:tik_tok/constants/gaps.dart';
import 'package:tik_tok/constants/sizes.dart';
import 'package:tik_tok/features/authentication/email_screen.dart';
import 'package:tik_tok/widgets/form_button.dart';

class UsernameScreen extends StatefulWidget {
  const UsernameScreen({Key? key}) : super(key: key);

  @override
  State<UsernameScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {
  final TextEditingController _usernameController = TextEditingController();
  String _username = "";

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(() {
      setState(() {
        _username = _usernameController.text;
      });
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  _onNextTap() {
    if (_username.isNotEmpty) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const EmailScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "sign up",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Gaps.v40,
          const Text(
            "Create username",
            style: TextStyle(
              fontSize: Sizes.size20,
              fontWeight: FontWeight.w700,
            ),
          ),
          Gaps.v8,
          const Text("You can aalways chenge this later",
              style: TextStyle(fontSize: Sizes.size16, color: Colors.black54)),
          Gaps.v16,
          TextField(
            controller: _usernameController,
            cursorColor: Theme.of(context).primaryColor,
            decoration: InputDecoration(
                hintText: "Username",
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400))),
          ),
          Gaps.v16,
          GestureDetector(
            onTap: _onNextTap,
            child: Button_A(
              disabled: _username.isEmpty,
            ),
          )
        ]),
      ),
    );
  }
}
