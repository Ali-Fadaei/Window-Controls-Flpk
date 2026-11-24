#ifndef WINDOW_CONTROLS_H_
#define WINDOW_CONTROLS_H_
#include <windows.h>

namespace window_controls {
    typedef bool (*TIsWindowControlsLoaded)();
    bool isWindowControlsLoaded();
    
    typedef void (*TSetWindowCanBeShown)(bool);
    void setWindowCanBeShown(bool value);

    typedef bool (*TDragAppWindow)();
    bool dragAppWindow();

    typedef HWND (*TGetAppWindow)();
    HWND getAppWindow();

    typedef void (*TSetMinSize)(int, int);
    void setMinSize(int width, int height);

    typedef void (*TSetMaxSize)(int, int);
    void setMaxSize(int width, int height);

    typedef void (*TSetWindowCutOnMaximize)(int);
    void setWindowCutOnMaximize(int value);
    
    typedef bool (*TIsDPIAware)();
    bool isDPIAware();
}
#endif