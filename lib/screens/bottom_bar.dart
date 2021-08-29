import 'package:flutter/material.dart';
import 'package:ship_qarte/components/colors.dart';
import 'package:ship_qarte/components/size_config.dart';

import 'cart.dart';
import 'feeds.dart';
import 'home.dart';
import 'search.dart';
import 'user_info.dart';

class BottomBarScreen extends StatefulWidget {
  static const routeName = '/BottomBarScreen';
  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  // List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;
  List<Widget?>? pages;
  @override
  void initState() {
    pages = [
      Home(),
      Feeds(),
      Search(),
      CartScreen(),
      UserInfo(),
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: pages![_selectedPageIndex], //_pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomAppBar(
        // color: Colors.white,
        shape: CircularNotchedRectangle(),
        notchMargin: 0.01,
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: SizeConfig.blockHeight * 9,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 0.2,
                ),
              ),
            ),
            child: BottomNavigationBar(
              onTap: _selectPage,
              backgroundColor: Theme.of(context).primaryColor,
              unselectedItemColor: Theme.of(context).textSelectionColor,
              selectedItemColor: COLORS.blueMedium,
              currentIndex: _selectedPageIndex,
              // ignore: prefer_const_literals_to_create_immutables
              items: [
                const BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.rss_feed_outlined), label: 'Feeds'),
                const BottomNavigationBarItem(
                    activeIcon: null, icon: Icon(null), label: 'Search'),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_bag_outlined), label: 'Cart'),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline_outlined), label: 'User'),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          backgroundColor: COLORS.blueDark,
          hoverElevation: 10,
          splashColor: Colors.grey,
          tooltip: 'Search',
          elevation: 5,
          // ignore: prefer_const_constructors
          child: Icon(Icons.search),
          onPressed: () => setState(() {
            _selectedPageIndex = 2;
          }),
        ),
      ),
    );
  }
}
