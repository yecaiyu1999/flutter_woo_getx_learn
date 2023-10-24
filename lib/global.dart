import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_woo_getx_learn/common/index.dart';

class Global {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    //工具类
    await Storage().init();

    Get.put<ConfigService>(ConfigService());
  }
}
