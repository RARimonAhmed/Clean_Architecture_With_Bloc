import 'package:dartz/dartz.dart';
import 'package:clean_with_bloc_practice/data/product/remote/dto/update_product_request.dart';
import 'package:clean_with_bloc_practice/domain/common/base/base_failure.dart';
import 'package:clean_with_bloc_practice/domain/product/entity/product_entity.dart';
import 'package:clean_with_bloc_practice/domain/product/repository/update_product_repository.dart';

class UpdateProductUseCase {
  final UpdateProductRepository updateProductRepository;

  UpdateProductUseCase({required this.updateProductRepository});

  Future<Either<ProductEntity, Failure>> invoke(UpdateProductRequest request, String id){
    return updateProductRepository.updateProduct(request, id);
  }
}