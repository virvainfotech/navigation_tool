import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navigation_tool/navigation_tool.dart';

class NavigationRailWidget extends ConsumerWidget {
  const NavigationRailWidget({
    required this.navRailTabs,
    required this.navRailIcons,
    required this.navRailLabels,
    this.navRailLeading,
    this.navRailTrailing,
    this.navRailUseIndicator,
    this.navRailBackgroundColor,
    this.navRailElevation,
    this.navRailExtended,
    this.navRailGroupAlignment,
    this.navRailIndicatorColor,
    this.navRailMinExtendedWidth,
    this.navRailMinWidth,
    this.navRailSelectedIconTheme,
    this.navRailSelectedLabelTextStyle,
    this.navRailUnselectedIconTheme,
    this.navRailUnselectedLabelTextStyle,
    this.navRailLabelType,
    this.navRailInsidePadding,
    this.navRailSelectedIcon,
    super.key,
  });

  final List<Widget> navRailTabs;
  final List<Widget> navRailIcons;
  final List<Widget> navRailLabels;
  final Widget? navRailLeading;
  final Widget? navRailTrailing;
  final bool? navRailUseIndicator;
  final Color? navRailBackgroundColor;
  final double? navRailElevation;
  final bool? navRailExtended;
  final double? navRailGroupAlignment;
  final Color? navRailIndicatorColor;
  final double? navRailMinExtendedWidth;
  final double? navRailMinWidth;
  final IconThemeData? navRailSelectedIconTheme;
  final TextStyle? navRailSelectedLabelTextStyle;
  final IconThemeData? navRailUnselectedIconTheme;
  final TextStyle? navRailUnselectedLabelTextStyle;
  final NavigationRailLabelType? navRailLabelType;
  final EdgeInsetsGeometry? navRailInsidePadding;
  final List<Widget>? navRailSelectedIcon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int selectedIndex = ref.watch(navigationIndexProvider);

    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints:
            BoxConstraints(minHeight: MediaQuery.of(context).size.height),
        child: IntrinsicHeight(
          // Vertical menu bar
          child: NavigationRail(
            useIndicator: navRailUseIndicator,
            backgroundColor: navRailBackgroundColor,
            elevation: navRailElevation,
            extended: navRailExtended ?? false,
            groupAlignment: navRailGroupAlignment,
            indicatorColor: navRailIndicatorColor,
            minExtendedWidth: navRailMinExtendedWidth,
            minWidth: navRailMinWidth,
            selectedIconTheme: navRailSelectedIconTheme,
            selectedLabelTextStyle: navRailSelectedLabelTextStyle,
            unselectedIconTheme: navRailUnselectedIconTheme,
            unselectedLabelTextStyle: navRailUnselectedLabelTextStyle,
            onDestinationSelected: (int index) {
              ref.read(navigationIndexProvider.notifier).setPageIndex = index;
            },
            selectedIndex: selectedIndex,
            labelType: navRailLabelType,
            // Show at the top of the NavigationRailDestination rail
            leading: navRailLeading,
            // Vertical tab items
            // The value must be a list of two or more NavigationRailDestination values.
            destinations: navigationRailDestination(
              navRailIcons: navRailIcons,
              navRailLabels: navRailLabels,
              navRailTabs: navRailTabs,
              padding: navRailInsidePadding,
              selectedIcon: navRailSelectedIcon,
            ),
            // Show at the bottom of the NavigationRailDestination rail
            trailing: navRailTrailing,
          ),
        ),
      ),
    );
  }
}
