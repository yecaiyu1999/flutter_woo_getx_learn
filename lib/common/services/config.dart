import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

//配置服务
class ConfigService extends GetxService {
  //这是一个单例写法
  static ConfigService get to => Get.find();

  PackageInfo? _platform;
  String get version => _platform?.version ?? '-';

  Future<void> _getPlatform() async {
    _platform = await PackageInfo.fromPlatform();
  }

//初始化
  @override
  void onReady() {
    super.onReady();
    _getPlatform();
  }
}
