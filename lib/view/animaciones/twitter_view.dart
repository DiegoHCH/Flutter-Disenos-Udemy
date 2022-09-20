import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TwitterView extends StatefulWidget {
  const TwitterView({Key? key}) : super(key: key);

  @override
  State<TwitterView> createState() => _TwitterViewState();
}

class _TwitterViewState extends State<TwitterView> {
  bool activeAnimation = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1DA1F2),
      body: Center(
        child: ZoomOut(
            animate: activeAnimation,
            from: 30,
            duration: const Duration(seconds: 1),
            child: const FaIcon(
              FontAwesomeIcons.twitter,
              color: Colors.white,
              size: 50,
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            activeAnimation = true;
          });
        },
        backgroundColor: Colors.pink,
        child: const FaIcon(FontAwesomeIcons.play),
      ),
    );
  }
}