import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'common/index.dart';
import 'global.dart';

Future<void> main() async {
  await Global.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896), // 设计稿中设备的尺寸(单位随意,建议dp,但在使用过程中必须保持一致)
      splitScreenMode: false, // 支持分屏尺寸
      minTextAdapt: false, // 是否根据宽度/高度中的最小值适配文字
      // 一般返回一个MaterialApp类型的Function()
      builder: (context, child) {
        return RefreshConfiguration(
          headerBuilder: () => const ClassicHeader(
            idleText: '下拉刷新',
            releaseText: '松开开始刷新',
            refreshingText: '正在刷新...',
            completeText: '刷新成功',
            failedText: '刷新失败',
          ), // 自定义刷新头部
          footerBuilder: () => const ClassicFooter(), // 自定义刷新尾部
          hideFooterWhenNotFull: true, // 当列表不满一页时，是否隐藏刷新尾部
          headerTriggerDistance: 80, // 触发刷新的距离
          maxOverScrollExtent: 100, // 最大拖动距离
          footerTriggerDistance: 150, // 触发加载的距离
          child: GetMaterialApp(
            title: 'Woo',

            // 主题样式
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            // 主题
            themeMode:
                ConfigService.to.isDarkModel ? ThemeMode.dark : ThemeMode.light,

            // 路由
            initialRoute: RouteNames.systemSplash,
            getPages: RoutePages.list,
            navigatorObservers: [RoutePages.observer],

            // 多语言
            translations: Translation(), // 词典
            localizationsDelegates: Translation.localizationsDelegates, // 代理
            supportedLocales: Translation.supportedLocales, // 支持的语言种类
            locale: ConfigService.to.locale, // 当前语言种类
            fallbackLocale: Translation.fallbackLocale, // 默认语言种类

            builder: (context, widget) {
              widget = EasyLoading.init()(context, widget); // EasyLoading 初始化

              // 不随系统字体缩放比例
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: widget,
              );
            },

            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
