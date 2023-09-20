# Virva Infotech Navigation Tool

`NavigationTool` Introducing a comprehensive Flutter widget solution designed to seamlessly handle navigation in diverse applications, accommodating various screen sizes. This solution harnesses the capabilities of both NavigationBar and NavigationRail, offering a versatile and powerful navigation experience.

<img src="https://github.com/virvainfotech/navigation_tool/assets/72858246/9a40d069-e165-4034-838b-6582c3e937b0" height="500" />
<img src="https://github.com/virvainfotech/navigation_tool/assets/72858246/e669fbe4-e9ec-48c5-9be8-0582b0d95e8d" height="320" />
<img src="https://github.com/virvainfotech/navigation_tool/assets/72858246/32031da0-0e5b-4719-b0b8-cbfc72dc4ee3" height="320" />

## Features

 - Ensure seamless navigation for all devices `mobile`, `web`, `windows` and `macos` applications with a single, unified package.
 - Automatically adapt to `various screen sizes` and `orientations`, providing an optimal user experience on all devices, from smartphones to desktops.
 - Offer extensive customization for navigation bars and rails, including colors, icons, and layouts, to match the app's branding and style.
 - Automatically adjust the navigation's visual appearance to fit the app's `current theme`, ensuring a cohesive design.
 - Offer compatibility with popular state management solution `Riverpod` to ensure consistent navigation state across the app.
 - This package combines the features of both the navigation rail and navigation bar while allowing for extensive customization to suit your needs.

## Getting started

- To use this package, add `navigation_tool` as a dependency in your pubspec.yaml file.
- To get started, simply wrap your MaterialApp with a ProviderScope from Riverpod.

## Usage

Minimal example:

```dart
    NavigationTool(
        navigationTabs: NavigationItems().tabs,
        navigationIcons: NavigationItems().navigationIcons,
        labelsNavRail: NavigationItems().labelNavRail
    )

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
```

## Example
- https://github.com/virvainfotech/navigation_tool/tree/main/example/lib
- https://github.com/virvainfotech/navigation_tool

## About Virva Infotech

 - With more than 10 years of dedicated expertise in the field of IT services, we have cultivated a rich history of delivering software and mobile applications to clients worldwide. As a prominent leader in the mobile application development industry, we take pride in  consistently delivering top-tier product solutions that empower our clients to successfully realize their business objectives.
 - Virva Infotech specializes in an extensive range of software development services encompassing [Android](https://virvainfotech.com/services/mobile-application-development/), [Flutter](https://virvainfotech.com/services/mobile-application-development/), [iOS](https://virvainfotech.com/services/mobile-application-development/), [React Native](https://virvainfotech.com/services/mobile-application-development/), [PHP](https://virvainfotech.com/services/web-application-development/), [Laravel](https://virvainfotech.com/services/web-application-development/), [WordPress](https://virvainfotech.com/services/web-application-development/), [ASP .NET](https://virvainfotech.com/services/web-application-development/), [Cloud and DevOps](https://virvainfotech.com/services/cloud-development/), [SEO Services](https://virvainfotech.com/services/seo-services/), [Java](https://virvainfotech.com/services/software-development/), and a myriad of other cutting-edge technologies
 - For additional details, please visit our website at [Virva Infotech](https://virvainfotech.com/) 
