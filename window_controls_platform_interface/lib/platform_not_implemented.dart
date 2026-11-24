import 'package:window_controls_platform_interface/window_controls_platform_interface.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui';
import 'package:flutter/widgets.dart';

class AppWindowNotImplemented extends NotImplementedWindow {
  AppWindowNotImplemented._();

  static final AppWindowNotImplemented _instance = AppWindowNotImplemented._();

  factory AppWindowNotImplemented() {
    return _instance;
  }
}

class WindowControlsPlatformNotImplemented extends WindowControlsPlatform {
  @override
  void doWhenWindowReady(VoidCallback callback) {
    // do nothing on other platforms
  }

  @override
  DesktopWindow get appWindow {
    return AppWindowNotImplemented();
  }
}
