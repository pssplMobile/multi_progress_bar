<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->
# Multi Progress Bar
![Pub Version](https://img.shields.io/pub/v/multi_progress_bar)

A flutter library for simple and fast building of a progress bar with multiple
progress.

![](https://raw.githubusercontent.com/pssplMobile/pssplAssets/main/multi_progress_bar.png)

## Features

- Display multiple values on a vertical bar using progress indicators.
- Null safety
- Built on Dart

## Getting started

To start, import the dependency in your code:

```dart
import 'package:multi_progress_bar/progress_bar.dart';
```

Next, to use it :

```dart
MultiProgressBar(
    progressList: [
    ProgressItem(title: 'Type A', progress: 0.7, progressColor: Colors.orange),
    ProgressItem(title: 'Type B', progress: 0.1, progressColor: Colors.blue),
    ProgressItem(title: 'Type C', progress: 0.2, progressColor: Colors.yellow),
  ],
)
```
Depending on your requirements you may want to control some things. The following options are available:

| Property                  | Type              | Description                                                                                 |
|---------------------------|-------------------|---------------------------------------------------------------------------------------------|
| `enableLegends`           | bool              | Controls the legends will be enabled or disabled.                                           |

## Usage

```dart
  MultiProgressBar(
    progressList: [
    ProgressItem(title: 'Type A', progress: 0.7, progressColor: Colors.orange),
    ProgressItem(title: 'Type B', progress: 0.1, progressColor: Colors.blue),
    ProgressItem(title: 'Type C', progress: 0.2, progressColor: Colors.yellow),
  ],
)
```

## Additional information

For author/contributor information, see the AUTHORS file.
