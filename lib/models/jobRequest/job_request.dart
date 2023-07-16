import 'package:trade_emp_mobile/models/common/pagination_model.dart';

class JobRequestList {
  bool? success;
  Data? data;

  JobRequestList({this.success, this.data});

  JobRequestList.fromJson(Map<String, dynamic> json) {
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
  String? employerId;
  String? employeeId;
  bool? isActive;
  String? category;
  String? title;
  String? description;
  Location? location;
  List<Images>? images;
  List<Faqs>? faqs;
  List<Prices>? prices;

  Items(
      {this.id,
      this.employerId,
      this.employeeId,
      this.isActive,
      this.category,
      this.title,
      this.description,
      this.location,
      this.images,
      this.faqs,
      this.prices});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    employerId = json['employerId'];
    employeeId = json['employeeId'];
    isActive = json['isActive'];
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
    if (json['prices'] != null) {
      prices = <Prices>[];
      json['prices'].forEach((v) {
        prices!.add(Prices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['employerId'] = employerId;
    data['employeeId'] = employeeId;
    data['isActive        '] = isActive        ;
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
    if (prices != null) {
      data['prices'] = prices!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Location {
  String? type;
  Coordinates? coordinates;

  Location({this.type, this.coordinates});

  Location.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'] != null
        ? Coordinates.fromJson(json['coordinates'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (coordinates != null) {
      data['coordinates'] = coordinates!.toJson();
    }
    return data;
  }
}

class Coordinates {
  String? latitude;
  String? longitude;

  Coordinates({this.latitude, this.longitude});

  Coordinates.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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

  Images({this.id, this.name, this.type, this.url, this.size, this.uploadedAt});

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

class Prices {
  String? id;
  String? unitsOfMeasure;
  double? price;

  Prices({this.id, this.unitsOfMeasure, this.price});

  Prices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    unitsOfMeasure = json['unitsOfMeasure'];
    price =
        json['price'] != null ? json['price'].toDouble() : 0.0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['unitsOfMeasure'] = unitsOfMeasure;
    data['price'] = price;
    return data;
  }
}

class JobRequestListRequestModel {
  String? page;
  String? pageSize;
  String? category;
  String? isActive;
  String? title;
  String? location;
  String? employeeId;

  JobRequestListRequestModel(
      {this.page,
      this.pageSize,
      this.category,
      this.isActive,
      this.title,
      this.location,
      this.employeeId});

  Map<String?, dynamic> toJson() {
    Map<String?, dynamic> map = {
      page: page,
      pageSize: pageSize,
      category: category,
      isActive: isActive,
      title: title,
      location: location,
      employeeId: employeeId
    };

    return map;
  }
}
