import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:flutter_woo_getx_learn/common/index.dart';

class HomePlaceholdWidget extends StatelessWidget {
  const HomePlaceholdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return [
      _buildBannerView(context),
      _buildCategoriesView(context),
      _buildListTitle(context),
      _buildFlashSellView(context),
      _buildListTitle(context),
      _buildNewSellView(context),
    ].toListView().marginSymmetric(horizontal: AppSpace.page);
  }

  // banner
  Widget _buildBannerView(BuildContext context) {
    return SkeletonWidget(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.image),
          color: Colors.grey,
        ),
      ),
    ).height(190.w);
  }

  // 菜单
  Widget _buildCategoriesView(context) {
    var w = (MediaQuery.of(context).size.width -
            (AppSpace.page * 2) -
            (AppSpace.listItem * 6)) /
        6;
    var h = w;
    return SkeletonWidget(
      child: [
        for (var i = 0; i < 7; i++)
          [
            Container(
              width: w,
              height: h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppRadius.card),
                color: Colors.grey,
              ),
            ),
            Container(
              width: w,
              height: 12.sp,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppRadius.card),
                color: Colors.grey,
              ),
            ),
          ]
              .toColumn(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              )
              .paddingVertical(AppSpace.button)
              .paddingRight(AppSpace.listItem)
      ].toListView(
        scrollDirection: Axis.horizontal,
      ),
    ).height(90.w).marginSymmetric(vertical: AppSpace.listRow);
  }

  // 热卖商品
  Widget _buildFlashSellView(context) {
    return SkeletonWidget(
      child: [
        for (var i = 0; i < 3; i++)
          Container(
            width: (MediaQuery.of(context).size.width -
                    (AppSpace.page * 2) -
                    (AppSpace.listItem * 3)) /
                3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadius.card),
              color: Colors.grey,
            ),
          ).paddingRight(AppSpace.listItem)
      ].toRow().height(170.w),
    ).marginSymmetric(vertical: AppSpace.listRow);
  }

  // 新上商品
  Widget _buildNewSellView(context) {
    return SkeletonWidget(
      child: [
        for (var i = 0; i < 2; i++)
          Container(
            width: (MediaQuery.of(context).size.width -
                    (AppSpace.page * 2) -
                    (AppSpace.listItem * 2)) /
                2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadius.card),
              color: Colors.grey,
            ),
          ).paddingRight(AppSpace.listItem)
      ].toRow().height(170.w),
    ).marginSymmetric(vertical: AppSpace.listRow);
  }

  // 标题
  Widget _buildListTitle(context) {
    return SkeletonWidget(
      child: [
        Container(
          height: 24.sp,
          width: 120.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.card),
            color: Colors.grey,
          ),
        ),
        Container(
          height: 15.sp,
          width: 60.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.card),
            color: Colors.grey,
          ),
        )
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
    ).marginSymmetric(vertical: AppSpace.listRow);
  }
}
