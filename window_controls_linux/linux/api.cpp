#include "./api.h"

namespace window_controls {

WCTLAPI _theAPI = {
    getAppWindowHandle,
    getScreenRect,
    getScaleFactor,
    getPosition,
    setPosition,
    getSize,
    setSize,
    setRect,
    setMinSize,
    setMaxSize,
    showWindow,
    hideWindow,
    minimizeWindow,
    maximizeWindow,
    unmaximizeWindow,
    setWindowTitle
};

} // namespace window_controls

WCTL_EXPORT window_controls::WCTLAPI* window_controls_api() {
    return &window_controls::_theAPI;
}