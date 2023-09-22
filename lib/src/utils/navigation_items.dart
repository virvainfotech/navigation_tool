import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

/// Navigation rail destination which has icons, label, selectedIcon and padding
/// Navigation rail items will be generate based on the length of the tabs
List<NavigationRailDestination> navigationRailDestination({
  required List navRailTabs,
  required List<Widget> navRailIcons,
  required List<Widget> navRailLabels,
  EdgeInsetsGeometry? padding,
  List<Widget>? selectedIcon,
  bool? navRailExtended,

  // Badge
  List<Widget>? badgeContent,
  List<Color>? badgeColor,
  List<bool>? badgeShow,
}) {
  final List<NavigationRailDestination> destinations = [];
  for (int i = 0; i < navRailTabs.length; i++) {
    Widget? badgeWidget;
    Widget? labelWidget;

    // Show badge on the left side top of the icons
    // If the badgeContent is not null and it's length id greater then the current index then badge related stuff will add to the '[badgeWidget]' and
    // NavigationRail is not extended
    // else just add just icons to the '[badgeWidget]'
    if (badgeContent != null && badgeContent.length > i && navRailExtended == false) {
      // Badge position at top left
      badgeWidget = badges.Badge(
        position: badges.BadgePosition.topEnd(top: -15, end: -15),
        showBadge: badgeShow != null && badgeShow.length > i ? badgeShow[i] : false,
        badgeAnimation: const badges.BadgeAnimation.size(
          appearanceDisappearanceFadeAnimationEnabled: false,
          toAnimate: false,
        ),
        badgeContent: badgeContent[i],
        badgeStyle: badges.BadgeStyle(
          badgeColor: badgeColor != null && badgeColor.length > i ? badgeColor[i] : Colors.red,
        ),
        child: navRailIcons[i],
      );
    } else {
      badgeWidget = navRailIcons[i];
    }

    // Show badge on right side of the labels
    // If the badgeContent is not null and it's length id greater then the current index then badge related stuff will add to the '[badgeWidget]' and
    // NavigationRail is not extended
    // else just add just labels to the '[labelWidget]'
    if (badgeContent != null && badgeContent.length > i && navRailExtended == true) {
      labelWidget = badges.Badge(
        position: badges.BadgePosition.topEnd(top: -12, end: -20),
        showBadge: badgeShow != null && badgeShow.length > i ? badgeShow[i] : false,
        badgeAnimation: const badges.BadgeAnimation.size(
          appearanceDisappearanceFadeAnimationEnabled: false,
          toAnimate: false,
        ),
        badgeContent: badgeContent[i],
        badgeStyle: badges.BadgeStyle(
          badgeColor: badgeColor != null && badgeColor.length > i ? badgeColor[i] : Colors.red,
        ),
        child: navRailLabels[i],
      );
    } else {
      labelWidget = navRailLabels[i];
    }

    destinations.add(
      NavigationRailDestination(
        icon: badgeWidget,
        label: labelWidget,
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

  // Badge
  List<Widget>? badgeContent,
  List<Color>? badgeColor,
  List<bool>? badgeShow,
}) {
  final List<NavigationDestination> bottomNavBarItem = [];

  for (int i = 0; i < tabsBottomNavBar.length; i++) {
    Widget? badgeWidget;

    // If the badgeContent is not null and it's length id greater then the current index then badge related stuff will add to the '[badgeWidget]'
    // else just add just icons to the '[badgeWidget]'
    if (badgeContent != null && badgeContent.length > i) {
      // Badge position at top left
      badgeWidget = badges.Badge(
        position: badges.BadgePosition.topEnd(top: -15, end: -15),
        showBadge: badgeShow != null && badgeShow.length > i ? badgeShow[i] : false,
        badgeAnimation: const badges.BadgeAnimation.size(
          appearanceDisappearanceFadeAnimationEnabled: false,
          toAnimate: false,
        ),
        badgeContent: badgeContent[i],
        badgeStyle: badges.BadgeStyle(
          badgeColor: badgeColor != null && badgeColor.length > i ? badgeColor[i] : Colors.red,
        ),
        child: iconsBottomNavBar[i],
      );
    } else {
      badgeWidget = iconsBottomNavBar[i];
    }

    // Add related navigation items to the 'bottomNavBarItem'
    bottomNavBarItem.add(
      NavigationDestination(
        icon: badgeWidget,
        label: labelsBottomNavBar != null && labelsBottomNavBar.length > i ? labelsBottomNavBar[i] : '',
        selectedIcon: selectedIconBottomNavBar != null && selectedIconBottomNavBar.length > i ? selectedIconBottomNavBar[i] : null,
        tooltip: tooltipItemBottomNavBar != null && tooltipItemBottomNavBar.length > i ? tooltipItemBottomNavBar[i] : '',
      ),
    );
  }

  /*for (int i = 0; i < tabsBottomNavBar.length; i++) {
    bottomNavBarItem.add(
      NavigationDestination(
        icon: badges.Badge(
          //showBadge: badgeShow?[i] != null ? badgeShow![i] : false,
          showBadge: badgeShow?[i] ?? false,
          badgeAnimation: const badges.BadgeAnimation.size(
            appearanceDisappearanceFadeAnimationEnabled: false,
            toAnimate: false,
          ),
          //badgeContent: badgeContent?[i] != null ? badgeContent![i] : null,
          badgeContent: badgeContent?[i],
          badgeStyle: badges.BadgeStyle(badgeColor: badgeColor?[i] ?? Colors.red),
          child: iconsBottomNavBar[i],
        ),
        label: labelsBottomNavBar?[i] ?? '',
        selectedIcon: selectedIconBottomNavBar?[i],
        tooltip: tooltipItemBottomNavBar?[i] ?? '',
      ),
    );
  }*/
  return bottomNavBarItem;
}
