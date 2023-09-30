import 'package:dartz/dartz.dart';
import 'package:clean_with_bloc_practice/domain/common/base/base_failure.dart';
import 'package:clean_with_bloc_practice/domain/product/repository/delete_product_repository.dart';

class DeleteProductUseCase {
  final DeleteProductRepository deleteProductRepository;

  DeleteProductUseCase({required this.deleteProductRepository});

  Future<Either<bool, Failure>> invoke(String id){
    return deleteProductRepository.delete(id);
  }
}