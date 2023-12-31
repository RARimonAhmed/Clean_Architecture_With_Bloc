import 'package:clean_with_bloc_practice/data/product/remote/dto/create_product_request.dart';
import 'package:clean_with_bloc_practice/data/product/remote/dto/update_product_request.dart';
import 'package:clean_with_bloc_practice/domain/product/entity/product_entity.dart';

abstract class ProductApi {
  Future<List<ProductEntity>> findAllProduct();
  Future<ProductEntity> findProductById(String id);
  Future<ProductEntity> create(CreateProductRequest createProductRequest);
  Future<ProductEntity> update(UpdateProductRequest updateProductRequest, String id);
  Future<void> delete(String id);
}