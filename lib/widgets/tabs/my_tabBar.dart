import 'package:flutter/material.dart';

import '../../common/color/colors.dart';

class MyTabBar extends StatefulWidget {
  const MyTabBar({super.key, required this.tabController, required this.items});
  final TabController tabController;
  final List<TabItem> items;

  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //mItems = widget.items;
    widget.tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300]!,
            blurRadius: 1,
          )
        ],
      ),
      child: SafeArea(
        child: TabBar(
          controller: widget.tabController,
          indicator: const BoxDecoration(),
          labelColor: Theme.of(context).colorScheme.primary,
          labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
          unselectedLabelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.normal),
          indicatorColor: Colors.transparent,
          labelPadding: const EdgeInsets.only(top: 4),
          tabs: widget.items.map(_tabItem).toList(),
        ),
      ),
    );
  }

  Widget _tabItem(TabItem item) {
    final index = widget.items.indexOf(item);
    final color = index == widget.tabController.index
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).disabledColor;
    return Container(
      height: 56,
      child: Tab(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              item.icon,
              size: 32,
              color: color,
            ),
            const SizedBox(height: 2),
            Text(
              item.title,
              // style: Theme.of(context)..bodySmall?.copyWith(
              //   color: color,
              //   fontWeight: index == widget.tabController.index
              //       ? FontWeight.bold
              //       : FontWeight.normal,
              // ),
            ),
          ],
        ),
      ),
    );
  }
}

class TabItem {
  const TabItem({
    required this.id,
    required this.title,
    required this.icon,
    this.isEnable = true,
  });

  final int id;
  final String title;
  final IconData icon;
  final bool isEnable;

  TabItem copyWith({int? id, String? title, IconData? icon, bool? isEnable}) {
    return TabItem(
      id: id ?? this.id,
      title: title ?? this.title,
      icon: icon ?? this.icon,
      isEnable: isEnable ?? this.isEnable,
    );
  }
}