import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_project/screens/upload_screen.dart';
import 'package:test_project/screens/view_screen.dart';
import 'package:test_project/screens/vizitka_screen.dart';

import 'ping_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;
  List<_DrawerItem> get items => [
        _DrawerItem(
          action: () => _drawerNavigate(0),
          text: 'Ping',
          icon: Icons.http,
          screen: const PingScreen(key: PageStorageKey('Ping')),
        ),
        _DrawerItem(
          action: () => _drawerNavigate(1),
          text: 'Upload',
          icon: Icons.upload_file,
          screen: const UploadScreen(key: PageStorageKey('Upload')),
        ),
        _DrawerItem(
          action: () => _drawerNavigate(2),
          text: 'View',
          icon: Icons.web,
          screen: const ViewScreen(key: PageStorageKey('View')),
        ),
        _DrawerItem(
          action: () => _drawerNavigate(3),
          text: 'Vizitka',
          icon: Icons.account_box,
          screen: const VizitkaScreen(key: PageStorageKey('Vizitka')),
        ),
      ];

  void _drawerNavigate(int index) {
    setState(() {
      pageIndex = index;
    });

    FocusManager.instance.primaryFocus?.unfocus();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Test project'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: IndexedStack(
          index: pageIndex,
          children: [
            for (var item in items) item.screen,
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 16, left: 16),
              child: Text(
                'Drawer',
                style: textTheme.headline6,
              ),
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            for (var item in items)
              ListTile(
                leading: Icon(item.icon),
                title: Text(item.text),
                onTap: item.action,
              ),
          ],
        ),
      ),
    );
  }
}

class _DrawerItem {
  void Function() action;
  String text;
  IconData icon;
  Widget screen;

  _DrawerItem({
    required this.action,
    required this.text,
    required this.icon,
    required this.screen,
  });
}
