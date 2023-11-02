/// 订单查询请求
class OrderReq {
  final int? page;
  final int? prePage;

  OrderReq({
    this.page,
    this.prePage,
  });

  Map<String, dynamic> toJson() => {
        'page': page ?? 1,
        'pre_page': prePage ?? 10,
      };
}
