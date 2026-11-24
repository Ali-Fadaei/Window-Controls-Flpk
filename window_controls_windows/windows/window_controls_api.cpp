#include "window_controls_api.h"
#include "window_controls.h"
#include "window_controls_common.h"

namespace window_controls {
    WCTLPrivateAPI privateAPI = {
        dragAppWindow,
    };

    WCTLPublicAPI publicAPI = {
        isWindowControlsLoaded,
        getAppWindow,
        setWindowCanBeShown,
        setMinSize,
        setMaxSize,
        setWindowCutOnMaximize,
        isDPIAware,
    };
}

WCTLAPI wctlAPI = {
    &window_controls::publicAPI,
    &window_controls::privateAPI
};

WCTL_EXPORT WCTLAPI* window_controls_api(){
    return &wctlAPI;
}