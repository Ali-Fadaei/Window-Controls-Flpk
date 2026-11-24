import Cocoa
import FlutterMacOS

public class WindowControlsPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "window_controls", binaryMessenger: registrar.messenger)
    let instance = WindowControlsPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {    
    switch call.method {
    /*
     // TODO: implement this for channel methods
     case "getAppWindow":
        getAppWindow(call, result)
    */
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
