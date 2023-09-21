import 'package:flutter/material.dart';

/// Navigation rail destination which has icons, label, selectedIcon and padding
/// Navigation rail items will be generate based on the length of the tabs
List<NavigationRailDestination> navigationRailDestination({
  required List navRailTabs,
  required List<Widget> navRailIcons,
  required List<Widget> navRailLabels,
  EdgeInsetsGeometry? padding,
  List<Widget>? selectedIcon,
}) {
  final List<NavigationRailDestination> destinations = [];
  for (int i = 0; i < navRailTabs.length; i++) {
    destinations.add(
      NavigationRailDestination(
        icon: navRailIcons[i],
        label: navRailLabels[i],
        selectedIcon: selectedIcon?[i],
        padding: padding,
      ),
    );
  }
  return destinations;
}

/// Items of the bottom navigation bar, such as icon, label, backgroundColor etc.
/// Bottom navigation bar items will be generate based on the length of the tabs
List<NavigationDestination> bottomNavigationBarItem({
  required List tabsBottomNavBar,
  required List<Widget> iconsBottomNavBar,
  List<String>? labelsBottomNavBar,
  List<String>? tooltipItemBottomNavBar,
  List<Widget>? selectedIconBottomNavBar,
}) {
  final List<NavigationDestination> bottomNavBarItem = [];
  for (int i = 0; i < tabsBottomNavBar.length; i++) {
    bottomNavBarItem.add(
      NavigationDestination(
        icon: iconsBottomNavBar[i],
        label: labelsBottomNavBar?[i] ?? '',
        selectedIcon: selectedIconBottomNavBar?[i],
        tooltip: tooltipItemBottomNavBar?[i] ?? '',
      ),
    );
  }
  return bottomNavBarItem;
}
