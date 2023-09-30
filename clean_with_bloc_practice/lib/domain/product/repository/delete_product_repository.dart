import 'package:dartz/dartz.dart';
import 'package:clean_with_bloc_practice/domain/common/base/base_failure.dart';


abstract class DeleteProductRepository {
  Future<Either<bool, Failure>> delete(String id);
}