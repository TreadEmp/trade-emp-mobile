// class CountryModel {
//   String name;
//   String value;

//   CountryModel({this.name, this.value});

//   factory CountryModel.fromJson(Map<String, dynamic> json){
//     return CountryModel(
//       name: json['name'],
//       value: json['value']
//     );
//   }
// }

class Countries {
  String? name;
  String? value;

  Countries({this.name, this.value});

  Countries.fromJson(Map<String, String> json) {
    name = json['name'];
    value = json['value'];
  }

  Map<String, String?> toJson() {
    final Map<String, String?> data = <String, String?>{};
    data['name'] = name;
    data['value'] = value;
    return data;
  }
}
