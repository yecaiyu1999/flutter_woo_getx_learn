import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_getx_learn/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/index.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  // 定义 tag 值，唯一即可
  final String tag = '${Get.arguments['id'] ?? ''}${UniqueKey()}';

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // 实例传入 tag
    return _ProductDetailsViewGetX(tag);
  }
}

class _ProductDetailsViewGetX extends GetView<ProductDetailsController> {
  // 唯一 tag 变量
  final String uniqueTag;

  // 接收传入 tag 值
  const _ProductDetailsViewGetX(this.uniqueTag, {Key? key}) : super(key: key);

  // 重写 GetView 属性 tag
  @override
  String? get tag => uniqueTag;

  // 滚动图
  Widget _buildBanner() {
    return GetBuilder<ProductDetailsController>(
      id: 'product_banner',
      tag: tag,
      builder: (_) {
        return CarouselWidget(
          onTap: controller.onGalleryTap,
          //图片列表
          items: controller.bannerItems,
          // 当前索引
          currentIndex: controller.bannerCurrentIndex,
          // 切换回调
          onPageChanged: controller.onChangeBanner,
          // 高度
          height: 190.w,
          // 指示器圆点
          indicatorCircle: false,
          // 指示器位置
          indicatorAlignment: MainAxisAlignment.start,
          // 指示器颜色
          indicatorColor: AppColors.highlight,
        );
      },
    ).backgroundColor(AppColors.surfaceVariant);
  }

  // 商品标题
  Widget _buildTitle() {
    return <Widget>[
      // 金额、打分、喜欢
      <Widget>[
        // 金额
        TextWidget.title1(
          "\$${controller.product?.price ?? 0}",
        ).expanded(),
        // 打分
        const IconTextWidget(
          iconData: Icons.star,
          text: "4.5",
        ).paddingRight(AppSpace.iconTextMedium),
        // 喜欢
        const IconTextWidget(
          iconData: Icons.favorite,
          text: "100+",
        ),
      ].toRow(),

      // 次标题
      TextWidget.body1(
        controller.product?.shortDescription?.clearHtml ?? "-",
      ),
    ]
        .toColumn(
          // 左对齐
          crossAxisAlignment: CrossAxisAlignment.start,
          // 垂直间距
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        )
        .paddingAll(AppSpace.page);
  }

  // Tab 栏位按钮
  Widget _buildTabBarItem(String textString, int index) {
    return ButtonWidget.textFilled(
      textString,
      onTap: () => controller.onTapBarTap(index),
      borderRadius: 17,
      textColor: controller.tabIndex == index
          ? AppColors.onPrimary
          : AppColors.secondary,
      bgColor:
          controller.tabIndex == index ? AppColors.primary : Colors.transparent,
    ).tight(
      width: 100.w,
      height: 35.h,
    );
  }

  // Tab 栏位
  Widget _buildTabBar() {
    return GetBuilder<ProductDetailsController>(
      tag: tag,
      id: "product_tab",
      builder: (_) {
        return <Widget>[
          _buildTabBarItem(LocaleKeys.gDetailTabProduct.tr, 0),
          _buildTabBarItem(LocaleKeys.gDetailTabDetails.tr, 1),
          _buildTabBarItem(LocaleKeys.gDetailTabReviews.tr, 2),
        ].toRow(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
        );
      },
    );
  }

  // TabView 视图
  Widget _buildTabView() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 0.w, 20.w, 0.w),
        child: TabBarView(
          controller: controller.tabController,
          children: [
            // 规格
            TabProductView(uniqueTag: uniqueTag),
            // 详情
            TabDetailView(uniqueTag: uniqueTag),
            // 评论
            TabReviewsView(uniqueTag: uniqueTag),
          ],
        ),
      ),
    );
  }

  // 主视图
  Widget _buildView() {
    return controller.product == null
        ? const PlaceholdWidget() // 占位图
        : [
            // 滚动图
            _buildBanner(),
            // 商品标题
            _buildTitle(),
            // Tab 栏位
            _buildTabBar(),
            // TabView 视图
            _buildTabView(),
          ].toColumn();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsController>(
      init: ProductDetailsController(),
      id: "product_details",
      // 4 GetBuilder 属性 tag 设置
      tag: tag,
      builder: (_) {
        return Scaffold(
          // 导航
          appBar: mainAppBarWidget(
              titleString:
                  controller.product?.name ?? LocaleKeys.gDetailTitle.tr),
          // 内容
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
