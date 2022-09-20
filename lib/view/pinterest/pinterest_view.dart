import 'package:design_flutter_course/view/widget/pinterest_menu.dart';
import 'package:design_flutter_course/viewmodel/theme/theme_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestView extends StatelessWidget {
  const PinterestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuShow(),
      child: Scaffold(
        body: Stack(
          children: const [PinterestGrid(), _PinterestMenuPositioned()],
        ),
      ),
    );
  }
}

class _PinterestMenuPositioned extends StatelessWidget {
  const _PinterestMenuPositioned({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final toShow = Provider.of<_MenuShow>(context).toShow;
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return Positioned(
        bottom: 30,
        child: SizedBox(
          width: size.width,
          child: Align(
            child: PinterestMenu(
              backgroundColor: currentTheme.scaffoldBackgroundColor,
              activeColor: currentTheme.colorScheme.secondary,
              toShow: toShow,
            ),
          ),
        ));
  }
}

class PinterestGrid extends StatefulWidget {
  const PinterestGrid({Key? key}) : super(key: key);

  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(200, (index) => index);
  ScrollController controller = ScrollController();
  double afterScroll = 0;

  @override
  void initState() {
    controller.addListener(() {
      if (controller.offset > afterScroll && controller.offset > 150) {
        Provider.of<_MenuShow>(context, listen: false).toShow = false;
      } else {
        Provider.of<_MenuShow>(context, listen: false).toShow = true;
      }
      afterScroll = controller.offset;
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.custom(
      controller: controller,
      padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
      gridDelegate: SliverWovenGridDelegate.count(
        crossAxisCount: 2,
        pattern: const [
          WovenGridTile(1),
          WovenGridTile(5 / 7,
              crossAxisRatio: 0.9, alignment: AlignmentDirectional.centerEnd)
        ],
      ),
      childrenDelegate: SliverChildBuilderDelegate(
          (
            context,
            index,
          ) =>
              ItemGrid(index: index),
          childCount: items.length),
    );
  }
}

class ItemGrid extends StatelessWidget {
  final int index;
  const ItemGrid({Key? key, required this.index}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Container(
        decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Center(
          child: CircleAvatar(
            backgroundColor: (appTheme.darkTheme) ? appTheme.currentTheme.colorScheme.secondary : Colors.white,
            child: Text('$index', style: const TextStyle(color: Colors.black)),
          ),
        ));
  }
}

class _MenuShow with ChangeNotifier {
  bool _toShow = true;

  bool get toShow => _toShow;

  set toShow(bool value) {
    _toShow = value;
    notifyListeners();
  }
}
