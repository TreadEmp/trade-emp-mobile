class PasswordResetCodeRequestModel {
  String? email;
  
  PasswordResetCodeRequestModel(
      {this.email});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email!.trim(),
    };
    return map;
  }
}