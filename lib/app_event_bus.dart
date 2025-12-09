import 'package:flutter/foundation.dart';

class AppEventBus {
  static final ValueNotifier<int> tabOneRefresh = ValueNotifier<int>(0);

  static void notifyTabOneRefresh() {
    tabOneRefresh.value++;
  }
}

