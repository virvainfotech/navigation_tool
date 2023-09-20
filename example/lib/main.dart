import 'package:example/navigation_items.dart';
import 'package:example/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navigation_tool/navigationbar_mobile_web.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Navigation Mobile Web',
        darkTheme: ThemeData.dark(useMaterial3: true),
        theme: ThemeData(
          useMaterial3: true,
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.only(left: 8),
              //iconColor: ThemeData().iconTheme.color,
              //textStyle: const TextStyle(color: Colors.black)
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        home: const MyApp(),
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isNavRailExpanded = ref.watch(isExpandedNavRail);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: CustomNavigation(
        extendedNavRail: isNavRailExpanded,
        labelTypeNavRail: NavigationRailLabelType.all,
        navigationTabs: NavigationItems().tabs,
        navigationIcons: NavigationItems().navigationIcons,
        labelsNavRail: NavigationItems().labelNavRail,
        labelsBottomNavBar: NavigationItems().labelBottomNav,
        minExtendedWidthNavRail: 200,
        appBar: AppBar(
          title: const Text('Navigation Mobile Web'),
          //elevation: 2,
          actions: [
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.info_outline),
              onPressed: () {},
            ),
          ],
        ),
        leadingNavRail: NavigationItems().navigationRailHeader(
          width: screenWidth >= 1500 || isNavRailExpanded == true ? 160 : null,
          icon: Icons.format_list_bulleted_rounded,
          onTap: () {
            if (screenWidth <= 1500) {
              if (isNavRailExpanded == true) {
                ref.read(isExpandedNavRail.notifier).toggle = false;
              } else {
                ref.read(isExpandedNavRail.notifier).toggle = true;
              }
            }
          },
        ),
        trailingNavRail: NavigationItems().navigationRailTrailing(
          width: screenWidth >= 1500 || isNavRailExpanded == true ? 160 : 60,
          children: [
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.mail_outline),
              label: screenWidth <= 1500 && isNavRailExpanded == false ? const Text('') : const Text('Send Mail'),
            ),
            const SizedBox(height: 5),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.search),
              label: screenWidth <= 1500 && isNavRailExpanded == false ? const Text('') : const Text('Search'),
            ),
            const SizedBox(height: 5),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.settings),
              label: screenWidth <= 1500 && isNavRailExpanded == false ? const Text('') : const Text('Setting'),
            ),
            const SizedBox(height: 5),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.security),
              label: screenWidth <= 1500 && isNavRailExpanded == false ? const Text('') : const Text('Security'),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
