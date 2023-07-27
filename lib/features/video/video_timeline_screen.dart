import 'package:flutter/material.dart';

class VideoTimaline extends StatefulWidget {
  const VideoTimaline({Key? key}) : super(key: key);

  @override
  State<VideoTimaline> createState() => _VideoTimalineState();
}

class _VideoTimalineState extends State<VideoTimaline> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        Container(color: Colors.blue),
        Container(color: Colors.teal),
        Container(color: Colors.yellow),
        Container(color: Colors.green),
        Container(color: Colors.red),
      ],
    );
  }
}
