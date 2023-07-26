import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tik_tok/constants/gaps.dart';
import 'package:tik_tok/constants/sizes.dart';
import 'package:tik_tok/features/authentication/birthday_screen.dart';
import 'package:tik_tok/widgets/form_button.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({Key? key}) : super(key: key);

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  String _password = "";
  bool _isObscure = true;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  bool _isPasswordValid() {
    return _password.isNotEmpty && _password.length > 8;
  }

  void _onSubmit() {
    if (!_isPasswordValid()) return;
    Navigator.push(context,
        MaterialPageRoute(builder: ((context) => const BirthdayScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "sign up",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Gaps.v40,
            const Text(
              "password",
              style: TextStyle(
                fontSize: Sizes.size20,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v16,
            TextField(
              controller: _passwordController,
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
              obscureText: _isObscure,
              onEditingComplete: _onSubmit,
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                  suffix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: _onClearTap,
                        child: FaIcon(
                          FontAwesomeIcons.solidCircleXmark,
                          color: Colors.grey.shade400,
                          size: Sizes.size20,
                        ),
                      ),
                      Gaps.h14,
                      GestureDetector(
                        onTap: _toggleObscure,
                        child: FaIcon(
                          _isObscure
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash,
                          color: Colors.grey.shade400,
                          size: Sizes.size20,
                        ),
                      )
                    ],
                  ),
                  hintText: "make it Strong",
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400))),
            ),
            Gaps.v10,
            const Text("Your password mush have",
                style: TextStyle(fontWeight: FontWeight.bold)),
            Gaps.v10,
            Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.circleCheck,
                  size: Sizes.size16,
                  color:
                      _isPasswordValid() ? Colors.green : Colors.grey.shade400,
                ),
                Gaps.h6,
                Text(
                  "8 to 10 characters",
                  style: TextStyle(
                      color: _isPasswordValid()
                          ? Colors.black
                          : Colors.grey.shade400),
                )
              ],
            ),
            Gaps.v10,
            Row(
              children: const [
                FaIcon(
                  FontAwesomeIcons.circleCheck,
                  size: Sizes.size16,
                ),
                Gaps.h6,
                Text("Letters, numbers, and special characters")
              ],
            ),
            Gaps.v16,
            Button_A(
              tap: _onSubmit,
              disabled: !_isPasswordValid(),
            )
          ]),
        ),
      ),
    );
  }

  void _onClearTap() {
    _passwordController.clear();
  }

  void _toggleObscure() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }
}
