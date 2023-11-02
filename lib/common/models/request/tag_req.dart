/// tags查询请求
class TagReq {
  final int? page;
  final int? prePage;
  final String? search;
  final String? slug;

  TagReq({
    this.page,
    this.prePage,
    this.search,
    this.slug,
  });

  Map<String, dynamic> toJson() => {
        'page': page ?? 1,
        'pre_page': prePage ?? 10,
        'search': search ?? "",
        'slug': slug ?? "",
      };
}
