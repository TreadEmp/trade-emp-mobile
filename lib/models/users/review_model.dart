import 'package:trade_emp_mobile/models/users/employee_full_profile_model.dart';

class Reviews {
  double? communication;
  double? completionOnTime;
  List<Images>? images;
  String? createdAt;
  double? rating;
  double? recommend;
  String? review;
  double? serviceAsDescribed;
  Reviewer? reviewer;

  Reviews(
      {this.communication,
      this.completionOnTime,
      this.images,
      this.createdAt,
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
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    rating = json['rating'] != null ? json['rating'].toDouble() : 0.0;
    recommend = json['recommend'] != null ? json['recommend'].toDouble() : 0.0;
    review = json['review'];
    serviceAsDescribed = json['serviceAsDescribed'] != null
        ? json['serviceAsDescribed'].toDouble()
        : 0.0;
    reviewer = json['reviewer'] != null
        ? Reviewer.fromJson(json['reviewer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['communication'] = communication;
    data['completionOnTime'] = completionOnTime;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = createdAt;
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