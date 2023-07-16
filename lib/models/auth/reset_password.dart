class ResetPasswordRequestModel {
  String? email;
  String? varificationCode;
  String? password;
  String? retypedPassword;

  ResetPasswordRequestModel(
      {this.email, this.password, this.retypedPassword, this.varificationCode});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email!.trim(),
      'varificationCode': varificationCode!.trim(),
      'password': password!.trim(),
      'retypedPassword': retypedPassword!.trim()
    };
    return map;
  }
}
