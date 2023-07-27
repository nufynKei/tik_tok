import 'package:flutter/material.dart';
import 'package:tik_tok/constants/gaps.dart';
import 'package:tik_tok/constants/sizes.dart';

class StfScreen extends StatefulWidget {
  const StfScreen({Key? key}) : super(key: key);

  @override
  State<StfScreen> createState() => _StfScreenState();
}

class _StfScreenState extends State<StfScreen> {
  int _click = 0;

  void _increase() {
    setState(() {
      _click++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              _click.toString(),
              style: const TextStyle(fontSize: Sizes.size24),
            ),
            Gaps.v12,
            TextButton(
                onPressed: _increase,
                child:
                    const Text("+", style: TextStyle(fontSize: Sizes.size12)))
          ],
        ),
      ),
    );
  }
}
