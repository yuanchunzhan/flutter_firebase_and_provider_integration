import 'package:flutter/material.dart';
import 'package:flutter_firebase_and_provider_integration/provider/AuthModel.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(child: getSideMenuList(context));
  }

  ListView getSideMenuList(BuildContext context) {
    final ScrollController _sideController = ScrollController();
    List<Widget> drawerList = [
      DrawerHeader(
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/');
          },
          child: Center(
            child: Consumer<AuthModel>(builder: (context, auth, child) {
              return !auth.isSignIn
                  ? const Text('Please Sign In', style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),)
                  : const Text('Welcome', style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic));
            }),
          ),
        ),
      ),
      ListTile(
        title: const Text("Home Page"),
        leading: const Icon(
          Icons.dashboard,
          color: Colors.white70,
        ),
        onTap: () {
          Navigator.pushNamed(context, '/');
        },
      ),
      ListTile(
        title: const Text("ListViews"),
        leading: const Icon(
          Icons.article_outlined,
          color: Colors.white70,
        ),
        onTap: () {
          Navigator.pushNamed(context, '/listview');
        },
      ),
      ListTile(
        title: const Text("Paginated DataTable"),
        leading: const Icon(
          Icons.document_scanner,
          color: Colors.white70,
        ),
        onTap: () {Navigator.pushNamed(context, '/datatable'); },
      ),
      Consumer<AuthModel>(builder: (context, auth, child) {
        return !auth.isSignIn
            ? ListTile(
                title: const Text("Log in/Sign up"),
                leading: const Icon(
                  Icons.login,
                  color: Colors.white70,
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/login');
                })
            : ListTile(
                title: const Text("Log Out"),
                leading: const Icon(
                  Icons.logout,
                  color: Colors.white70,
                ),
                onTap: () {
                  auth.signOut();
                });
      })
    ];

    return ListView(
      controller: _sideController,
      children: drawerList,
    );
  }
}
