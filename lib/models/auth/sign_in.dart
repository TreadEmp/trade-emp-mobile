class SignInResponseModel {
  final bool? success;
  final Data? data;

  SignInResponseModel({this.success, this.data});

  factory SignInResponseModel.fromJson(Map<String, dynamic> parsedJson) {
    return SignInResponseModel(
        success: parsedJson['success'],
        data: Data.fromJson(parsedJson['data']));
  }
}

class Data {
  String? userId;
  String? name;
  String? role;
  String? email;
  String? refreshToken;
  String? accessToken;
  String? message;

  Data(
      {this.userId,
      this.name,
      this.accessToken,
      this.refreshToken,
      this.role,
      this.email,
      this.message});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      userId: json['userId'],
      name: json['name'],
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      role: json['role'],
      email: json['email'],
      message: json['message'],
    );
  }
}

class SignInRequestModel {
  String? email;
  String? password;

  SignInRequestModel({this.email, this.password});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email!.trim(),
      'password': password!.trim()
    };

    return map;
  }
}
