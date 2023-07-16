class SignUpResponseModel {
  final bool? success;
  final Data? data;

  SignUpResponseModel( {
    this.success,
    this.data
  });

  factory SignUpResponseModel.fromJson(Map<String, dynamic> parsedJson){
    return SignUpResponseModel(
        success: parsedJson['success'],
        data: Data.fromJson(parsedJson['data'])
    );
  }
}

class Data {
  String? userId;
  String? firstName;
  String? lastName;
  String? role;
  String? email;
  bool? activated;

  Data({
    this.userId,
    this.firstName,
    this.lastName,
    this.role,
    this.email,
    this.activated
  });

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      userId: json['userId'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      role: json['role'],
      email: json['email'],
      activated: json['activated'],
    );
  }
}

class SignUpRequestModel {
  String? email;
  String? password;
  String? firstName;
  String? lastName;
  String? role;

  SignUpRequestModel({
    this.email,
    this.password,
    this.firstName,
    this.lastName,
    this.role,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email!.trim(),
      'password': password!.trim(),
      'firstName': firstName!.trim(),
      'lastName': lastName!.trim(),
      'role': role!.trim(),
    };
    return map;
  }
}