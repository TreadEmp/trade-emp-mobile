import 'package:trade_emp_mobile/models/common/pagination_model.dart';

class JobCategoryList {
  bool? success;
  Data? data;

  JobCategoryList({this.success, this.data});

  JobCategoryList.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = data;
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
  String? category;
  String? description;
  Image? image;

  Items({this.id, this.category, this.description, this.image});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    description = json['description'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category'] = category;
    data['description'] = description;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    return data;
  }
}

class Image {
  String? id;
  String? name;
  String? type;
  String? url;
  String? uploadedAt;

  Image({this.id, this.name, this.type, this.url, this.uploadedAt});

  Image.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    url = json['url'];
    uploadedAt = json['uploadedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['url'] = url;
    data['uploadedAt'] = uploadedAt;
    return data;
  }
}

class JobCategoryListRequestModel {
  String? page;
  String? pageSize;
  String? category;

  JobCategoryListRequestModel({this.page, this.pageSize, this.category});

  Map<String?, dynamic> toJson() {
    Map<String?, dynamic> map = {
      page: page,
      pageSize: pageSize,
      category: category
    };

    return map;
  }
}
