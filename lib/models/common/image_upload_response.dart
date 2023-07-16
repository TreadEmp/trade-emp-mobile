import 'package:trade_emp_mobile/models/job/job.dart';

class ImageUploadResponseModel {
  bool? success;
  List<Images>? data;

  ImageUploadResponseModel({this.success, this.data});

  ImageUploadResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Images>[];
      json['data'].forEach((v) {
        data!.add(Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// class Data {
//   String? id;
//   String? name;
//   String? type;
//   String? uploadedAt;
//   double? size;
//   String? url;

//   Data({this.id, this.name, this.type, this.uploadedAt, this.size, this.url});

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     type = json['type'];
//     uploadedAt = json['uploadedAt'];
//     size = json['size'];
//     url = json['url'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['type'] = this.type;
//     data['uploadedAt'] = this.uploadedAt;
//     data['size'] = this.size;
//     data['url'] = this.url;
//     return data;
//   }
// }
