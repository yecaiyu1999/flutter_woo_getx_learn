import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import 'package:flutter_woo_getx_learn/common/index.dart';

class Global {
  static Future<void> init() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    //工具类
    await Storage().init();
    Loading();

    //初始化服务
    Get.put<ConfigService>(ConfigService());
    Get.put<WPHttpService>(WPHttpService());
  }
}
