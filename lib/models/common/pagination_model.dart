class Pagination {
  int? pages;
  int? pageSize;
  int? items;
  int? currentPage;

  Pagination({this.pages, this.pageSize, this.items, this.currentPage});

  Pagination.fromJson(Map<String, dynamic> json) {
    pages = json['pages'];
    pageSize = json['pageSize'];
    items = json['items'];
    currentPage = json['currentPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pages'] = pages;
    data['pageSize'] = pageSize;
    data['items'] = items;
    data['currentPage'] = currentPage;
    return data;
  }
}
