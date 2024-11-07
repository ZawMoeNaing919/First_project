import 'package:json_annotation/json_annotation.dart';

part 'Persondata.g.dart';
@JsonSerializable(explicitToJson: true)
class Persondata{
  @JsonKey(name: 'Username' ,defaultValue: "")
  String Username;
  @JsonKey(name: 'Email' ,defaultValue: "")
  String Email;
  @JsonKey(name: 'Password' ,defaultValue: "")
  String Password;
  Persondata({
    required this.Username,
    required this.Email,
    required this.Password,
});
  factory Persondata.fromJson(Map<String, dynamic> json) {
    return _$PersondataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PersondataToJson(this);


}