class UserModel {
  String? univ;
  String? name;
  String? avatar;
  String? id;

  UserModel({this.univ, this.name, this.avatar, this.id});

  UserModel.fromJson(Map<String, dynamic> json) {
    univ = json['univ'];
    name = json['name'];
    avatar = json['avatar'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['univ'] = this.univ;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    data['id'] = this.id;
    return data;
  }
}
