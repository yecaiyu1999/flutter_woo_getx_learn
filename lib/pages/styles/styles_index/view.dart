import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'package:flutter_woo_getx_learn/common/index.dart';

class StylesIndexPage extends GetView<StylesIndexController> {
  const StylesIndexPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return Column(children: [
      // 文本
      ListTile(
        onTap: () => Get.toNamed(RouteNames.stylesText),
        title: const Text("Text 文本"),
      ),
      //多语言
      ListTile(
        onTap: controller.onLanguageSelected,
        title: Text('语言：${ConfigService.to.locale.toLanguageTag()}'),
      ),
      //主题
      ListTile(
        onTap: controller.onThemeSelected,
        title: Text('主题：${ConfigService.to.isDarkModel ? 'dark' : 'light'}'),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StylesIndexController>(
      init: StylesIndexController(),
      id: "styles_index",
      builder: (_) {
        return Scaffold(
          // appBar: AppBar(title: const Text("styles_index")),
          appBar: AppBar(title: Text(LocaleKeys.stylesTitle.tr)),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
