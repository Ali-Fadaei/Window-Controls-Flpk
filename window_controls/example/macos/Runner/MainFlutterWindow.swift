import Cocoa
import FlutterMacOS
import window_controls_macos

class MainFlutterWindow: WindowControls {
    
  override func window_controls_configure() -> UInt {
    return WCTL_CUSTOM_FRAME | WCTL_HIDE_ON_STARTUP
  }
    
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController.init()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
  }
}
