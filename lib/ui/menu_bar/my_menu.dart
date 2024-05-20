// import 'package:flutter/material.dart';
// import 'package:vietjet_tool/ui/home/my_home.dart';
// import 'package:vietjet_tool/ui/setting/setting_screen.dart';
//
// import '../../widgets/tabs/my_tabBar.dart';
//
// class MyMenu extends StatefulWidget {
//   const MyMenu({super.key});
//
//   @override
//   State<MyMenu> createState() => _MyMenuState();
// }
//
// class _MyMenuState extends State<MyMenu> with SingleTickerProviderStateMixin {
//
//
//   late TabController _tabController;
//   late List<TabItem> _tabItems;
//   late List<Widget> _tabWidget;
//
//   @override
//   void initState() {
//
//     _initTabs();
//     super.initState();
//
//   }
//
//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }
//
//   void _initTabs() {
//     _tabItems = const [
//       TabItem(id: 1, title: "Home", icon: Icons.home),
//       TabItem(
//           id: 2,
//           title: "Networks",
//           icon: Icons.settings_input_antenna),
//       TabItem(id: 3, title: "Settings", icon: Icons.settings),
//     ];
//
//     _tabWidget = [
//       MyHome(),
//       SettingScreen(),
//       SettingScreen(),
//
//     ];
//
//     _tabController = TabController(
//       vsync: this,
//       length: _tabItems.length,
//       animationDuration: Duration.zero,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: TabBarView(
//         physics: const NeverScrollableScrollPhysics(),
//         controller: _tabController,
//         children: _tabWidget,
//       ),
//       bottomNavigationBar:
//       MyTabBar(tabController: _tabController, items: _tabItems),
//     );
//   }
// }
