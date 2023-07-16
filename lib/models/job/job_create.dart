import 'package:trade_emp_mobile/models/job/job.dart' as job;

class JobCreateResponseModel {
  bool? success;
  Data? data;

  JobCreateResponseModel({this.success, this.data});

  JobCreateResponseModel.fromJson(Map<String, dynamic> json) {
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
  String? id;
  String? employerId;
  String? employeeId;
  String? status;
  String? category;
  String? title;
  String? description;
  Location? location;
  List<Faqs>? faqs;
  List<job.Images>? images;

  Data(
      {this.id,
      this.employerId,
      this.employeeId,
      this.status,
      this.category,
      this.title,
      this.description,
      this.location,
      this.faqs,
      this.images});

  Data.fromJson(Map<String, dynamic> json) {
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
    if (json['faqs'] != null) {
      faqs = <Faqs>[];
      json['faqs'].forEach((v) {
        faqs!.add(Faqs.fromJson(v));
      });
    }
    if (json['images'] != null) {
      images = <job.Images>[];
      json['images'].forEach((v) {
        images!.add(job.Images.fromJson(v));
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
    if (faqs != null) {
      data['faqs'] = faqs!.map((v) => v.toJson()).toList();
    }
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
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

class Faqs {
  String? question;
  String? answer;

  Faqs({this.question, this.answer});

  Faqs.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question'] = question;
    data['answer'] = answer;
    return data;
  }
}

// JobCreateRequestModel jobCreateRequestModelFromJson(String str) =>
//     JobCreateRequestModel.fromJson(json.decode(str));

// String jobCreateRequestModelToJson(JobCreateRequestModel data) =>
//     json.encode(data.toJson());

class JobCreateRequestModel {
  String? category;
  String? title;
  String? description;
  String? latitude;
  String? longitude;
  List<job.Images>? images;

  JobCreateRequestModel({
    this.category,
    this.title,
    this.description,
    this.latitude,
    this.longitude,
    this.images,
  });

  factory JobCreateRequestModel.fromJson(Map<String, dynamic> json) =>
      JobCreateRequestModel(
        category: json["category"],
        title: json["title"],
        description: json["description"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        images: List<job.Images>.from(
            json["images"].map((x) => job.Images.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "title": title,
        "description": description,
        "latitude": latitude,
        "longitude": longitude,
        "images": List<dynamic>.from(images!.map((x) => x.toJson())),
      };
}

class Images {
  String? id;
  String? name;
  String? type;
  String? url;
  String? size;
  String? uploadedAt;

  Images({
    this.id,
    this.name,
    this.type,
    this.url,
    this.size,
    this.uploadedAt,
  });
  factory Images.fromJson(Map<String, dynamic> json) => Images(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        url: json["url"],
        size: json["size"],
        uploadedAt: json["uploadedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "url": url,
        "size": size,
        "uploadedAt": uploadedAt,
      };
}
