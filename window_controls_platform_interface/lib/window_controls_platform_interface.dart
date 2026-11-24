import 'dart:ui';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'method_channel_window_controls.dart';
import './window.dart';

export './window.dart';
export './window_common.dart';
export './window_not_implemented.dart';
export './platform_not_implemented.dart';

/// The interface that implementations of window_controls must implement.
///
/// Platform implementations should extend this class rather than implement it as `window_controls`
/// does not consider newly added methods to be breaking changes. Extending this class
/// (using `extends`) ensures that the subclass will get the default implementation, while
/// platform implementations that `implements` this interface will be broken by newly added
/// [WindowControlsPlatform] methods.
abstract class WindowControlsPlatform extends PlatformInterface {
  /// Constructs a WindowControlsPlatform.
  WindowControlsPlatform() : super(token: _token);

  static final Object _token = Object();

  static WindowControlsPlatform _channelInstance =
      MethodChannelWindowControls();
  static WindowControlsPlatform _instance = _channelInstance;

  /// The default instance of [WindowControlsPlatform] to use.
  ///
  /// Defaults to [MethodChannelWindowControls].
  static WindowControlsPlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [WindowControlsPlatform] when they register themselves.
  static set instance(WindowControlsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  void doWhenWindowReady(VoidCallback callback) {
    throw UnimplementedError('doWhenWindowReady() has not been implemented.');
  }

  DesktopWindow get appWindow {
    throw UnimplementedError('appWindow has not been implemented.');
  }

  void dragAppWindow() async {
    _channelInstance.dragAppWindow();
  }
}
