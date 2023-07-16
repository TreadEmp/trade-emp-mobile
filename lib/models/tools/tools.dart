import 'package:trade_emp_mobile/models/common/pagination_model.dart';

class ToolsListResponseModel {
  bool? success;
  Data? data;

  ToolsListResponseModel({this.success, this.data});

  ToolsListResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Pagination? pagination;
  List<Items>? items;

  Data({this.pagination, this.items});

  Data.fromJson(Map<String, dynamic> json) {
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class Items {
  String? id;
  String? name;
  String? category;
  String? description;

  Items({this.id, this.name, this.category, this.description});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['category'] = category;
    data['description'] = description;
    return data;
  }
}

class ToolListRequestModel {
  String? page;
  String? pageSize;
  String? name;
  String? category;

  ToolListRequestModel({this.page, this.pageSize, this.name, this.category});

  Map<String?, dynamic> toJson() {
    Map<String?, dynamic> map = {page: page, pageSize: pageSize, name: name, category: category};

    return map;
  }
}
