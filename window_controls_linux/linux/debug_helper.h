#ifndef _WCTL_DEBUG_HELPER_
#define _WCTL_DEBUG_HELPER_

#include <gtk/gtk.h>

namespace window_controls {

void printWindowStateMask(const char *description, GdkWindowState state);
void printGdkEvent(const char *description, GdkEventType state);

}  // namespace window_controls

#endif  //_WCTL_DEBUG_HELPER_