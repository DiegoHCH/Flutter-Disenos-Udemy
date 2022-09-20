import 'package:design_flutter_course/routes/routes.dart';
import 'package:design_flutter_course/viewmodel/theme/theme_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LauncherView extends StatelessWidget {
  const LauncherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Diseños en Flutter'),
        ),
        drawer: const _PrincipalMenu(),
        body: const _ListOptions());
  }
}

class _ListOptions extends StatelessWidget {
  const _ListOptions();

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) =>  Divider(
        color: appTheme.primaryColorLight,
      ),
      itemCount: pageRoutes.length,
      itemBuilder: (context, index) => ListTile(
        leading: FaIcon(
          pageRoutes[index].icon,
          color: appTheme.colorScheme.secondary,
        ),
        title: Text(pageRoutes[index].title),
        trailing: Icon(
          Icons.chevron_right,
          color: appTheme.colorScheme.secondary,
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => pageRoutes[index].page));
        },
      ),
    );
  }
}

class _PrincipalMenu extends StatelessWidget {
  const _PrincipalMenu();

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Drawer(
      child: Column(
        children: [
          SafeArea(
            child: SizedBox(
              width: double.infinity,
              height: 150,
              child: CircleAvatar(
                backgroundColor: appTheme.currentTheme.colorScheme.secondary,
                child: const Text(
                  'DH',
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ),
          ),
          const Expanded(child: _ListOptions()),
          ListTile(
              leading: Icon(
                Icons.lightbulb_outline,
                color: appTheme.currentTheme.colorScheme.secondary,
              ),
              title: const Text('Dark Mode'),
              trailing: Switch.adaptive(
                value: appTheme.darkTheme,
                activeColor: appTheme.currentTheme.colorScheme.secondary,
                onChanged: (value) => appTheme.darkTheme = value,
              )),
          SafeArea(
            bottom: true,
            top: false,
            left: false,
            right: false,
            child: ListTile(
              leading: Icon(
                Icons.add_to_home_screen,
                color: appTheme.currentTheme.colorScheme.secondary,
              ),
              title: const Text('Custom Theme'),
              trailing: Switch.adaptive(
                  value: appTheme.customTheme,
                  activeColor: appTheme.currentTheme.colorScheme.secondary,
                  onChanged: (value) => appTheme.customTheme = value),
            ),
          )
        ],
      ),
    );
  }
}
