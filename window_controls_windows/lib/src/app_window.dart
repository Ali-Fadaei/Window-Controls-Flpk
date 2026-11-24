library window_controls_windows;

import './native_api.dart';
import './window.dart';

const notInitializedMessage = """
 window_controls is not initalized.  
 """;

class WindowControlsNotInitializedException implements Exception {
  String errMsg() => notInitializedMessage;
}

class WinAppWindow extends WinWindow {
  WinAppWindow._() {
    super.handle = getAppWindow();
    final isLoaded = isWindowControlsLoaded();
    if (!isLoaded) {
      print(notInitializedMessage);
      throw WindowControlsNotInitializedException;
    }
    assert(handle != null, "Could not get Flutter window");
  }

  static final WinAppWindow _instance = WinAppWindow._();

  factory WinAppWindow() {
    return _instance;
  }
}
