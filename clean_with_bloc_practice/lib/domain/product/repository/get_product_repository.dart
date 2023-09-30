import 'package:dartz/dartz.dart';
import 'package:clean_with_bloc_practice/domain/common/base/base_failure.dart';
import 'package:clean_with_bloc_practice/domain/product/entity/product_entity.dart';

abstract class GetProductRepository {
  Future<Either<List<ProductEntity>, Failure>> getAllProduct();
  Future<Either<ProductEntity, Failure>> getSingleProduct(String id);
}