#include "include/window_controls_windows/window_controls_plugin.h"

// This must be included before many other Windows headers.
#include <windows.h>

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>
#include <flutter/standard_method_codec.h>

#include <map>
#include <memory>
#include <sstream>

#include "./window_controls_api.h"

const char kChannelName[] = "window_controls";
const auto wctlAPI = window_controls_api();

std::unique_ptr<flutter::MethodChannel<>> window_controls_channel;

namespace
{

    class WindowControlsPlugin : public flutter::Plugin
    {
    public:
        static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

        WindowControlsPlugin(
            flutter::PluginRegistrarWindows *registrar,
            std::unique_ptr<flutter::MethodChannel<flutter::EncodableValue>> channel);

        virtual ~WindowControlsPlugin();

    private:
        // Called when a method is called on this plugin's channel from Dart.
        void HandleMethodCall(
            const flutter::MethodCall<flutter::EncodableValue> &method_call,
            std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);

        // The registrar for this plugin.
        flutter::PluginRegistrarWindows *registrar_;

        // The cannel to send menu item activations on.
        std::unique_ptr<flutter::MethodChannel<>> channel_;
    };

    // static
    void WindowControlsPlugin::RegisterWithRegistrar(
        flutter::PluginRegistrarWindows *registrar)
    {
        auto channel =
            std::make_unique<flutter::MethodChannel<flutter::EncodableValue>>(
                registrar->messenger(), kChannelName,
                &flutter::StandardMethodCodec::GetInstance());

        auto *channel_pointer = channel.get();

        auto plugin = std::make_unique<WindowControlsPlugin>(registrar, std::move(channel));

        channel_pointer->SetMethodCallHandler(
            [plugin_pointer = plugin.get()](const auto &call, auto result) {
                plugin_pointer->HandleMethodCall(call, std::move(result));
            });

        registrar->AddPlugin(std::move(plugin));
    }

    WindowControlsPlugin::WindowControlsPlugin(
        flutter::PluginRegistrarWindows *registrar,
        std::unique_ptr<flutter::MethodChannel<flutter::EncodableValue>> channel) : registrar_(registrar), channel_(std::move(channel))
    {
    }

    WindowControlsPlugin::~WindowControlsPlugin()
    {
    }

    void WindowControlsPlugin::HandleMethodCall(
        const flutter::MethodCall<flutter::EncodableValue> &method_call,
        std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
    {        
        if (method_call.method_name().compare("dragAppWindow") == 0)
        {
            bool callResult = wctlAPI->privateAPI->dragAppWindow();
            if (callResult) {
                result->Success();
            } else {
                result->Error("ERROR_DRAG_APP_WINDOW_FAILED","Could not drag app window");
            }
        }
        else
        {
            result->NotImplemented();
        }
    }

} // namespace

void WindowControlsPluginRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar)
{
    WindowControlsPlugin::RegisterWithRegistrar(
        flutter::PluginRegistrarManager::GetInstance()
            ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
