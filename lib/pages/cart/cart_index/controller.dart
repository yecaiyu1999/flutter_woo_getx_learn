import 'package:flutter_woo_getx_learn/common/index.dart';
import 'package:get/get.dart';

class CartIndexController extends GetxController {
  CartIndexController();

  // 优惠券代码
  String couponCode = '';
  // 商品是否选中
  List<int> selectedIds = [];
  // 是否全选
  bool get isSelectedAll => CartService.to.lineItems.isEmpty
      ? false
      : CartService.to.lineItems.length == selectedIds.length;

  _initData() {
    update(["cart_index"]);
  }

  // 是否选中
  bool isSelected(int productId) {
    return selectedIds.any((val) => val == productId);
  }

  // 全选
  void onSelectAll(bool isSelected) {
    if (isSelected) {
      // 全选
      selectedIds =
          CartService.to.lineItems.map((item) => item.productId!).toList();
    } else {
      // 全不选
      selectedIds.clear();
    }
    update(["cart_index"]);
  }

  // 选中
  void onSelect(int productId, bool isSelected) {
    if (isSelected) {
      // 全选
      selectedIds.add(productId);
    } else {
      // 全不选
      selectedIds.remove(productId);
    }
    update(["cart_index"]);
  }

  // 删除购物车订单
  Future<void> onOrderCancel() async {
    for (var i = 0; i < selectedIds.length; i++) {
      int productId = selectedIds[i];
      CartService.to.cancelOrder(productId);
    }
    selectedIds.clear();
    update(["cart_index"]);
  }

  // 应用优惠券, 568935ab
  Future<void> onApplyCoupon() async {
    if (couponCode.isEmpty) {
      Loading.error("优惠券代码为空");
      return;
    }
    CouponsModel? coupon = await CouponApi.couponDetail(couponCode);
    if (coupon != null) {
      couponCode = "";
      bool isSuccess = CartService.to.applyCoupon(coupon);
      if (isSuccess) {
        Loading.success("优惠券使用成功");
      } else {
        Loading.error("该优惠券已被使用");
      }
      update(["cart_index"]);
    } else {
      Loading.error("优惠券无效");
    }
  }

  // 修改订单数量
  Future<void> onChangeQuantity(LineItem item, int quantity) async {
    CartService.to.changeQuantity(item.productId!, quantity);
    update(["cart_index"]);
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
