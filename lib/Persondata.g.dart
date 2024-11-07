// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Persondata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Persondata _$PersondataFromJson(Map<String, dynamic> json) => Persondata(
      Username: json['Username'] as String? ?? '',
      Email: json['Email'] as String? ?? '',
      Password: json['Password'] as String? ?? '',
    );

Map<String, dynamic> _$PersondataToJson(Persondata instance) =>
    <String, dynamic>{
      'Username': instance.Username,
      'Email': instance.Email,
      'Password': instance.Password,
    };
