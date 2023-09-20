import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navigation_tool/navigationbar_mobile_web.dart';

class NavigationTool extends ConsumerStatefulWidget {
  const NavigationTool({
    this.appBar,
    /// tabs and icon both (NavigationRail and BottomNavigationBar)
    required this.navigationTabs,
    required this.navigationIcons,

    /// Default screen width,
    /// if the screen with is less then 1000 than show bottom navigation bar else show navigation rail
    this.screenWidth = 1000,

    /// NavigationRail Property
    required this.labelsNavRail,
    this.leadingNavRail,
    this.trailingNavRail,
    this.useIndicatorNavRail = true,
    this.backgroundColorNavRail,
    this.elevationNavRail,
    this.extendedNavRail,
    this.groupAlignmentNavRail,
    this.indicatorColorNavRail,
    this.minExtendedWidthNavRail,
    this.minWidthNavRail,
    this.selectedIconThemeNavRail,
    this.selectedLabelTextStyleNavRail,
    this.unselectedIconThemeNavRail,
    this.unselectedLabelTextStyleNavRail,
    this.labelTypeNavRail,
    this.insidePaddingNavRail,
    this.selectedIconNavRail,

    /// Bottom navigation bar Property
    this.labelsBottomNavBar, // Bottom navigation bar label (String)
    this.tooltipItemBottomNavBar,
    this.selectedIconBottomNavBar,
    this.elevationBottomNavBar,
    this.backgroundColorBottomNavBar,
    this.animationDurationBottomNavBar,
    this.labelBehaviorBottomNavBar,
    this.heightBottomNavBar,
    this.surfaceTintColorBottomNavBar,
    super.key,
  });

  /// Tabs and Icons for (NavigationRail and BottomNavigationBar)
  final List<Widget> navigationTabs;
  final List<Widget> labelsNavRail;

  /// Screen width
  final double screenWidth;

  /// NavigationRail Property
  final List<Widget> navigationIcons;
  final Widget? leadingNavRail;
  final Widget? trailingNavRail;
  final bool? useIndicatorNavRail;
  final Color? backgroundColorNavRail;
  final double? elevationNavRail;
  final bool? extendedNavRail;
  final double? groupAlignmentNavRail;
  final Color? indicatorColorNavRail;
  final double? minExtendedWidthNavRail;
  final double? minWidthNavRail;
  final IconThemeData? selectedIconThemeNavRail;
  final TextStyle? selectedLabelTextStyleNavRail;
  final IconThemeData? unselectedIconThemeNavRail;
  final TextStyle? unselectedLabelTextStyleNavRail;
  final NavigationRailLabelType? labelTypeNavRail;
  final EdgeInsetsGeometry? insidePaddingNavRail;
  final List<Widget>? selectedIconNavRail;

  /// Bottom navigation bar Property
  final List<String>? labelsBottomNavBar; // Bottom navigation bar label (String)
  final List<String>? tooltipItemBottomNavBar;
  final List<Widget>? selectedIconBottomNavBar;
  final double? elevationBottomNavBar;
  final Color? backgroundColorBottomNavBar;
  final double? heightBottomNavBar;
  final Color? surfaceTintColorBottomNavBar;
  final NavigationDestinationLabelBehavior? labelBehaviorBottomNavBar;
  final Duration? animationDurationBottomNavBar;
  final AppBar? appBar;

  @override
  ConsumerState<NavigationTool> createState() => _NavigationState();
}

class _NavigationState extends ConsumerState<NavigationTool> {
  @override
  Widget build(BuildContext context) {
    final int selectedIndex = ref.watch(navigationIndexProvider);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: screenWidth >= widget.screenWidth
          ? null
          : BottomNavigationBarWidget(
              tabsBottomNavBar: widget.navigationTabs,
              iconsBottomNavBar: widget.navigationIcons,
              surfaceTintColor: widget.surfaceTintColorBottomNavBar,
              height: widget.heightBottomNavBar,
              backgroundColor: widget.backgroundColorBottomNavBar,
              elevation: widget.elevationBottomNavBar,
              selectedIconBottomNavBar: widget.selectedIconBottomNavBar,
              labelsBottomNavBar: widget.labelsBottomNavBar,
              tooltipItemBottomNavBar: widget.tooltipItemBottomNavBar,
              labelBehavior: widget.labelBehaviorBottomNavBar,
              animationDuration: widget.animationDurationBottomNavBar,
            ),
      body: Row(
        children: [
          // Navigation rail left side of the screen
          if (screenWidth >= widget.screenWidth)
            NavigationRailWidget(
              navRailTabs: widget.navigationTabs,
              navRailIcons: widget.navigationIcons,
              navRailLabels: widget.labelsNavRail,
              navRailLeading: widget.leadingNavRail,
              navRailTrailing: widget.trailingNavRail,
              navRailBackgroundColor: widget.backgroundColorNavRail,
              navRailElevation: widget.elevationNavRail,
              navRailExtended: widget.extendedNavRail == true || screenWidth >= 1500 ? true : false,
              navRailGroupAlignment: widget.groupAlignmentNavRail,
              navRailIndicatorColor: widget.indicatorColorNavRail,
              navRailInsidePadding: widget.insidePaddingNavRail,
              navRailLabelType: widget.extendedNavRail == true || screenWidth >= 1500 ? NavigationRailLabelType.none : widget.labelTypeNavRail,
              navRailMinExtendedWidth: widget.minExtendedWidthNavRail,
              navRailMinWidth: widget.minWidthNavRail,
              navRailSelectedIconTheme: widget.selectedIconThemeNavRail,
              navRailSelectedLabelTextStyle: widget.selectedLabelTextStyleNavRail,
              navRailUnselectedIconTheme: widget.unselectedIconThemeNavRail,
              navRailUnselectedLabelTextStyle: widget.unselectedLabelTextStyleNavRail,
              navRailUseIndicator: widget.useIndicatorNavRail,
              navRailSelectedIcon: widget.selectedIconNavRail,
            ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Appbar
                widget.appBar ?? const SizedBox.shrink(),
                // Screens/Tabs
                Expanded(child: widget.navigationTabs[selectedIndex]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
