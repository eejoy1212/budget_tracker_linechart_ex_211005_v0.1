import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:budget_tracker_linechart_ex_211005/pages/budget_page.dart';
import 'package:budget_tracker_linechart_ex_211005/pages/create_budget_page.dart';
import 'package:budget_tracker_linechart_ex_211005/pages/daily_page.dart';
import 'package:budget_tracker_linechart_ex_211005/pages/profile_page.dart';
import 'package:budget_tracker_linechart_ex_211005/pages/stats_page.dart';
import 'package:budget_tracker_linechart_ex_211005/theme/colors.dart';
import 'package:flutter/material.dart';
import 'dart:core';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          selectedTab(4);
        },
        child: const Icon(Icons.add, size: 25),
        backgroundColor: primary,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: const [
        DailyPage(),
        StatsPage(),
        BudgetPage(),
        ProfilePage(),
        CreateBudgetPage(),
      ],
    );
  }

  Widget? getFooter() {
    List<IconData> iconItems = [
      Icons.calendar_today,
      Icons.auto_graph,
      Icons.money,
      Icons.person,
    ];
    return AnimatedBottomNavigationBar(
        icons: iconItems,
        activeColor: primary,
        splashColor: secondary,
        inactiveColor: black.withOpacity(0.5),
        activeIndex: pageIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 10,
        rightCornerRadius: 10,
        iconSize: 25,
        onTap: (index) {
          selectedTab(index);
        });
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
