library window_controls_linux;

import 'package:window_controls_platform_interface/window_controls_platform_interface.dart';
import './window.dart';
import './app_window.dart';
import 'package:flutter/widgets.dart';

T? _ambiguate<T>(T? value) => value;

class WindowControlsLinux extends WindowControlsPlatform {
  WindowControlsLinux() : super();

  @override
  void doWhenWindowReady(VoidCallback callback) {
    _ambiguate(WidgetsBinding.instance)!
        .waitUntilFirstFrameRasterized
        .then((value) {
      isInsideDoWhenWindowReady = true;
      callback();
      isInsideDoWhenWindowReady = false;
    });
  }

  @override
  DesktopWindow get appWindow {
    return GtkAppWindow();
  }
}
