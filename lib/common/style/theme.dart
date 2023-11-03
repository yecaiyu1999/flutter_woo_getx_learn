import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'index.dart';

/// 主题
class AppTheme {
  /// 亮色
  static ThemeData light = ThemeData(
    useMaterial3: false,
    colorScheme: lightColorScheme,
    extensions: const <ThemeExtension<dynamic>>[
      ExtBaseColorTheme.light,
      ExtWooColorTheme.light,
    ],
    fontFamily: "Montserrat",
    appBarTheme: const AppBarTheme(
      // appBar 暗色 , 和主题色相反
      systemOverlayStyle: SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xFFFeFBFF),
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
      // 背景透明
      // backgroundColor: Colors.transparent,
      // 取消阴影
      elevation: 0,
      // 图标样式
      iconTheme: IconThemeData(
        color: Color(0xFF5F84FF),
      ),
      // 标题
      titleTextStyle: TextStyle(
        color: Color(0xFF4D4D4D),
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
    ),
  );

  /// 暗色
  static ThemeData dark = ThemeData(
    useMaterial3: false,
    colorScheme: darkColorScheme,
    extensions: const <ThemeExtension<dynamic>>[
      ExtBaseColorTheme.dark,
      ExtWooColorTheme.dark,
    ],
    fontFamily: "Montserrat",
    appBarTheme: const AppBarTheme(
      // 取消阴影
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xFF1C1C1C),
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ), // appBar 亮色 , 和主题色相反
    ),
  );
}
