#ifndef WINDOW_CONTROLS_API_H
#define WINDOW_CONTROLS_API_H

#include "./window_controls.h"
#include "./window_controls_common.h"

typedef struct _WCTLPublicAPI
{
    TGetAppWindow getAppWindow;
    TSetWindowCanBeShown setWindowCanBeShown;
    TSetInsideDoWhenWindowReady setInsideDoWhenWindowReady;
    TShowWindow showWindow;
    THideWindow hideWindow;
    TMoveWindow moveWindow;
    TSetSize setSize;
    TSetMinSize setMinSize;
    TSetMaxSize setMaxSize;
    TGetScreenInfoForWindow getScreenInfoForWindow;
    TSetPositionForWindow setPositionForWindow;
    TSetRectForWindow setRectForWindow;
    TGetRectForWindow getRectForWindow;
    TIsWindowMaximized isWindowVisible;
    TIsWindowMaximized isWindowMaximized;
    TMaximizeOrRestoreWindow maximizeOrRestoreWindow;
    TMaximizeWindow maximizeWindow;
    TMinimizeWindow minimizeWindow;
    TCloseWindow closeWindow;
    TSetWindowTitle setWindowTitle;
    TGetTitleBarHeight getTitleBarHeight;
} WCTLPublicAPI;

typedef struct _WCTLPrivateAPI{
    TWindowCanBeShown windowCanBeShown;
    TSetAppWindow setAppWindow;
    TAppWindowIsSet appWindowIsSet;
} WCTLPrivateAPI;

typedef struct _WCTLAPI{
    WCTLPublicAPI* publicAPI;
    WCTLPrivateAPI* privateAPI;
} WCTLAPI;

WCTL_EXPORT WCTLAPI* window_controls_api();

#endif /* WINDOW_CONTROLS_API_H */
