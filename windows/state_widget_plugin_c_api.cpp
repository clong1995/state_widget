#include "include/state_widget/state_widget_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "state_widget_plugin.h"

void StateWidgetPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  state_widget::StateWidgetPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
