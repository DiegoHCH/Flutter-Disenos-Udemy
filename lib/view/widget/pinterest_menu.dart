import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final VoidCallback onPressed;
  final IconData icon;

  PinterestButton({
    required this.onPressed,
    required this.icon,
  });
}

class PinterestMenu extends StatelessWidget {
  final bool toShow;
  final Color? backgroundColor;
  final Color? activeColor;

  PinterestMenu(
      {Key? key, this.toShow = true, this.backgroundColor, this.activeColor})
      : super(key: key);

  final List<PinterestButton> items = [
    PinterestButton(onPressed: () {}, icon: Icons.pie_chart),
    PinterestButton(onPressed: () {}, icon: Icons.search),
    PinterestButton(onPressed: () {}, icon: Icons.notifications),
    PinterestButton(onPressed: () {}, icon: Icons.supervised_user_circle),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: AnimatedOpacity(
        opacity: toShow ? 1 : 0,
        duration: const Duration(milliseconds: 250),
        child: Container(
            width: 250,
            height: 60,
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black38, blurRadius: 10, spreadRadius: -5)
                ]),
            child: _MenuItems(items, activeColor)),
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;
  final Color? activeColor;

  const _MenuItems(this.menuItems, this.activeColor);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(menuItems.length,
            (index) => _PinterestMenuButton(index, menuItems[index], activeColor)));
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;
  final Color? activeColor;

  const _PinterestMenuButton(this.index, this.item, this.activeColor);

  @override
  Widget build(BuildContext context) {
    final itemSeleccionado = Provider.of<_MenuModel>(context).itemSeleccionado;
    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado =
            index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Icon(
        item.icon,
        size: (itemSeleccionado == index) ? 35 : 25,
        color: (itemSeleccionado == index) ? activeColor : Colors.blueGrey,
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSeleccionado = 0;

  int get itemSeleccionado => _itemSeleccionado;

  set itemSeleccionado(int index) {
    _itemSeleccionado = index;
    notifyListeners();
  }
}
