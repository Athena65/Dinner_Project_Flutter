import 'package:flutter/cupertino.dart';

class Utils {
  Size getScreenSize() {
    return MediaQueryData.fromView(WidgetsBinding.instance.window).size;

  }
}
