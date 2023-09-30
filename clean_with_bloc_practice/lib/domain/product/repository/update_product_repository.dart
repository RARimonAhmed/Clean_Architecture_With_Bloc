import 'package:dartz/dartz.dart';
import 'package:clean_with_bloc_practice/data/product/remote/dto/update_product_request.dart';
import 'package:clean_with_bloc_practice/domain/common/base/base_failure.dart';
import 'package:clean_with_bloc_practice/domain/product/entity/product_entity.dart';

abstract class UpdateProductRepository {
  Future<Either<ProductEntity, Failure>> updateProduct(UpdateProductRequest updateProductRequest, String id);
}