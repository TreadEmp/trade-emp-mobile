import 'package:trade_emp_mobile/models/users/review_model.dart';

class EmployeeFullProfileResponseModel {
  bool? success;
  Data? data;

  EmployeeFullProfileResponseModel({this.success, this.data});

  EmployeeFullProfileResponseModel.fromJson(Map<String, dynamic> json) {
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
  String? email;
  Address? address;
  Contacts? contacts;
  String? createdAt;
  String? firstName;
  String? lastName;
  String? role;
  String? userId;
  List<JobRequests>? jobRequests;
  List<Reviews>? reviews;
  int? totalNoOfReviews;
  String? profileImage;
  double? overallRating;
  double? communication;
  double? serviceAsDescribed;
  double? recommend;
  double? completionOnTime;

  Data(
      {this.email,
      this.address,
      this.contacts,
      this.createdAt,
      this.firstName,
      this.lastName,
      this.role,
      this.userId,
      this.jobRequests,
      this.reviews,
      this.totalNoOfReviews,
      this.profileImage,
      this.overallRating,
      this.communication,
      this.serviceAsDescribed,
      this.recommend,
      this.completionOnTime});

  Data.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    contacts = json['contacts'] != null
        ? Contacts.fromJson(json['contacts'])
        : null;
    createdAt = json['createdAt'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    role = json['role'];
    userId = json['userId'];
    if (json['jobRequests'] != null) {
      jobRequests = <JobRequests>[];
      json['jobRequests'].forEach((v) {
        jobRequests!.add(JobRequests.fromJson(v));
      });
    }
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(Reviews.fromJson(v));
      });
    }
    totalNoOfReviews = json['totalNoOfReviews'];
    profileImage = json['profileImage'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    if (contacts != null) {
      data['contacts'] = contacts!.toJson();
    }
    data['createdAt'] = createdAt;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['role'] = role;
    data['userId'] = userId;
    if (jobRequests != null) {
      data['jobrequests'] = jobRequests!.map((v) => v.toJson()).toList();
    }
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    data['totalNoOfReviews'] = totalNoOfReviews;
    data['profileImage'] = profileImage;
    data['overallRating'] = overallRating;
    data['communication'] = communication;
    data['serviceAsDescribed'] = serviceAsDescribed;
    data['recommend'] = recommend;
    data['completionOnTime'] = completionOnTime;
    return data;
  }
}

class Address {
  String? addressLine1;
  String? addressLine2;
  String? suburb;
  String? city;
  String? state;
  String? postalCode;
  String? country;
  String? latitude;
  String? longitude;

  Address(
      {this.addressLine1,
      this.addressLine2,
      this.suburb,
      this.city,
      this.state,
      this.postalCode,
      this.country,
      this.latitude,
      this.longitude});

  Address.fromJson(Map<String, dynamic> json) {
    addressLine1 = json['addressLine1'];
    addressLine2 = json['addressLine2'];
    suburb = json['suburb'];
    city = json['city'];
    state = json['state'];
    postalCode = json['postalCode'];
    country = json['country'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['addressLine1'] = addressLine1;
    data['addressLine2'] = addressLine2;
    data['suburb'] = suburb;
    data['city'] = city;
    data['state'] = state;
    data['postalCode'] = postalCode;
    data['country'] = country;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}

class Contacts {
  String? telephone;
  String? fax;
  String? mobile;

  Contacts({this.telephone, this.fax, this.mobile});

  Contacts.fromJson(Map<String, dynamic> json) {
    telephone = json['telephone'];
    fax = json['fax'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['telephone'] = telephone;
    data['fax'] = fax;
    data['mobile'] = mobile;
    return data;
  }
}

class JobRequests {
  String? category;
  String? title;
  String? description;
  List<Faqs>? faqs;
  List<Prices>? prices;
  String? id;
  List<Images>? images;

  JobRequests(
      {this.category,
      this.title,
      this.description,
      this.faqs,
      this.prices,
      this.id,
      this.images});

  JobRequests.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    title = json['title'];
    description = json['description'];
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
    id = json['id'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category'] = category;
    data['title'] = title;
    data['description'] = description;
    if (faqs != null) {
      data['faqs'] = faqs!.map((v) => v.toJson()).toList();
    }
    if (prices != null) {
      data['prices'] = prices!.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
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
  int? price;
  String? id;
  String? unitsOfMeasure;

  Prices({this.price, this.id, this.unitsOfMeasure});

  Prices.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    id = json['id'];
    unitsOfMeasure = json['unitsOfMeasure'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = price;
    data['id'] = id;
    data['unitsOfMeasure'] = unitsOfMeasure;
    return data;
  }
}

// class Reviews {
//   double communication;
//   double completionOnTime;
//   List<Images> images;
//   String createdAt;
//   double rating;
//   double recommend;
//   String review;
//   double serviceAsDescribed;
//   Reviewer reviewer;

//   Reviews(
//       {this.communication,
//       this.completionOnTime,
//       this.images,
//       this.createdAt,
//       this.rating,
//       this.recommend,
//       this.review,
//       this.serviceAsDescribed,
//       this.reviewer});

//   Reviews.fromJson(Map<String, dynamic> json) {
//     communication =
//         json['communication'] != null ? json['communication'].toDouble() : 0.0;
//     completionOnTime = json['completionOnTime'] != null
//         ? json['completionOnTime'].toDouble()
//         : 0.0;
//     if (json['images'] != null) {
//       images = new List<Images>();
//       json['images'].forEach((v) {
//         images.add(new Images.fromJson(v));
//       });
//     }
//     createdAt = json['createdAt'];
//     rating = json['rating'] != null ? json['rating'].toDouble() : 0.0;
//     recommend = json['recommend'] != null ? json['recommend'].toDouble() : 0.0;
//     review = json['review'];
//     serviceAsDescribed = json['serviceAsDescribed'] != null
//         ? json['serviceAsDescribed'].toDouble()
//         : 0.0;
//     reviewer = json['reviewer'] != null
//         ? new Reviewer.fromJson(json['reviewer'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['communication'] = this.communication;
//     data['completionOnTime'] = this.completionOnTime;
//     if (this.images != null) {
//       data['images'] = this.images.map((v) => v.toJson()).toList();
//     }
//     data['createdAt'] = this.createdAt;
//     data['rating'] = this.rating;
//     data['recommend'] = this.recommend;
//     data['review'] = this.review;
//     data['serviceAsDescribed'] = this.serviceAsDescribed;
//     if (this.reviewer != null) {
//       data['reviewer'] = this.reviewer.toJson();
//     }
//     return data;
//   }
// }

// class Reviewer {
//   String firstName;
//   String lastName;
//   String profileImage;
//   String city;
//   String country;

//   Reviewer(
//       {this.firstName,
//       this.lastName,
//       this.profileImage,
//       this.city,
//       this.country});

//   Reviewer.fromJson(Map<String, dynamic> json) {
//     firstName = json['firstName'];
//     lastName = json['lastName'];
//     profileImage = json['profileImage'];
//     city = json['city'];
//     country = json['country'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['firstName'] = this.firstName;
//     data['lastName'] = this.lastName;
//     data['profileImage'] = this.profileImage;
//     data['city'] = this.city;
//     data['country'] = this.country;
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
    uploadedAt = json['uploadedAt'];
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
