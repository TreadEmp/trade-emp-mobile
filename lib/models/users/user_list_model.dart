import 'package:trade_emp_mobile/models/common/pagination_model.dart';

class UserListResponseModel {
  bool? success;
  Data? data;

  UserListResponseModel({this.success, this.data});

  UserListResponseModel.fromJson(Map<String, dynamic> json) {
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
  String? sId;
  String? firstName;
  String? lastName;
  String? role;
  String? email;
  bool? activated;
  int? disabled;

  Items(
      {this.sId,
      this.firstName,
      this.lastName,
      this.role,
      this.email,
      this.activated,
      this.disabled});

  Items.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    role = json['role'];
    email = json['email'];
    activated = json['activated'];
    disabled = json['disabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['role'] = role;
    data['email'] = email;
    data['activated'] = activated;
    data['disabled'] = disabled;
    return data;
  }
}

class UserListRequestModel {
  int? page;
  int? pageSize;

  UserListRequestModel({this.page, this.pageSize});

  Map<int?, dynamic> toJson() {
    Map<int?, dynamic> map = {page: page, pageSize: pageSize};

    return map;
  }
}
