import 'package:clean_with_bloc_practice/data/common/util/serializable.dart';

class UserProductResponse implements Serializable {
  int? id;
  String? name;
  String? email;

  UserProductResponse({
    required this.id, 
    required this.name, 
    required this.email
  });

  factory UserProductResponse.fromJson(Map<String, dynamic> json){
    return UserProductResponse(id: json["id"], name: json["name"], email: json["email"]);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "email": this.email
    };
  }

  
}