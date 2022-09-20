import 'package:design_flutter_course/view/animaciones/home_view.dart';
import 'package:design_flutter_course/view/customanimations/animations_view.dart';
import 'package:design_flutter_course/view/custompainter/header_view.dart';
import 'package:design_flutter_course/view/emergency/emergency_view.dart';
import 'package:design_flutter_course/view/pinterest/pinterest_view.dart';
import 'package:design_flutter_course/view/radialprogress/radialprogress_view.dart';
import 'package:design_flutter_course/view/slideshow/slideshow_view.dart';
import 'package:design_flutter_course/view/slivers/slivers_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final pageRoutes = <_Route>[
  _Route(FontAwesomeIcons.bandage, 'Animate Do', const HomeView()),
  _Route(FontAwesomeIcons.square, 'Custom Animations', const AnimacionesView()),
  _Route(FontAwesomeIcons.paintbrush, 'Custom Painter', const HeadersView()),
  _Route(FontAwesomeIcons.truckMedical, 'Emergency', const EmergencyView()),
  _Route(FontAwesomeIcons.pinterest, 'Pinterest', const PinterestView()),
  _Route(FontAwesomeIcons.barsProgress, 'Circular Progress', const GraficasCircularesView()),
  _Route(FontAwesomeIcons.slideshare, 'SlideShow', const SlideshowView()),
  _Route(FontAwesomeIcons.mobile, 'Slivers', const SliverListView())
];

class _Route {
  final IconData icon;
  final String title;
  final Widget page;

  _Route(this.icon, this.title, this.page);
}
