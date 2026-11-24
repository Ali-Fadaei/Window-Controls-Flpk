import 'package:window_controls_platform_interface/window_controls_platform_interface.dart';
import 'dart:ui';
export './window_interface.dart';

class WindowControlsWindows extends WindowControlsPlatform {
  WindowControlsWindows() {
    assert(false);
  }

  @override
  void doWhenWindowReady(VoidCallback callback) {}

  @override
  DesktopWindow get appWindow {
    return AppWindowNotImplemented();
  }
}
