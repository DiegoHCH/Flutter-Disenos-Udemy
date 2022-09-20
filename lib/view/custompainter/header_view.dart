
import 'package:design_flutter_course/viewmodel/theme/theme_viewmodel.dart';
import 'package:flutter/material.dart';

import 'package:design_flutter_course/view/widget/headers.dart';
import 'package:provider/provider.dart';


class HeadersView extends StatelessWidget {
  const HeadersView({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return Scaffold(
      body: HeaderWave(
        color: appTheme.colorScheme.secondary,
      )
    );
  }
}