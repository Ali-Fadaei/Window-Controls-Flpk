library window_controls_macos;

import 'package:window_controls_platform_interface/window_controls_platform_interface.dart';
import 'package:flutter/widgets.dart';
import './app_window.dart';
import './native_api.dart';

T? _ambiguate<T>(T? value) => value;

class WindowControlsMacOS extends WindowControlsPlatform {
  WindowControlsMacOS() : super();

  @override
  void doWhenWindowReady(VoidCallback callback) {
    _ambiguate(WidgetsBinding.instance)!
        .waitUntilFirstFrameRasterized
        .then((value) {
      setWindowCanBeShown(true);
      setInsideDoWhenWindowReady(true);
      callback();
      setInsideDoWhenWindowReady(false);
    });
  }

  @override
  void dragAppWindow() async {
    print("We whould drag the window here");
  }

  @override
  DesktopWindow get appWindow {
    return MacAppWindow();
  }
}
