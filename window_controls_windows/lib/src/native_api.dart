library window_controls_windows;

import 'dart:ffi';

final DynamicLibrary _appExecutable = DynamicLibrary.executable();

// isWindowControlsLoaded
typedef Int8 TIsWindowControlsLoaded();
typedef DTIsWindowControlsLoaded = int Function();
final DTIsWindowControlsLoaded? _isWindowControlsLoaded =
    _publicAPI.ref.isWindowControlsLoaded.asFunction();

bool isWindowControlsLoaded() {
  if (_isWindowControlsLoaded == null) {
    return false;
  }
  return _isWindowControlsLoaded!() == 1 ? true : false;
}

// getAppWindow
typedef IntPtr TGetAppWindow();
typedef DGetAppWindow = int Function();
final DGetAppWindow getAppWindow = _publicAPI.ref.getAppWindow.asFunction();

// isDPIAware
typedef Int8 TIsDPIAware();
typedef DIsDPIAware = int Function();
final DIsDPIAware _isDPIAware = _publicAPI.ref.isDPIAware.asFunction();
bool isDPIAware() => _isDPIAware() != 0;

// setWindowCanBeShown
typedef Void TSetWindowCanBeShown(Int8 value);
typedef DSetWindowCanBeShown = void Function(int value);
final DSetWindowCanBeShown _setWindowCanBeShown =
    _publicAPI.ref.setWindowCanBeShown.asFunction();
void setWindowCanBeShown(bool value) => _setWindowCanBeShown(value ? 1 : 0);

// setMinSize
typedef Void TSetMinSize(Int32 width, Int32 height);
typedef DSetMinSize = void Function(int width, int height);
final DSetMinSize setMinSize = _publicAPI.ref.setMinSize.asFunction();

// setMaxSize
typedef Void TSetMaxSize(Int32 width, Int32 height);
typedef DSetMaxSize = void Function(int width, int height);
final DSetMinSize setMaxSize = _publicAPI.ref.setMaxSize.asFunction();

// setWindowCutOnMaximize
typedef Void TSetWindowCutOnMaximize(Int32 width);
typedef DSetWindowCutOnMaximize = void Function(int width);
final DSetWindowCutOnMaximize setWindowCutOnMaximize =
    _publicAPI.ref.setWindowCutOnMaximize.asFunction();

final class WCTLPublicAPI extends Struct {
  external Pointer<NativeFunction<TIsWindowControlsLoaded>>
      isWindowControlsLoaded;
  external Pointer<NativeFunction<TGetAppWindow>> getAppWindow;
  external Pointer<NativeFunction<TSetWindowCanBeShown>> setWindowCanBeShown;
  external Pointer<NativeFunction<TSetMinSize>> setMinSize;
  external Pointer<NativeFunction<TSetMaxSize>> setMaxSize;
  external Pointer<NativeFunction<TSetWindowCutOnMaximize>>
      setWindowCutOnMaximize;
  external Pointer<NativeFunction<TIsDPIAware>> isDPIAware;
}

final class WCTLAPI extends Struct {
  external Pointer<WCTLPublicAPI> publicAPI;
}

typedef Pointer<WCTLAPI> TWindowControlsAPI();

final TWindowControlsAPI windowControlsAPI = _appExecutable
    .lookup<NativeFunction<TWindowControlsAPI>>("window_controls_api")
    .asFunction();

final Pointer<WCTLPublicAPI> _publicAPI = windowControlsAPI().ref.publicAPI;
