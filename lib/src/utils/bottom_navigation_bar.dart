import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navigation_tool/navigationbar_mobile_web.dart';

class BottomNavigationBarWidget extends ConsumerWidget {
  const BottomNavigationBarWidget({
    required this.tabsBottomNavBar,
    required this.iconsBottomNavBar,
    this.labelsBottomNavBar,
    this.tooltipItemBottomNavBar,
    this.selectedIconBottomNavBar,
    this.elevation,
    this.backgroundColor,
    this.height,
    this.animationDuration,
    this.labelBehavior,
    this.surfaceTintColor,
    Key? key,
  }) : super(key: key);
  final List tabsBottomNavBar;
  final List<Widget> iconsBottomNavBar;
  final List<String>? labelsBottomNavBar;
  final List<String>? tooltipItemBottomNavBar;
  final List<Widget>? selectedIconBottomNavBar;
  final double? elevation;
  final Color? backgroundColor;
  final double? height;
  final Duration? animationDuration;
  final NavigationDestinationLabelBehavior? labelBehavior;
  final Color? surfaceTintColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int selectedIndex = ref.watch(navigationIndexProvider);

    return NavigationBar(
      destinations: bottomNavigationBarItem(
        tabsBottomNavBar: tabsBottomNavBar,
        iconsBottomNavBar: iconsBottomNavBar,
        selectedIconBottomNavBar: selectedIconBottomNavBar,
        labelsBottomNavBar: labelsBottomNavBar,
        tooltipItemBottomNavBar: tooltipItemBottomNavBar,
      ),
      elevation: elevation,
      backgroundColor: backgroundColor,
      height: height,
      animationDuration: animationDuration,
      labelBehavior: labelBehavior,
      onDestinationSelected: (int index) {
        ref.read(navigationIndexProvider.notifier).setPageIndex = index;
      },
      selectedIndex: selectedIndex,
      surfaceTintColor: surfaceTintColor,
    );
  }
}
