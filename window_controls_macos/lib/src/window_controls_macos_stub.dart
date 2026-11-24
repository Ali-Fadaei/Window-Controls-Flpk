import 'package:window_controls_platform_interface/window_controls_platform_interface.dart';
import 'dart:ui';

class WindowControlsMacOS extends WindowControlsPlatform {
  WindowControlsMacOS() {
    assert(false);
  }

  @override
  void doWhenWindowReady(VoidCallback callback) {}

  @override
  DesktopWindow get appWindow {
    return AppWindowNotImplemented();
  }
}
