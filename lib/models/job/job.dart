import 'package:trade_emp_mobile/models/common/pagination_model.dart';

class JobList {
  bool? success;
  Data? data;

  JobList({this.success, this.data});

  JobList.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['data'] = data;
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
  String? employerId;
  String? employeeId;
  String? status;
  String? category;
  String? title;
  String? description;
  Location? location;
  List<Images>? images;
  List<Faqs>? faqs;

  Items(
      {this.id,
      this.employerId,
      this.employeeId,
      this.status,
      this.category,
      this.title,
      this.description,
      this.location,
      this.images,
      this.faqs});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    employerId = json['employerId'];
    employeeId = json['employeeId'];
    status = json['status'];
    category = json['category'];
    title = json['title'];
    description = json['description'];
    location = json['location'] != null
        ? Location.fromJson(json['location'])
        : null;
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    if (json['faqs'] != null) {
      faqs = <Faqs>[];
      json['faqs'].forEach((v) {
        faqs!.add(Faqs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['employerId'] = employerId;
    data['employeeId'] = employeeId;
    data['status'] = status;
    data['category'] = category;
    data['title'] = title;
    data['description'] = description;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    if (faqs != null) {
      data['faqs'] = faqs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Location {
  String? type;
  String? latitude;
  String? longitude;

  Location({this.type, this.latitude, this.longitude});

  Location.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}

class Images {
  String? id;
  String? name;
  String? type;
  String? url;
  double? size;
  String? uploadedAt;

  Images(Images item, {this.id, this.name, this.type, this.url, this.size, this.uploadedAt});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    url = json['url'];
    size = json['size'];
    uploadedAt = json['uploadedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['url'] = url;
    data['size'] = size;
    data['uploadedAt'] = uploadedAt;
    return data;
  }
}

class Faqs {
  String? id;
  String? question;
  String? answer;

  Faqs({this.id, this.question, this.answer});

  Faqs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question'] = question;
    data['answer'] = answer;
    return data;
  }
}

class JobListRequestModel {
  String? page;
  String? pageSize;
  String? category;
  String? status;
  String? title;
  String? location;
  String? employerId;

  JobListRequestModel(
      {this.page,
      this.pageSize,
      this.category,
      this.status,
      this.title,
      this.location,
      this.employerId});

  Map<String?, dynamic> toJson() {
    Map<String?, dynamic> map = {
      page: page,
      pageSize: pageSize,
      category: category,
      status: status,
      title: title,
      location: location,
      employerId: employerId
    };

    return map;
  }
}
