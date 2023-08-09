//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <state_widget/state_widget_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) state_widget_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "StateWidgetPlugin");
  state_widget_plugin_register_with_registrar(state_widget_registrar);
}
