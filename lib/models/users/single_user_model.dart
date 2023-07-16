class SingleUserModel {
  bool? success;
  Data? data;

  SingleUserModel({this.success, this.data});

  SingleUserModel.fromJson(Map<String, dynamic> json) {
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
  String? userId;
  String? firstName;
  String? lastName;
  ProfileImage? profileImage;
  String? role;
  String? email;
  bool? activated;
  bool? isAvailable;
  List<String>? availability;
  List<String?>? preferredJobCategories;
  int? disabled;
  Address? address;
  Contacts? contacts;
  List<Experiences>? experiences;
  List<Equipments>? equipments;

  Data(
      {this.userId,
      this.firstName,
      this.lastName,
      this.profileImage,
      this.role,
      this.email,
      this.activated,
      this.isAvailable,
      this.availability,
      this.preferredJobCategories,
      this.disabled,
      this.address,
      this.contacts,
      this.experiences,
      this.equipments});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    profileImage = json['profileImage'] != null
        ? ProfileImage.fromJson(json['profileImage'])
        : null;
    role = json['role'];
    email = json['email'];
    activated = json['activated'];
    isAvailable = json['isAvailable'];
    availability = json['availability'].cast<String>();
    preferredJobCategories = json['preferredJobCategories'].cast<String>();
    disabled = json['disabled'];
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    contacts = json['contacts'] != null
        ? Contacts.fromJson(json['contacts'])
        : null;
    if (json['experiences'] != null) {
      experiences = <Experiences>[];
      json['experiences'].forEach((v) {
        experiences!.add(Experiences.fromJson(v));
      });
    }
    if (json['equipments'] != null) {
      equipments = <Equipments>[];
      json['equipments'].forEach((v) {
        equipments!.add(Equipments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    if (profileImage != null) {
      data['profileImage'] = profileImage!.toJson();
    }
    data['role'] = role;
    data['email'] = email;
    data['activated'] = activated;
    data['isAvailable'] = isAvailable;
    data['availability'] = availability;
    data['preferredJobCategories'] = preferredJobCategories;
    data['disabled'] = disabled;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    if (contacts != null) {
      data['contacts'] = contacts!.toJson();
    }
    if (experiences != null) {
      data['experiences'] = experiences!.map((v) => v.toJson()).toList();
    }
    if (equipments != null) {
      data['equipments'] = equipments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProfileImage {
  String? id;
  String? name;
  String? type;
  String? url;
  double? size;
  String? uploadedAt;

  ProfileImage(
      {this.id, this.name, this.type, this.url, this.size, this.uploadedAt});

  ProfileImage.fromJson(Map<String, dynamic> json) {
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

class Experiences {
  String? id;
  String? experience;
  String? timePeriod;

  Experiences({this.id, this.experience, this.timePeriod});

  Experiences.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    experience = json['experience'];
    timePeriod = json['timePeriod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['experience'] = experience;
    data['timePeriod'] = timePeriod;
    return data;
  }
}

class Equipments {
  String? id;
  String? equipmentName;
  String? yearsOfUsing;

  Equipments({this.id, this.equipmentName, this.yearsOfUsing});

  Equipments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    equipmentName = json['equipmentName'];
    yearsOfUsing = json['yearsOfUsing'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['equipmentName'] = equipmentName;
    data['yearsOfUsing'] = yearsOfUsing;
    return data;
  }
}
