import 'package:clean_with_bloc_practice/data/common/util/serializable.dart';
import 'package:clean_with_bloc_practice/data/product/remote/dto/product_user_response.dart';

class ProductResponse implements Serializable {
  int? id;
  String? name;
  int? price;
  UserProductResponse? user;

  ProductResponse(
      {required this.id,
      required this.name,
      required this.price,
      required this.user});

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
        id: json["id"],
        name: json["product_name"],
        price: json["price"],
        user: UserProductResponse.fromJson(json["user"]));
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "product_name": this.name,
      "price": this.price,
      "user": this.user?.toJson()
    };
  }
}
