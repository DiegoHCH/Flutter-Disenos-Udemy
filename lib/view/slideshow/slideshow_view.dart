import 'package:design_flutter_course/view/widget/slideshow.dart';
import 'package:design_flutter_course/viewmodel/theme/theme_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SlideshowView extends StatelessWidget {
  const SlideshowView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Scaffold(
      body: Slideshow(
      bulletPrimario: 15,
      bulletSecundario: 12,
      colorPrimario: (appTheme.darkTheme) ? appTheme.currentTheme.colorScheme.secondary : const Color(0xFFFF5A7E),
      slides: [
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-2.svg'),
        SvgPicture.asset('assets/svgs/slide-3.svg'),
        SvgPicture.asset('assets/svgs/slide-4.svg'),
        SvgPicture.asset('assets/svgs/slide-5.svg'),
      ],
    ));
  }
}
