class UserModel {
  final String? firstName;
  final String? lastName;
  final Address? address;
  final Contacts? contacts;
  final bool? isAvailable;
  final List<String>? availability;
  final List<Experiences>? experiences;
  final List<Equipments>? equipments;

  UserModel( {
    this.firstName,
    this.lastName,
    this.address,
    this.contacts,
    this.isAvailable,
    this.availability,
    this.experiences,
    this.equipments,
  });

  factory UserModel.fromJson(Map<String, dynamic> parsedJson){
    var availabilityFromJson  = parsedJson['availability'];
    var experienceList = parsedJson['experiences'] as List;
    var equipmentList = parsedJson['experiences'] as List;

    List<String>? availabilityList = availabilityFromJson.cast<String>();
    List<Experiences> experiencesList = experienceList.map((i) => Experiences.fromJson(i)).toList();
    List<Equipments> equipmentsList = equipmentList.map((i) => Equipments.fromJson(i)).toList();
    return UserModel(
        firstName: parsedJson['firstName'],
        lastName: parsedJson['lastName'],
        address: Address.fromJson(parsedJson['address']),
        contacts: Contacts.fromJson(parsedJson['contacts']),
        isAvailable: parsedJson['isAvailable'],
        availability: availabilityList,
        experiences: experiencesList,
        equipments: equipmentsList
    );
  }
}

class Address {
  String? addressName;
  String? addressLine1;
  String? addressLine2;
  String? suburb;
  String? city;
  String? state;
  String? postalCode;
  String? country;
  String? latitude;
  String? longitude;

  Address({
    this.addressName,
    this.addressLine1,
    this.addressLine2,
    this.suburb,
    this.city,
    this.state,
    this.postalCode,
    this.country,
    this.latitude,
    this.longitude,
  });

  factory Address.fromJson(Map<String, dynamic> json){
    return Address(
      addressName: json['addressName'],
      addressLine1: json['addressLine1'],
      addressLine2: json['addressLine2'],
      suburb: json['suburb'],
      city: json['city'],
      state: json['state'],
      postalCode: json['postalCode'],
      country: json['country'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}

class Contacts {
  String? telephone;
  String? fax;
  String? mobile;

  Contacts({
    this.telephone,
    this.fax,
    this.mobile,
  });

  factory Contacts.fromJson(Map<String, dynamic> json){
    return Contacts(
      telephone: json['telephone'],
      fax: json['fax'],
      mobile: json['mobile'],
    );
  }
}

class Experiences {
  String? experience;
  String? timePeriod;

  Experiences({
    this.experience,
    this.timePeriod,
  });

  factory Experiences.fromJson(Map<String, dynamic> json){
    return Experiences(
      experience: json['experience'],
      timePeriod: json['timePeriod']
    );
  }
}

class Equipments {
  String? equipmentName;
  String? yearsOfUsing;

  Equipments({
    this.equipmentName,
    this.yearsOfUsing,
  });

  factory Equipments.fromJson(Map<String, dynamic> json){
    return Equipments(
        equipmentName: json['equipmentName'],
        yearsOfUsing: json['yearsOfUsing']
    );
  }
}