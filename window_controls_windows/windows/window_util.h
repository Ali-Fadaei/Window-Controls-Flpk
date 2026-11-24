#ifndef WINDOW_CONTROLS_UTIL_H_
#define WINDOW_CONTROLS_UTIL_H_

#define WM_WCTL_ACTION 0x7FFE

#define WCTL_SETWINDOWPOS        1
#define WCTL_SETWINDOWTEXT       2
#define WCTL_FORCECHILDREFRESH   3

typedef struct _SWPParam {
    int x;
    int y;
    int cx;
    int cy;
    UINT uFlags;
} SWPParam;

typedef struct _SWTParam {
    LPCWSTR text;
} SWTParam;

#endif /* WINDOW_CONTROLS_UTIL_H_ */ 
