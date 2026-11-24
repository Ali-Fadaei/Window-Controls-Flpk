import 'dart:ffi';
import 'package:win32/win32.dart';
import 'package:ffi/ffi.dart';

const WM_WCTL_ACTION = 0x7FFE;

const WCTL_SETWINDOWPOS = 1;
const WCTL_SETWINDOWTEXT = 2;
const WCTL_FORCECHILDREFRESH = 3;

HWND hWndFromInt(int hWnd) => HWND(Pointer.fromAddress(hWnd));

final class SWPParam extends Struct {
  @Int32()
  external int x, y, cx, cy, uFlags;
}

void setWindowPos(
    int hWnd, int hWndInsertAfter, int x, int y, int cx, int cy, int uFlags) {
  final param = calloc<SWPParam>();
  param.ref
    ..x = x
    ..y = y
    ..cx = cx
    ..cy = cy
    ..uFlags = uFlags;
  PostMessage(hWndFromInt(hWnd), WM_WCTL_ACTION, WPARAM(WCTL_SETWINDOWPOS),
      LPARAM(param.address));
}

final class SWTParam extends Struct {
  external Pointer<Utf16> text;
}

void setWindowText(int hWnd, String text) {
  final param = calloc<SWTParam>();
  param.ref.text = text.toNativeUtf16();
  PostMessage(hWndFromInt(hWnd), WM_WCTL_ACTION, WPARAM(WCTL_SETWINDOWTEXT),
      LPARAM(param.address));
}

void forceChildRefresh(int hWnd) {
  PostMessage(hWndFromInt(hWnd), WM_WCTL_ACTION, WPARAM(WCTL_FORCECHILDREFRESH),
      LPARAM(0));
}
