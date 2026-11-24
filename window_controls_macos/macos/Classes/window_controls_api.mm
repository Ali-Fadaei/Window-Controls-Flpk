#import "window_controls.h"
#import "window_controls_api.h"

WCTLPrivateAPI privateAPI = {
    windowCanBeShown,
    setAppWindow,
    appWindowIsSet,
};

WCTLPublicAPI publicAPI = {
    getAppWindow,
    setWindowCanBeShown,
    setInsideDoWhenWindowReady,
    showWindow,
    hideWindow,
    moveWindow,
    setSize,
    setMinSize,
    setMaxSize,
    getScreenInfoForWindow,
    setPositionForWindow,
    setRectForWindow,
    getRectForWindow,
    isWindowVisible,
    isWindowMaximized,
    maximizeOrRestoreWindow,
    maximizeWindow,
    minimizeWindow,
    closeWindow,
    setWindowTitle,
    getTitleBarHeight
};

WCTLAPI wctlAPI = {
    &publicAPI,
    &privateAPI,
};

WCTL_EXPORT WCTLAPI* window_controls_api(){
    return &wctlAPI;
}
