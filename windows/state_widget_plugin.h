#ifndef FLUTTER_PLUGIN_STATE_WIDGET_PLUGIN_H_
#define FLUTTER_PLUGIN_STATE_WIDGET_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace state_widget {

class StateWidgetPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  StateWidgetPlugin();

  virtual ~StateWidgetPlugin();

  // Disallow copy and assign.
  StateWidgetPlugin(const StateWidgetPlugin&) = delete;
  StateWidgetPlugin& operator=(const StateWidgetPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace state_widget

#endif  // FLUTTER_PLUGIN_STATE_WIDGET_PLUGIN_H_
