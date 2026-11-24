//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <window_controls_linux/window_controls_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) window_controls_linux_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "WindowControlsPlugin");
  window_controls_plugin_register_with_registrar(window_controls_linux_registrar);
}
