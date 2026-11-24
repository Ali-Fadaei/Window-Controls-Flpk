import 'dart:async';
import 'package:flutter/services.dart';

class WindowControlsMacOS {
  static const MethodChannel _channel = const MethodChannel('window_controls');

  static Future<void> maximizeOrRestoreWindow(int window) async {
    await _channel.invokeMethod('maximizeOrRestoreWindow', {
      'window': window,
    });
  }

  static Future<int?> getAppWindow() async {
    int? _appWindow;
    await _channel.invokeMethod('getAppWindow').then((value) {
      _appWindow = value;
    });
    return _appWindow;
  }
}
