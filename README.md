# Virva Infotech Navigation Tool

`NavigationTool` Introducing a comprehensive Flutter widget solution designed to seamlessly handle navigation in diverse applications, accommodating various screen sizes. This solution harnesses the capabilities of both NavigationBar and NavigationRail, offering a versatile and powerful navigation experience.

<img src="https://github.com/virvainfotech/navigation_tool/assets/72858246/9a40d069-e165-4034-838b-6582c3e937b0" height="500" />
<img src="https://github.com/virvainfotech/navigation_tool/assets/72858246/692b43ac-87c6-49a1-90a1-bfddaceb4e5c" height="320" />
<img src="https://github.com/virvainfotech/navigation_tool/assets/72858246/144b821f-90bd-4cf8-9f4e-625fa6184b82" height="320" />
<img src="https://github.com/virvainfotech/navigation_tool/assets/72858246/260bb49f-8471-4962-ad8c-8370ca5ab2e7" height="400" />

## Features

 - Ensure seamless navigation for all devices `mobile`, `web`, `windows` and `macos` applications with a single, unified package.
 - Automatically adapt to `various screen sizes` and `orientations`, providing an optimal user experience on all devices, from smartphones to desktops.
 - Offer extensive customization for navigation bars and rails, including colors, icons, and layouts, to match the app's branding and style.
 - Automatically adjust the navigation's visual appearance to fit the app's `current theme`, ensuring a cohesive design.
 - Offer compatibility with popular state management solution `Riverpod` to ensure consistent navigation state across the app.
 - This package combines the features of both the navigation rail and navigation bar while allowing for extensive customization to suit your needs.
 - Add badges to Navigation Tool for a sleek and informative user experience. Choose from a wide range of `badge types` and `colors` to suit your app's design.
   
## Getting started

- To use this package, add `navigation_tool` as a dependency in your pubspec.yaml file.
- To get started, simply wrap your MaterialApp with a ProviderScope from flutter riverpod state management.
- To obtain comprehensive information, please refer to the provided detailed example.

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
 - Virva Infotech specializes in an extensive range of software development services encompassing [Android](https://virvainfotech.com/android-app-development), [Flutter](https://virvainfotech.com/flutter-app-development), [iOS](https://virvainfotech.com/ios-app-development), [React Native](https://virvainfotech.com/react-app-development), [PHP](https://virvainfotech.com/php-development), [Laravel](https://virvainfotech.com/laravel-development), [WordPress](https://virvainfotech.com/wordpress-development), [ASP .NET](https://virvainfotech.com/dot-net-development), [SEO Services](https://virvainfotech.com/seo-services), [Angular](https://virvainfotech.com/angular-development), [Xamarin](https://virvainfotech.com/xamarin-app-development), and a myriad of other cutting-edge technologies
 - For additional details, please visit our website at [Virva Infotech](https://virvainfotech.com/) 
