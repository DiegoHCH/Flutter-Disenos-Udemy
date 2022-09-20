import 'package:animate_do/animate_do.dart';
import 'package:design_flutter_course/view/widget/buttonfat.dart';
import 'package:design_flutter_course/view/widget/headers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton(this.icon, this.texto, this.color1, this.color2);
}

class EmergencyView extends StatelessWidget {
  const EmergencyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = <ItemBoton>[
      ItemBoton(FontAwesomeIcons.carBurst, 'Motor Accident',const Color(0xff6989F5), const Color(0xff906EF5)),
      ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',const Color(0xff66A9F2), const Color(0xff536CF6)),
      ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement',const Color(0xffF2D572), const Color(0xffE06AA3)),
      ItemBoton(FontAwesomeIcons.personBiking, 'Awards',const Color(0xff317183), const Color(0xff46997D)),
      ItemBoton(FontAwesomeIcons.carBurst, 'Motor Accident',const Color(0xff6989F5), const Color(0xff906EF5)),
      ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', const Color(0xff66A9F2), const Color(0xff536CF6)),
      ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement', const Color(0xffF2D572), const Color(0xffE06AA3)),
      ItemBoton(FontAwesomeIcons.personBiking, 'Awards', const Color(0xff317183), const Color(0xff46997D)),
      ItemBoton(FontAwesomeIcons.carBurst, 'Motor Accident',const Color(0xff6989F5), const Color(0xff906EF5)),
      ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',const Color(0xff66A9F2), const Color(0xff536CF6)),
      ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement', const Color(0xffF2D572), const Color(0xffE06AA3)),
      ItemBoton(FontAwesomeIcons.personBiking, 'Awards',const Color(0xff317183), const Color(0xff46997D)),
    ];

    List<Widget> itemMap = items
        .map((item) => FadeInLeft(
          duration: const Duration(milliseconds: 1000),
          child: ButtonFat(
                icon: item.icon,
                text: item.texto,
                colorOne: item.color1,
                colorTwo: item.color2,
                onPress: () {},
              ),
        )
    ).toList();

    return Scaffold(
        body: Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 200),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(height: 80,),
              ...itemMap
            ],
          ),
        ),
        const Header(),
      ],
    ));
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
          const IconHeader(
            icon: FontAwesomeIcons.plus,
            title: 'Haz Solicitado',
            subtitle: 'Asistencia Médica'),
          Positioned(
            right: 0,
            top: 45,
            child: RawMaterialButton(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(15),
              onPressed: () {  },
              child: const FaIcon(FontAwesomeIcons.ellipsisVertical, color: Colors.white,)
            )
          )
      ],
    );
  }
}

class ButtonFatTemp extends StatelessWidget {
  const ButtonFatTemp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonFat(
      icon: FontAwesomeIcons.carBurst,
      text: 'Motor Accident',
      colorOne: const Color(0xff6989F5),
      colorTwo: const Color(0xff906EF5),
      onPress: () {
      },
    );
  }
}