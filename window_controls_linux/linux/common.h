#ifndef WINDOW_CONTROLS_COMMON
#define WINDOW_CONTROLS_COMMON

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


#endif