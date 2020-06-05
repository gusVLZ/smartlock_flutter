import 'package:json_annotation/json_annotation.dart';

part 'User.g.dart';

@JsonSerializable()
class User {
  int id;
  String username;
  String email;
  String password;
  String cargo;
  

  User({
    this.id, 
    this.username,
    this.email,
    this.password,
    this.cargo
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
