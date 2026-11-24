import 'dart:ffi';
import 'package:ffi/ffi.dart';

final class WCTLRect extends Struct {
  @Double()
  external double left, top, right, bottom;
}

Pointer<WCTLRect> newWCTLRect() {
  final result = calloc<WCTLRect>();
  result.ref
    ..left = 0
    ..top = 0
    ..right = 0
    ..bottom = 0;
  return result;
}

final class WCTLScreenInfo extends Struct {
  external Pointer<WCTLRect> workingRect;
  external Pointer<WCTLRect> fullRect;
}

Pointer<WCTLScreenInfo> newWCTLScreenInfo() {
  final result = calloc<WCTLScreenInfo>();
  result.ref
    ..workingRect = newWCTLRect()
    ..fullRect = newWCTLRect();
  return result;
}

extension FreeWCTLScreenInfo on Pointer<WCTLScreenInfo> {
  void free() {
    calloc.free(this.ref.workingRect);
    calloc.free(this.ref.fullRect);
    calloc.free(this);
  }
}

final class WCTLOffset extends Struct {
  @Double()
  external double x, y;
}

Pointer<WCTLOffset> newWCTLOffset() {
  final result = calloc<WCTLOffset>();
  result.ref
    ..x = 0
    ..y = 0;
  return result;
}
