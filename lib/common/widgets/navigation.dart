import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

/// 导航栏数据模型
class NavigationItemModel {
  final String label;
  final String icon;
  final Color activeColor;
  final int count;

  NavigationItemModel({
    required this.label,
    required this.icon,
    Color? activeColor,
    this.count = 0,
  }) : activeColor = activeColor ?? AppColors.primary;
}

/// 导航栏
class BuildNavigation extends StatelessWidget {
  final int currentIndex;
  final List<NavigationItemModel> items;
  final Function(int) onTap;

  const BuildNavigation({
    Key? key,
    required this.currentIndex,
    required this.items,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ws = <Widget>[];
    for (var i = 0; i < items.length; i++) {
      var color = (i == currentIndex) ? items[i].activeColor : null;
      var item = items[i];
      String? badgeString;
      if (item.count > 0) {
        badgeString = item.count > 99 ? '99' : item.count.toString();
      }

      ws.add(
        <Widget>[
          // 图标
          IconWidget.svg(
            item.icon,
            size: 20,
            color: color,
            badgeString: badgeString,
          ).paddingBottom(2),
          // 文字
          TextWidget.body1(
            item.label.tr,
            color: color,
          ),
        ]
            .toColumn(
              mainAxisAlignment: MainAxisAlignment.center, // 居中
              mainAxisSize: MainAxisSize.max, // 撑满
            )
            .onTap(() => onTap(i))
            .expanded(),
      );
    }
    return BottomAppBar(
      color: AppColors.surface,
      child: ws
          .toRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
          )
          .height(kBottomNavigationBarHeight),
    );
  }
}
