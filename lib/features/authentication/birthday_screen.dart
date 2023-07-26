import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tik_tok/constants/gaps.dart';
import 'package:tik_tok/constants/sizes.dart';
import 'package:tik_tok/features/authentication/email_screen.dart';
import 'package:tik_tok/widgets/form_button.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({Key? key}) : super(key: key);

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  final TextEditingController _birthdayController = TextEditingController();
  final String _birthday = "";
  DateTime date = DateTime.now();

  late DateTime twdate;

  @override
  void initState() {
    super.initState();
    twdate = DateTime(date.year - 12, date.month, date.day);
    _changeDate(date);
  }

  void _changeDate(DateTime receiveDate) {
    final textDate = receiveDate.toString().split(" ").first;
    _birthdayController.value = TextEditingValue(text: textDate);
  }

  @override
  void dispose() {
    _birthdayController.dispose();
    super.dispose();
  }

  _onNextTap() {
    if (_birthday.isNotEmpty) {
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
            "When's your birthday?",
            style: TextStyle(
              fontSize: Sizes.size20,
              fontWeight: FontWeight.w700,
            ),
          ),
          Gaps.v8,
          const Text("Your birthday won't be shown publicly.",
              style: TextStyle(fontSize: Sizes.size16, color: Colors.black54)),
          Gaps.v16,
          TextField(
            enabled: false,
            controller: _birthdayController,
            cursorColor: Theme.of(context).primaryColor,
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400))),
          ),
          Gaps.v16,
          GestureDetector(
            onTap: _onNextTap,
            child: Button_A(
              disabled: _birthday.isEmpty,
            ),
          )
        ]),
      ),
      bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: SizedBox(
              height: Sizes.size96 * 3,
              child: CupertinoDatePicker(
                  maximumDate: twdate,
                  initialDateTime: twdate,
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: _changeDate))),
    );
  }
}
