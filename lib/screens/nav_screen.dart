import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/screens/screens.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavScreen extends StatefulWidget {
  NavScreen({Key key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    MyHomePage(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final List<IconData> _icons = [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu,
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _screens.length,
      child: Scaffold(
        /// 比直接_screens[_selectedIndex]会有浅入浅出的效果
        // body: TabBarView(
        //   /// 控制tabbar滑动的动作 NeverScrollableScrollPhysics不能滑动只能点击
        //   physics: NeverScrollableScrollPhysics(),
        //   children: _screens,
        // ),
        // body: _screens[_selectedIndex],
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: CustomTabBar(
            icons: _icons,
            selectedIndex: _selectedIndex,
            ontab: (index) => setState(() => _selectedIndex = index),
          ),
        ),
      ),
    );
  }
}
