import 'package:example/screens/blue.dart';
import 'package:example/screens/green.dart';
import 'package:example/screens/orange.dart';
import 'package:flutter/material.dart';

class NavigationItems {
  /// Name of the tabs
  static String one = 'One';
  static String two = 'Two';
  static String three = 'Three';
  static String four = 'Four';

  /// List of the tabs
  final List<Widget> tabs = [
    const Green(),
    const Orange(),
    const Blue(),
    const Orange(),
  ];

  /// List of the navigation icons / provide any widgets
  final List<Widget> navigationIcons = [
    const Icon(Icons.home),
    const Icon(Icons.share),
    const Icon(Icons.wifi),
    const Icon(Icons.ac_unit),
  ];

  /// List of NavigationRail label / provide list of any widgets
  final List<Widget> labelNavRail = [
    Text(one),
    Text(two),
    Text(three),
    Text(four),
  ];

  /// List of bottom navigation bar label which require string
  final List<String> labelBottomNav = [
    one,
    two,
    three,
    four,
  ];

  /// Header of the Navigation Rail, can add list of the widgets
  Widget navigationRailHeader({VoidCallback? onTap, IconData? icon, double? width}) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: onTap,
            icon: Icon(icon),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  /// Trailing of the Navigation Rail, can add list of the widgets in trailing
  Widget navigationRailTrailing({List<Widget>? children, double? width}) {
    return Expanded(
      child: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: children ?? [],
        ),
      ),
    );
  }
}
