/// 评论查询请求
class ReviewReq {
  final int? page;
  final int? prePage;
  final int? product;

  ReviewReq({
    this.page,
    this.prePage,
    this.product,
  });

  Map<String, dynamic> toJson() => {
        'page': page ?? 1,
        'pre_page': prePage ?? 10,
        'product': product ?? 0,
      };
}
