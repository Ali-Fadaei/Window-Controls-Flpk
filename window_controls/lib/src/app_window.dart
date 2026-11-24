import 'package:window_controls_platform_interface/window_controls_platform_interface.dart';
import 'package:window_controls_platform_interface/method_channel_window_controls.dart';
import 'package:window_controls_windows/window_controls_windows.dart';
import 'package:window_controls_macos/window_controls_macos.dart';
import 'package:window_controls_linux/window_controls_linux.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;

bool _platformInstanceNeedsInit = true;

void initPlatformInstance() {
  if (!kIsWeb) {
    if (WindowControlsPlatform.instance is MethodChannelWindowControls) {
      if (Platform.isWindows) {
        WindowControlsPlatform.instance = WindowControlsWindows();
      } else if (Platform.isMacOS) {
        WindowControlsPlatform.instance = WindowControlsMacOS();
      } else if (Platform.isLinux) {
        WindowControlsPlatform.instance = WindowControlsLinux();
      }
    }
  } else {
    WindowControlsPlatform.instance = WindowControlsPlatformNotImplemented();
  }
}

WindowControlsPlatform get _platform {
  var needsInit = _platformInstanceNeedsInit;
  if (needsInit) {
    initPlatformInstance();
    _platformInstanceNeedsInit = false;
  }
  return WindowControlsPlatform.instance;
}

void doWhenWindowReady(VoidCallback callback) {
  _platform.doWhenWindowReady(callback);
}

DesktopWindow get appWindow {
  return _platform.appWindow;
}
