import 'package:flutter/services.dart';

import 'window_controls_platform_interface.dart';

const MethodChannel _channel = MethodChannel('window_controls');

/// An implementation of [WindowControlsPlatform] that uses method channels.
class MethodChannelWindowControls extends WindowControlsPlatform {
  @override
  void dragAppWindow() async {
    try {
      await _channel.invokeMethod('dragAppWindow');
    } catch (e) {
      print("Could not start draggging -> $e");
    }
  }
}
