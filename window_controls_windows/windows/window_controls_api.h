#ifndef WINDOW_CONTROLS_API_H
#define WINDOW_CONTROLS_API_H

#include "./window_controls_common.h"
#include "./window_controls.h"

namespace window_controls {

    typedef struct  _WCTLPrivateAPI{
        TDragAppWindow dragAppWindow;
    } WCTLPrivateAPI;

    typedef struct _WCTLPublicAPI {
        TIsWindowControlsLoaded isWindowControlsLoaded;
        TGetAppWindow getAppWindow;
        TSetWindowCanBeShown setWindowCanBeShown;
        TSetMinSize setMinSize;
        TSetMaxSize setMaxSize;
        TSetWindowCutOnMaximize setWindowCutOnMaximize;
        TIsDPIAware isDPIAware;
    } WCTLPublicAPI;

}

typedef struct _WCTLAPI {
    window_controls::WCTLPublicAPI* publicAPI;
    window_controls::WCTLPrivateAPI* privateAPI;
} WCTLAPI;

WCTL_EXPORT WCTLAPI * window_controls_api();
#endif