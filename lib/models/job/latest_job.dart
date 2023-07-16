import 'package:trade_emp_mobile/models/common/pagination_model.dart';

class RecentJobResponseModel {
  final bool? success;
  final Data? data;

  RecentJobResponseModel({this.success, this.data});

  // RecentJobResponseModel.fromJson(Map<String, dynamic> parsedJson) {
  //   success = json['success'];
  //   data = json['data'] != null ? Data.fromJson(json['data']) : null;
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['success'] = success;
  //   if (this.data != null) {
  //     data['data'] = this.data!.toJson();
  //   }
  //   return data;
  // }

  factory RecentJobResponseModel.fromJson(Map<String, dynamic> parsedJson) {
    return RecentJobResponseModel(
        success: parsedJson['success'],
        data: Data.fromJson(parsedJson['data']));
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
  String? status;
  String? employerId;
  String? employeeId;
  String? title;
  String? description;
  List<Faqs>? faqs;
  String? id;
  String? createdAt;
  Location? location;
  List<Images>? images;
  List<Reviews>? reviews;
  int? totalNoOfReviews;
  String? category;
  String? profileImage;
  String? firstName;
  String? lastName;
  double? overallRating;
  double? communication;
  double? serviceAsDescribed;
  double? recommend;
  double? completionOnTime;
  double? activeBids;

  Items(
      {this.status,
      this.employerId,
      this.employeeId,
      this.title,
      this.description,
      this.faqs,
      this.id,
      this.createdAt,
      this.location,
      this.images,
      this.reviews,
      this.totalNoOfReviews,
      this.category,
      this.profileImage,
      this.firstName,
      this.lastName,
      this.overallRating,
      this.communication,
      this.serviceAsDescribed,
      this.recommend,
      this.completionOnTime,
      this.activeBids});

  Items.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    employerId = json['employerId'];
    employeeId = json['employeeId'];
    title = json['title'];
    description = json['description'];
    if (json['faqs'] != null) {
      faqs = <Faqs>[];
      json['faqs'].forEach((v) {
        faqs!.add(Faqs.fromJson(v));
      });
    }
    id = json['id'];
    createdAt = json['createdAt'].toString();
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(Reviews.fromJson(v));
      });
    }
    totalNoOfReviews = json['totalNoOfReviews'];
    category = json['category'];
    profileImage = json['profileImage'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    overallRating =
        json['overallRating'] != null ? json['overallRating'].toDouble() : 0.0;
    communication =
        json['communication'] != null ? json['communication'].toDouble() : 0.0;
    serviceAsDescribed = json['serviceAsDescribed'] != null
        ? json['serviceAsDescribed'].toDouble()
        : 0.0;
    recommend = json['recommend'] != null ? json['recommend'].toDouble() : 0.0;
    completionOnTime = json['completionOnTime'] != null
        ? json['completionOnTime'].toDouble()
        : 0.0;
    activeBids =
        json['activeBids'] != null ? json['activeBids'].toDouble() : 0.0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['employerId'] = employerId;
    data['employeeId'] = employeeId;
    data['title'] = title;
    data['description'] = description;
    if (faqs != null) {
      data['faqs'] = faqs!.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
    data['createdAt'] = createdAt;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    data['totalNoOfReviews'] = totalNoOfReviews;
    data['category'] = category;
    data['profileImage'] = profileImage;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['overallRating'] = overallRating;
    data['communication'] = communication;
    data['serviceAsDescribed'] = serviceAsDescribed;
    data['recommend'] = recommend;
    data['completionOnTime'] = completionOnTime;
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

class Location {
  String? type;
  List<double>? coordinates;

  Location({this.type, this.coordinates});

  Location.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['coordinates'] != null) {
      coordinates = <double>[];
      json['coordinates'].forEach((v) {
        coordinates!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (coordinates != null) {
      data['coordinates'] = coordinates!.map((v) => v).toList();
    }
    return data;
  }
}

// class Coordinates {
//   double? latitude;
//   double? longitude;

//   Coordinates({this.latitude, this.longitude});

//   Coordinates.fromJson(Map<String, dynamic> json) {
//     latitude = json['latitude'];
//     longitude = json['longitude'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['latitude'] = latitude;
//     data['longitude'] = longitude;
//     return data;
//   }
// }

class Images {
  String? id;
  String? name;
  String? type;
  String? uploadedAt;
  String? url;

  Images({this.id, this.name, this.type, this.uploadedAt, this.url});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    uploadedAt = json['uploadedAt'].toString();
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['uploadedAt'] = uploadedAt;
    data['url'] = url;
    return data;
  }
}

class Reviews {
  double? communication;
  double? completionOnTime;
  String? createdAt;
  List<Images>? images;
  double? rating;
  double? recommend;
  String? review;
  double? serviceAsDescribed;
  Reviewer? reviewer;

  Reviews(
      {this.communication,
      this.completionOnTime,
      this.createdAt,
      this.images,
      this.rating,
      this.recommend,
      this.review,
      this.serviceAsDescribed,
      this.reviewer});

  Reviews.fromJson(Map<String, dynamic> json) {
    communication =
        json['communication'] != null ? json['communication'].toDouble() : 0.0;
    completionOnTime = json['completionOnTime'] != null
        ? json['completionOnTime'].toDouble()
        : 0.0;
    createdAt = json['createdAt'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    rating = json['rating'] != null ? json['rating'].toDouble() : 0.0;
    recommend = json['recommend'] != null ? json['recommend'].toDouble() : 0.0;
    review = json['review'];
    serviceAsDescribed = json['serviceAsDescribed'] != null
        ? json['serviceAsDescribed'].toDouble()
        : 0.0;
    reviewer =
        json['reviewer'] != null ? Reviewer.fromJson(json['reviewer']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['communication'] = communication;
    data['completionOnTime'] = completionOnTime;
    data['createdAt'] = createdAt;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['rating'] = rating;
    data['recommend'] = recommend;
    data['review'] = review;
    data['serviceAsDescribed'] = serviceAsDescribed;
    if (reviewer != null) {
      data['reviewer'] = reviewer!.toJson();
    }
    return data;
  }
}

class Reviewer {
  String? firstName;
  String? lastName;
  String? profileImage;
  String? city;
  String? country;

  Reviewer(
      {this.firstName,
      this.lastName,
      this.profileImage,
      this.city,
      this.country});

  Reviewer.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    profileImage = json['profileImage'];
    city = json['city'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['profileImage'] = profileImage;
    data['city'] = city;
    data['country'] = country;
    return data;
  }
}

class RecentJobListRequestModel {
  String? page;
  String? pageSize;
  String? category;
  String? status;
  String? title;
  String? location;
  String? employerId;

  RecentJobListRequestModel(
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
