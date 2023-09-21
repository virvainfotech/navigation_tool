import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navigation_tool/navigation_tool.dart';

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

  /// List of tabs (NavigationRail and BottomNavigationBar)
  final List<Widget> navigationTabs;

  /// List of Navigation icons which are same for NavigationRail and BottomNavigationBar
  final List<Widget> navigationIcons;

  /// The label for the destination.
  ///
  /// The label must be provided when used with the [NavigationRail]. When the
  /// [NavigationRail.labelType] is [NavigationRailLabelType.none], the label is
  /// still used for semantics, and may still be used if
  /// [NavigationRail.extended] is true.
  final List<Widget> labelsNavRail;

  /// Default screen width,
  /// if the screen with is less then 1000 than show bottom navigation bar else show navigation rail
  final double screenWidth;

  /// The leading widget in the rail that is placed above the destinations.
  /// It is placed at the top of the rail, above the destinations. Its location is not affected by groupAlignment.
  /// This is commonly a FloatingActionButton, but may also be a non-button, such as a logo.
  /// The default value is null.
  final Widget? leadingNavRail;

  /// The trailing widget in the rail that is placed below the destinations.
  /// The trailing widget is placed below the last NavigationRailDestination. It's location is affected by groupAlignment.
  /// This is commonly a list of additional options or destinations that is usually only rendered when extended is true.
  /// The default value is null.
  final Widget? trailingNavRail;

  /// If true, adds a rounded NavigationIndicator behind the selected destination's icon.
  /// The indicator's shape will be circular if labelType is NavigationRailLabelType.none, or a StadiumBorder if labelType is NavigationRailLabelType.all or NavigationRailLabelType.selected.
  /// If null, defaults to NavigationRailThemeData.useIndicator. If that is null, defaults to ThemeData.useMaterial3.
  final bool? useIndicatorNavRail;

  /// Sets the color of the Container that holds all of the NavigationRail's contents.
  /// The default value is NavigationRailThemeData.backgroundColor. If NavigationRailThemeData.backgroundColor is null, then the default value is based on ColorScheme.surface of ThemeData.colorScheme.
  final Color? backgroundColorNavRail;

  /// The rail's elevation or z-coordinate.
  /// If Directionality is intl.TextDirection.LTR, the inner side is the right side, and if Directionality is intl.TextDirection.RTL, it is the left side.
  /// The default value is 0.
  final double? elevationNavRail;

  /// Indicates that the NavigationRail should be in the extended state.
  /// The extended state has a wider rail container, and the labels are positioned next to the icons. minExtendedWidth can be used to set the minimum width of the rail when it is in this state.
  /// The rail will implicitly animate between the extended and normal state.
  /// If the rail is going to be in the extended state, then the labelType must be set to NavigationRailLabelType.none.
  /// The default value is false.
  final bool? extendedNavRail;

  /// The vertical alignment for the group of destinations within the rail.
  /// The NavigationRailDestinations are grouped together with the trailing widget, between the leading widget and the bottom of the rail.
  /// The value must be between -1.0 and 1.0.
  /// If groupAlignment is -1.0, then the items are aligned to the top. If groupAlignment is 0.0, then the items are aligned to the center. If groupAlignment is 1.0, then the items are aligned to the bottom.
  /// The default is -1.0.
  final double? groupAlignmentNavRail;

  /// Overrides the default value of NavigationRail's selection indicator color, when useIndicator is true.
  final Color? indicatorColorNavRail;

  /// The final width when the animation is complete for setting extended to true.
  /// This is only used when extended is set to true.
  /// The default value is 256.
  final double? minExtendedWidthNavRail;

  /// The smallest possible width for the rail regardless of the destination's icon or label size.
  /// The default is 72.
  /// This value also defines the min width and min height of the destinations.
  /// To make a compact rail, set this to 56 and use NavigationRailLabelType.none.
  final double? minWidthNavRail;

  /// The visual properties of the icon in the selected destination.
  ///
  /// When a [NavigationRailDestination] is not selected,
  /// [unselectedIconTheme] will be used.
  ///
  /// The default value is the [Theme]'s [ThemeData.iconTheme] with a color
  /// of the [Theme]'s [ColorScheme.primary]. Properties from this icon theme,
  /// or [NavigationRailThemeData.selectedIconTheme] if this is null, are
  /// merged into the defaults.
  final IconThemeData? selectedIconThemeNavRail;

  /// The [TextStyle] of a destination's label when it is selected.
  ///
  /// When a [NavigationRailDestination] is not selected,
  /// [unselectedLabelTextStyle] will be used.
  ///
  /// The default value is based on the [TextTheme.bodyText1] of
  /// [ThemeData.textTheme]. The default color is based on the [Theme]'s
  /// [ColorScheme.primary].
  ///
  /// Properties from this text style,
  /// or [NavigationRailThemeData.selectedLabelTextStyle] if this is null, are
  /// merged into the defaults.
  final TextStyle? selectedLabelTextStyleNavRail;

  /// The visual properties of the icon in the unselected destination.
  ///
  /// If this field is not provided, or provided with any null properties, then
  /// a copy of the [IconThemeData.fallback] with a custom [NavigationRail]
  /// specific color will be used.
  ///
  /// The default value is the [Theme]'s [ThemeData.iconTheme] with a color
  /// of the [Theme]'s [ColorScheme.onSurface] with an opacity of 0.64.
  /// Properties from this icon theme, or
  /// [NavigationRailThemeData.unselectedIconTheme] if this is null, are
  /// merged into the defaults.
  final IconThemeData? unselectedIconThemeNavRail;

  /// The [TextStyle] of a destination's label when it is unselected.
  ///
  /// When one of the [destinations] is selected the [selectedLabelTextStyle]
  /// will be used instead.
  ///
  /// The default value is based on the [Theme]'s [TextTheme.bodyText1]. The
  /// default color is based on the [Theme]'s [ColorScheme.onSurface].
  ///
  /// Properties from this text style, or
  /// [NavigationRailThemeData.unselectedLabelTextStyle] if this is null, are
  /// merged into the defaults.
  final TextStyle? unselectedLabelTextStyleNavRail;

  /// Defines the layout and behavior of the labels for the default, unextended
  /// [NavigationRail].
  ///
  /// When a navigation rail is [extended], the labels are always shown.
  ///
  /// The default value is [NavigationRailThemeData.labelType]. If
  /// [NavigationRailThemeData.labelType] is null, then the default value is
  /// [NavigationRailLabelType.none].
  ///
  /// See also:
  ///
  ///   * [NavigationRailLabelType] for information on the meaning of different
  ///   types.
  final NavigationRailLabelType? labelTypeNavRail;

  /// The amount of space to inset the destination item.
  final EdgeInsetsGeometry? insidePaddingNavRail;

  /// An alternative icon displayed when this destination is selected.
  ///
  /// If this icon is not provided, the [NavigationRail] will display [icon] in
  /// either state. The size, color, and opacity of the
  /// [NavigationRail.selectedIconTheme] will still apply.
  ///
  /// See also:
  ///
  ///  * [NavigationRailDestination.icon], for a description of how to pair
  ///    icons.
  final List<Widget>? selectedIconNavRail;

  /// The text label that appears below the icon of this
  /// [NavigationDestination].
  ///
  /// The accompanying [Text] widget will use
  /// [NavigationBarThemeData.labelTextStyle]. If this are null, the default
  /// text style would use [TextTheme.overline] with [ColorScheme.onSurface].
  final List<String>? labelsBottomNavBar;

  /// The text to display in the tooltip for this [NavigationDestination], when
  /// the user long presses the destination.
  ///
  /// If [tooltip] is an empty string, no tooltip will be used.
  ///
  /// Defaults to null, in which case the [label] text will be used.
  final List<String>? tooltipItemBottomNavBar;

  /// The optional [Widget] (usually an [Icon]) that's displayed when this
  /// [NavigationDestination] is selected.
  ///
  /// If [selectedIcon] is non-null, the destination will fade from
  /// [icon] to [selectedIcon] when this destination goes from unselected to
  /// selected.
  ///
  /// The icon will use [NavigationBarThemeData.iconTheme] with
  /// [MaterialState.selected]. If this is null, the default [IconThemeData]
  /// would use a size of 24.0 and [ColorScheme.onSurface].
  final List<Widget>? selectedIconBottomNavBar;

  /// The elevation of the [NavigationBar] itself.
  ///
  /// If null, [NavigationBarThemeData.elevation] is used. If that
  /// is also null, then if [ThemeData.useMaterial3] is true then it will
  /// be 3.0 otherwise 0.0.
  final double? elevationBottomNavBar;

  /// The color of the [NavigationBar] itself.
  ///
  /// If null, [NavigationBarThemeData.backgroundColor] is used. If that
  /// is also null, then if [ThemeData.useMaterial3] is true, the value is
  /// [ColorScheme.surface]. If that is false, the default blends [ColorScheme.surface]
  /// and [ColorScheme.onSurface] using an [ElevationOverlay].
  final Color? backgroundColorBottomNavBar;

  /// The height of the [NavigationBar] itself.
  ///
  /// If this is used in [Scaffold.bottomNavigationBar] and the scaffold is
  /// full-screen, the safe area padding is also added to the height
  /// automatically.
  ///
  /// The height does not adjust with [ThemeData.visualDensity] or
  /// [MediaQueryData.textScaleFactor] as this component loses usability at
  /// larger and smaller sizes due to the truncating of labels or smaller tap
  /// targets.
  ///
  /// If null, [NavigationBarThemeData.height] is used. If that
  /// is also null, the default is 80.
  final double? heightBottomNavBar;

  /// The color used as an overlay on [backgroundColor] to indicate elevation.
  ///
  /// If null, [NavigationBarThemeData.surfaceTintColor] is used. If that
  /// is also null, the default value is [ColorScheme.surfaceTint].
  ///
  /// See [Material.surfaceTintColor] for more details on how this
  /// overlay is applied.
  final Color? surfaceTintColorBottomNavBar;

  /// Defines how the [destinations]' labels will be laid out and when they'll
  /// be displayed.
  ///
  /// Can be used to show all labels, show only the selected label, or hide all
  /// labels.
  ///
  /// If null, [NavigationBarThemeData.labelBehavior] is used. If that
  /// is also null, the default is
  /// [NavigationDestinationLabelBehavior.alwaysShow].
  final NavigationDestinationLabelBehavior? labelBehaviorBottomNavBar;

  /// Determines the transition time for each destination as it goes between
  /// selected and unselected.
  final Duration? animationDurationBottomNavBar;

  /// A Material Design app bar.
  ///
  /// An app bar consists of a toolbar and potentially other widgets, such as a
  /// [TabBar] and a [FlexibleSpaceBar]. App bars typically expose one or more
  /// common [actions] with [IconButton]s which are optionally followed by a
  /// [PopupMenuButton] for less common operations (sometimes called the "overflow
  /// menu").
  ///
  /// App bars are typically used in the [Scaffold.appBar] property, which places
  /// the app bar as a fixed-height widget at the top of the screen. For a scrollable
  /// app bar, see [SliverAppBar], which embeds an [AppBar] in a sliver for use in
  /// a [CustomScrollView].
  ///
  /// The AppBar displays the toolbar widgets, [leading], [title], and [actions],
  /// above the [bottom] (if any). The [bottom] is usually used for a [TabBar]. If
  /// a [flexibleSpace] widget is specified then it is stacked behind the toolbar
  /// and the bottom widget. The following diagram shows where each of these slots
  /// appears in the toolbar when the writing language is left-to-right (e.g.
  /// English):
  ///
  /// The [AppBar] insets its content based on the ambient [MediaQuery]'s padding,
  /// to avoid system UI intrusions. It's taken care of by [Scaffold] when used in
  /// the [Scaffold.appBar] property. When animating an [AppBar], unexpected
  /// [MediaQuery] changes (as is common in [Hero] animations) may cause the content
  /// to suddenly jump. Wrap the [AppBar] in a [MediaQuery] widget, and adjust its
  /// padding such that the animation is smooth.
  ///
  /// ![The leading widget is in the top left, the actions are in the top right,
  /// the title is between them. The bottom is, naturally, at the bottom, and the
  /// flexibleSpace is behind all of them.](https://flutter.github.io/assets-for-api-docs/assets/material/app_bar.png)
  ///
  /// If the [leading] widget is omitted, but the [AppBar] is in a [Scaffold] with
  /// a [Drawer], then a button will be inserted to open the drawer. Otherwise, if
  /// the nearest [Navigator] has any previous routes, a [BackButton] is inserted
  /// instead. This behavior can be turned off by setting the [automaticallyImplyLeading]
  /// to false. In that case a null leading widget will result in the middle/title widget
  /// stretching to start.
  ///
  /// {@tool dartpad}
  /// This sample shows an [AppBar] with two simple actions. The first action
  /// opens a [SnackBar], while the second action navigates to a new page.
  ///
  /// ** See code in examples/api/lib/material/app_bar/app_bar.0.dart **
  /// {@end-tool}
  ///
  /// Material Design 3 introduced new types of app bar.
  /// {@tool dartpad}
  /// This sample shows the creation of an [AppBar] widget with the [shadowColor] and
  /// [scrolledUnderElevation] properties set, as described in:
  /// https://m3.material.io/components/top-app-bar/overview
  ///
  /// ** See code in examples/api/lib/material/app_bar/app_bar.1.dart **
  /// {@end-tool}
  ///
  /// ## Troubleshooting
  ///
  /// ### Why don't my TextButton actions appear?
  ///
  /// If the app bar's [actions] contains [TextButton]s, they will not
  /// be visible if their foreground (text) color is the same as the
  /// the app bar's background color.
  ///
  /// The default app bar [backgroundColor] is the overall theme's
  /// [ColorScheme.primary] if the overall theme's brightness is
  /// [Brightness.light]. Unfortunately this is the same as the default
  /// [ButtonStyle.foregroundColor] for [TextButton] for light themes.
  /// In this case a preferable text button foreground color is
  /// [ColorScheme.onPrimary], a color that contrasts nicely with
  /// [ColorScheme.primary]. To remedy the problem, override
  /// [TextButton.style]:
  ///
  /// {@tool dartpad}
  /// This sample shows an [AppBar] with two action buttons with their primary
  /// color set to [ColorScheme.onPrimary].
  ///
  /// ** See code in examples/api/lib/material/app_bar/app_bar.2.dart **
  /// {@end-tool}
  ///
  /// See also:
  ///
  ///  * [Scaffold], which displays the [AppBar] in its [Scaffold.appBar] slot.
  ///  * [SliverAppBar], which uses [AppBar] to provide a flexible app bar that
  ///    can be used in a [CustomScrollView].
  ///  * [TabBar], which is typically placed in the [bottom] slot of the [AppBar]
  ///    if the screen has multiple pages arranged in tabs.
  ///  * [IconButton], which is used with [actions] to show buttons on the app bar.
  ///  * [PopupMenuButton], to show a popup menu on the app bar, via [actions].
  ///  * [FlexibleSpaceBar], which is used with [flexibleSpace] when the app bar
  ///    can expand and collapse.
  ///  * <https://material.io/design/components/app-bars-top.html>
  ///  * <https://m3.material.io/components/top-app-bar>
  ///  * Cookbook: [Place a floating app bar above a list](https://flutter.dev/docs/cookbook/lists/floating-app-bar)
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
              navRailExtended:
                  widget.extendedNavRail == true || screenWidth >= 1500
                      ? true
                      : false,
              navRailGroupAlignment: widget.groupAlignmentNavRail,
              navRailIndicatorColor: widget.indicatorColorNavRail,
              navRailInsidePadding: widget.insidePaddingNavRail,
              navRailLabelType:
                  widget.extendedNavRail == true || screenWidth >= 1500
                      ? NavigationRailLabelType.none
                      : widget.labelTypeNavRail,
              navRailMinExtendedWidth: widget.minExtendedWidthNavRail,
              navRailMinWidth: widget.minWidthNavRail,
              navRailSelectedIconTheme: widget.selectedIconThemeNavRail,
              navRailSelectedLabelTextStyle:
                  widget.selectedLabelTextStyleNavRail,
              navRailUnselectedIconTheme: widget.unselectedIconThemeNavRail,
              navRailUnselectedLabelTextStyle:
                  widget.unselectedLabelTextStyleNavRail,
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
