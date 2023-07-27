import 'package:flutter/material.dart';
import 'package:tik_tok/features/onboarding/interest_screen.dart';
import 'package:tik_tok/widgets/form_button.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({Key? key}) : super(key: key);

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, String> formData = {};

  void _onSumitTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const InterestScreen()),
          (route) => false,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log in"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
        child: Form(
            key: _formKey,
            /**
           * Form의 Global Key
           * 고유 식별자 역할,
           * 폼의 state에도 접근 가능,
           * 폼의 메서드도 사용 가능
           */
            child: Column(
              children: [
                Gaps.v28,
                TextFormField(
                  decoration: const InputDecoration(hintText: "Email"),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Plase write your email";
                    }
                    return null;
                  },
                  onSaved: (newValue) =>
                      {if (newValue != null) formData['email'] = newValue},
                ),
                Gaps.v16,
                TextFormField(
                  decoration: const InputDecoration(hintText: "Password"),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Plase write your password";
                    }
                    return null;
                  },
                  onSaved: (newValue) =>
                      {if (newValue != null) formData['password'] = newValue},
                ),
                Gaps.v28,
                Button_A(
                  tap: _onSumitTap,
                  disabled: false,
                  text: "Log in",
                )
              ],
            )),
      ),
    );
  }
}
