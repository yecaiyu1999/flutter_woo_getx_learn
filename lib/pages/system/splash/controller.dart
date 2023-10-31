import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_woo_getx_learn/common/index.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  SplashController();

  _initData() {
    update(["splash"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    //删除原生启动图
    FlutterNativeSplash.remove();
    _jumpToPage(); // 跳转界面
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  _jumpToPage() {
    //样式配置
    if (ConfigService.to.isAlreadyOpen == false) {
      Get.offAllNamed(RouteNames.systemWelcome);
    } else {
      Get.offAllNamed(RouteNames.main);
    }

    // 欢迎页
    // Future.delayed(const Duration(seconds: 1), () {
    //   Get.offAllNamed(RouteNames.systemWelcome);
    // });
  }
}
