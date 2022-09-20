import 'package:design_flutter_course/viewmodel/theme/theme_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SliverListView extends StatelessWidget {
  const SliverListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        _MainScroll(),
        const Positioned(bottom: -10, right: 0, child: _ButtonNewList()),
      ],
    ));
  }
}

class _ButtonNewList extends StatelessWidget {
  const _ButtonNewList();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appTheme = Provider.of<ThemeChanger>(context);

    return ButtonTheme(
      minWidth: size.width * 0.9,
      height: 100,
      child: MaterialButton(
        color: (appTheme.darkTheme)
            ? appTheme.currentTheme.colorScheme.secondary
            : const Color(0xffED6762),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(50))),
        onPressed: () {},
        child: Text('CREATE NEW LIST',
            style: TextStyle(
                color: (appTheme.darkTheme)
                    ? appTheme.currentTheme.scaffoldBackgroundColor
                    : Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 3)),
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  final items = [
    const _ListItem(title: 'Orange', color: Color(0xffF08F66)),
    const _ListItem(title: 'Family', color: Color(0xffF2A38A)),
    const _ListItem(title: 'Subscriptions', color: Color(0xffF7CDD5)),
    const _ListItem(title: 'Books', color: Color(0xffFCEBAF)),
    const _ListItem(title: 'Orange', color: Color(0xffF08F66)),
    const _ListItem(title: 'Family', color: Color(0xffF2A38A)),
    const _ListItem(title: 'Subscriptions', color: Color(0xffF7CDD5)),
    const _ListItem(title: 'Books', color: Color(0xffFCEBAF)),
    const _ListItem(title: 'Orange', color: Color(0xffF08F66)),
    const _ListItem(title: 'Family', color: Color(0xffF2A38A)),
    const _ListItem(title: 'Subscriptions', color: Color(0xffF7CDD5)),
    const _ListItem(title: 'Books', color: Color(0xffFCEBAF)),
    const _ListItem(title: 'Orange', color: Color(0xffF08F66)),
    const _ListItem(title: 'Family', color: Color(0xffF2A38A)),
    const _ListItem(title: 'Subscriptions', color: Color(0xffF7CDD5)),
    const _ListItem(title: 'Books', color: Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return CustomScrollView(
      slivers: <Widget>[
        // SliverAppBar(
        //   floating: true,
        //   elevation: 0,
        //   backgroundColor: Colors.red,
        //   title: Text('Hola mundo'),
        // ),
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
              maxHeight: 200,
              minHeight: 170,
              child: Container(
                alignment: Alignment.centerLeft,
                color: appTheme.scaffoldBackgroundColor,
                child: _Title(),
              )),
        ),
        SliverList(
            delegate: SliverChildListDelegate(
                [...items, const SizedBox(height: 100)]))
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverCustomHeaderDelegate(
      {required this.minHeight, required this.maxHeight, required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(_SliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text('New',
              style: TextStyle(
                  color: (appTheme.darkTheme)
                      ? Colors.grey
                      : const Color(0xff532128),
                  fontSize: 50)),
        ),
        Stack(
          children: [
            const SizedBox(width: 100),
            Positioned(
              bottom: 8,
              child: Container(
                width: 130,
                height: 8,
                color: (appTheme.darkTheme)
                    ? Colors.grey
                    : const Color(0xffF7CDD5),
              ),
            ),
            const Text(
              'List',
              style: TextStyle(
                  color: Color(0xffD93A30),
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
          ],
        )
      ],
    );
  }
}

// class _TaskList extends StatelessWidget {
//   final items = [
//     const _ListItem(title: 'Orange', color: Color(0xffF08F66)),
//     const _ListItem(title: 'Family', color: Color(0xffF2A38A)),
//     const _ListItem(title: 'Subscriptions', color: Color(0xffF7CDD5)),
//     const _ListItem(title: 'Books', color: Color(0xffFCEBAF)),
//     const _ListItem(title: 'Orange', color: Color(0xffF08F66)),
//     const _ListItem(title: 'Family', color: Color(0xffF2A38A)),
//     const _ListItem(title: 'Subscriptions', color: Color(0xffF7CDD5)),
//     const _ListItem(title: 'Books', color: Color(0xffFCEBAF)),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemCount: items.length,
//         itemBuilder: (BuildContext context, int index) => items[index]);
//   }
// }

class _ListItem extends StatelessWidget {
  final String title;
  final Color color;

  const _ListItem({
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Container(
      height: 130,
      padding: const EdgeInsets.all(30),
      margin: const EdgeInsets.all(10),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: (appTheme.darkTheme) ? Colors.grey : color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, 
            fontWeight: FontWeight.bold, 
            fontSize: 20),
      ),
    );
  }
}
