#ifndef _WCTL_API_
#define _WCTL_API_

#include "./common.h"
#include "./api_impl.h"

typedef GtkWindow* (*TGetAppWindowHandle)();
GtkWindow* getAppWindowHandle();

namespace window_controls {

typedef struct _WCTLAPI {
    TGetAppWindowHandle getAppWindowHandle;
    TGetScreenRect getScreenRect;
    TGetScaleFactor getScaleFactor;
    TGetPosition getPosition;
    TSetPosition setPosition;
    TGetSize getSize;
    TSetSize setSize;
    TSetRect setRect;
    TSetMinSize setMinSize;
    TSetMaxSize setMaxSize;
    TShowWindow showWindow;
    THideWindow hideWindow;
    TMinimizeWindow minimizeWindow;
    TMaximizeWindow maximizeWindow;
    TUnmaximizeWindow unmaximizeWindow;
    TSetWindowTitle setWindowTitle;
} WCTLAPI;

}  // namespace window_controls

WCTL_EXPORT window_controls::WCTLAPI* window_controls_api();

#endif // _WCTL_API_