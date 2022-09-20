import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonFat extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color colorOne;
  final Color colorTwo;
  final void Function() onPress;

  const ButtonFat(
      {super.key,
      required this.icon,
      required this.text,
      this.colorOne = const Color(0xff6989F5),
      this.colorTwo = const Color(0xff906EF5), required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Stack(
        children: [
          _ButtonFatBackground(
            icon: icon,
            colorOne: colorOne,
            colorTwo: colorTwo,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 140, width: 40),
              FaIcon(icon, size: 40, color: Colors.white),
              const SizedBox(width: 20),
              Expanded(
                  child: Text(text,
                      style: const TextStyle(color: Colors.white, fontSize: 18))),
              const FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white),
              const SizedBox(width: 40),
            ],
          )
        ],
      ),
    );
  }
}

class _ButtonFatBackground extends StatelessWidget {
  final IconData icon;
  final Color colorOne;
  final Color colorTwo;
  const _ButtonFatBackground({
    Key? key,
    required this.icon,
    required this.colorOne,
    required this.colorTwo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(4, 6),
                blurRadius: 10)
          ],
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(colors: [colorOne, colorTwo])),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
                right: -20,
                top: -20,
                child: FaIcon(
                  icon,
                  size: 150,
                  color: Colors.white.withOpacity(0.2),
                ))
          ],
        ),
      ),
    );
  }
}
