import 'package:agro_hack23/common/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({Key? key, required this.navigationShell})
      : super(key: key);

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: CustNavBar(
        index: navigationShell.currentIndex,
        onClick: (index) => _setActiveIndex(index),
        // indexfirst:  widget.firstrun,
      ),
    );
  }

  void _setActiveIndex(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}

// ignore: must_be_immutable
class CustNavBar extends StatelessWidget {
  CustNavBar({Key? key, required this.index, required this.onClick})
      : super(key: key);

  final int index;
  final Function(int) onClick;

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            currentIndex: index,
            onTap: onClick,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            unselectedFontSize: 11,
            selectedFontSize: 11,
            selectedLabelStyle: CustomTextTheme.caption1NS,
            unselectedLabelStyle: CustomTextTheme.caption1NS,
            selectedItemColor: Theme.of(context).primaryColor,
            iconSize: 24,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.archivebox_fill,
                ),
                label: 'Заказы',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.person_solid,
                ),
                label: 'Профиль',
              ),
            ]));
  }
}
