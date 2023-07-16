class UserFullProfileRequestModel {
  String? userRole;
  String? userId;

  UserFullProfileRequestModel({this.userRole, this.userId});

  Map<String?, dynamic> toJson() {
    Map<String?, dynamic> map = {userRole: userRole, userId: userId};

    return map;
  }
}