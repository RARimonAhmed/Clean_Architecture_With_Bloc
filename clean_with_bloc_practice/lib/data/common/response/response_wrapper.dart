import 'package:clean_with_bloc_practice/data/common/util/serializable.dart';

class WrappedResponse <T extends Serializable> {
  String? message_bn;
  String? message_en;
  T? data;
  int? code;

  WrappedResponse({ required this.message_bn, required this.message_en, required this.data,required this.code });

  factory WrappedResponse.fromJson(Map<String, dynamic> json, Function(Map<String, dynamic>) create){
    return WrappedResponse<T>(message_bn: json["message_bn"], message_en: json["message_en"], data: create(json["data"]),code: json['code']);
  }

  Map<String, dynamic> toJson() {
    return {
      "message_bn": this.message_bn,
      "message_en": this.message_en,
      "data": this.data?.toJson(),
      "code": this.code
    };
  }
}

class WrappedListResponse <T extends Serializable> {
  String? message_bn;
  String? message_en;
  T? data;
  int? code;

  WrappedListResponse({ required this.message_bn, required this.message_en, required this.data,required this.code });

  factory WrappedListResponse.fromjson(Map<String, dynamic> json, Function(List<dynamic>) create){
    return WrappedListResponse(message_bn: json["message_bn"], message_en: json["message_en"], data: create(json["data"]),code: json['code']);
  }

  Map<String, dynamic> toJson(){
    return {
      "message_bn": this.message_bn,
      "message_en": this.message_en,
      "data": this.data?.toJson(),
      "code": this.code
    };
  }
}