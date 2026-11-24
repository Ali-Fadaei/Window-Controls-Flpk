#ifndef WINDOW_CONTROLS_COMMON
#define WINDOW_CONTROLS_COMMON

typedef struct _WCTLRect {
    double left;
    double top;
    double right;
    double bottom;
} WCTLRect;

typedef struct _WCTLOffset {
    double x;
    double y;
} WCTLOffset;

typedef struct _WCTLScreenInfo {
    WCTLRect* workingRect;
    WCTLRect* fullRect;
} WCTLScreenInfo;

// 1-byte return status type
typedef signed char WCTLStatus;

#define WCTL_FAILED  0
#define WCTL_SUCCESS 1

#if defined(__cplusplus)
    #define WCTL_EXTERN extern "C" 
#else
    #define WCTL_EXTERN extern
#endif

#if !defined(WCTL_VISIBLE)
    #define WCTL_VISIBLE  __attribute__((visibility("default")))
#endif

#if !defined(WCTL_EXPORT)
    #define WCTL_EXPORT  WCTL_EXTERN WCTL_VISIBLE
#endif

#endif /* WINDOW_CONTROLS_COMMON */
