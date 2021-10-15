import 'package:flutter/material.dart';

// Mockup design size
const mockupHeight = 812;
const mockupWidth = 375;

extension ScreenUtil on BuildContext {
  // Device information
  double get dw => MediaQuery.of(this).size.width;
  double get dh => MediaQuery.of(this).size.height;
  double get dAspectRatio => MediaQuery.of(this).size.aspectRatio;
  double get statusBarHeight => MediaQuery.of(this).padding.top;
  double get bottomBarHeight => MediaQuery.of(this).padding.bottom;
  double get dPixelRatio => MediaQuery.of(this).devicePixelRatio;
  double get dts => MediaQuery.of(this).textScaleFactor;
  Orientation get orientation => MediaQuery.of(this).orientation;
  bool get isPortrait => orientation == Orientation.portrait;
  bool get isLandscape => orientation == Orientation.landscape;

  // Pixel Perfect Ratio
  double get sw => isPortrait ? mockupWidth / dw : mockupWidth / dh;
  double get sh => isPortrait ? mockupHeight / dh : mockupWidth / dw;
  double get ts => isPortrait ? dw / mockupWidth : dh / mockupWidth;
  double dp(double size) =>
      isPortrait ? size / mockupWidth * dw : size / mockupWidth * dh;
  double h(double size) => size / mockupHeight * dh;

  // Text and Color Theme data
  TextTheme get text => Theme.of(this).textTheme;
  Color get primaryColor => Theme.of(this).colorScheme.primary;
  Color get primaryVariant => Theme.of(this).colorScheme.primaryVariant;
  Color get secondaryColor => Theme.of(this).colorScheme.secondary;
  Color get secondaryVariant => Theme.of(this).colorScheme.secondaryVariant;
  Color get hintColor => Theme.of(this).hintColor;
  Color get disableColor => Theme.of(this).disabledColor;
  Color get surface =>
      Theme.of(this).colorScheme.surface; // Surface color, like card & modal
  Color get errorColor => Theme.of(this).colorScheme.error;
  Color get background => Theme.of(this).colorScheme.background;

  // Text and Icon Color
  Color get onPrimary => Theme.of(this).colorScheme.onPrimary;
  Color get onSecondary => Theme.of(this).colorScheme.onSecondary;
  Color get onBackground => Theme.of(this).colorScheme.onBackground;
  Color get onSurface => Theme.of(this).colorScheme.onSurface;
  Color get onError => Theme.of(this).colorScheme.onError;

  // Widgets theme data
  ElevatedButtonThemeData get elevatedButton =>
      Theme.of(this).elevatedButtonTheme;
}

// Hero Tag extension
extension HeroTag on int {
  String get spaceImg => 'space-img-$this';
  String get spaceName => 'space-name-$this';
  String get spacePrice => 'space-price-$this';
  String get spaceStars => 'space-stars-$this';
}
