import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavigationView extends StatelessWidget {
  const NavigationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: const Text('Navigation Screen'),
        ),
        floatingActionButton: const FloatingButton(),
        bottomNavigationBar: const BottomNavigation(),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    int notificationNumber =
        Provider.of<_NotificationModel>(context).numberNotification;

    return BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.pink,
        items: [
          const BottomNavigationBarItem(
              label: 'Bones', 
              icon: FaIcon(FontAwesomeIcons.bone)),
          BottomNavigationBarItem(
              label: 'Notifications',
              icon: Stack(
                children: [
                  const FaIcon(FontAwesomeIcons.bell),
                  Positioned(
                    top: 0,
                    right: 0,
                    //child: Icon(Icons.brightness_1, size: 8, color: Colors.pink,))
                    child: BounceInDown(
                      from: 15,
                      animate: (notificationNumber > 0) ? true : false,
                      child: Bounce(
                        from: 10,
                        controller: (controller) =>
                            Provider.of<_NotificationModel>(context)
                                .bounceController = controller,
                        child: Container(
                          alignment: Alignment.center,
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(
                              color: Colors.pink, shape: BoxShape.circle),
                          child: Text(
                            '$notificationNumber',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 7),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )),
          const BottomNavigationBarItem(
              label: 'My Cat', icon: FaIcon(FontAwesomeIcons.cat)),
        ]);
  }
}

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        final notificationsModel = Provider.of<_NotificationModel>(context, listen: false);
        int numberNotifications = notificationsModel.numberNotification;
        numberNotifications++;
        notificationsModel.numberNotification = numberNotifications;
        if (numberNotifications >= 2) {
          final controller = notificationsModel.bounceController;
          controller.forward(from: 0);
        }
      },
      backgroundColor: Colors.pink,
      child: const FaIcon(FontAwesomeIcons.play),
    );
  }
}

class _NotificationModel extends ChangeNotifier {
  int _numberNotification = 0;
  late AnimationController bounceController;

  int get numberNotification => _numberNotification;

  set numberNotification(int value) {
    _numberNotification = value;
    notifyListeners();
  }
}
