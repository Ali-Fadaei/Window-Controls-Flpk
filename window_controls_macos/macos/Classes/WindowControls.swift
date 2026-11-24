import Cocoa

let wctlAPI = window_controls_api().pointee;
let wctlPrivateAPI = wctlAPI.privateAPI.pointee;
let wctlPublicAPI = wctlAPI.publicAPI.pointee;

public let WCTL_CUSTOM_FRAME: UInt = 0x1
public let WCTL_HIDE_ON_STARTUP: UInt = 0x2

open class WindowControls: NSWindow {
  
  override public var canBecomeKey: Bool {
    get {
      return true
    }
  }
  open func window_controls_configure() -> UInt {
    return 0
  }
  override init(
    contentRect: NSRect, styleMask style: NSWindow.StyleMask,
    backing backingStoreType: NSWindow.BackingStoreType, defer flag: Bool
  ) {
    super.init(contentRect: contentRect, styleMask: style, backing: backingStoreType, defer: flag)

  }
  override public func order(_ place: NSWindow.OrderingMode, relativeTo otherWin: Int) {
    if (!wctlPrivateAPI.appWindowIsSet())
    {
        wctlPrivateAPI.setAppWindow(self);
    }
    let flags = self.window_controls_configure()

    let hideOnStartup:Bool = ((flags & WCTL_HIDE_ON_STARTUP) != 0);
    let hasCustomFrame:Bool = ((flags & WCTL_CUSTOM_FRAME) != 0);

    var localStyle = self.styleMask;
    if hasCustomFrame {
        localStyle.insert(.fullSizeContentView)
        self.styleMask = localStyle;
        self.titlebarAppearsTransparent = true
        self.titleVisibility = .hidden
        self.isOpaque = false
        self.isMovable = false
    }
    super.order(place, relativeTo: otherWin)
    let windowCanBeShown: Bool = wctlPrivateAPI.windowCanBeShown();
    if (!(windowCanBeShown) && hideOnStartup && self.isVisible) {
        self.setIsVisible(false)
    }
  }
}
