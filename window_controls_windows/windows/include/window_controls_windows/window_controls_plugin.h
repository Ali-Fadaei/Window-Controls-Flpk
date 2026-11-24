#ifndef FLUTTER_PLUGIN_WINDOW_CONTROLS_PLUGIN_H_
#define FLUTTER_PLUGIN_WINDOW_CONTROLS_PLUGIN_H_

#include <flutter_plugin_registrar.h>

#if defined(__cplusplus)
extern "C" {
#endif

void WindowControlsPluginRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar);

#define WCTL_CUSTOM_FRAME    0x1
#define WCTL_HIDE_ON_STARTUP 0x2

int window_controls_configure(unsigned int flags);

#if defined(__cplusplus)
}  // extern "C"
#endif

#endif  // FLUTTER_PLUGIN_WINDOW_CONTROLS_PLUGIN_H_
