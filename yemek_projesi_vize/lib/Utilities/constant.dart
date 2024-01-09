import 'package:flutter/cupertino.dart';

class Utils {
  Size getScreenSize() {//ekran goruntu boyutunu alir
    return MediaQueryData.fromView(WidgetsBinding.instance.window).size;
  }
}
