import 'package:equatable/equatable.dart';
import 'package:clean_with_bloc_practice/data/product/remote/dto/create_product_request.dart';

abstract class CreateProductPageEvent extends Equatable {}

class CreateProductPageEventCreateProduct implements CreateProductPageEvent {
  final CreateProductRequest createProductRequest;

  CreateProductPageEventCreateProduct({required this.createProductRequest});

  @override
  List<Object?> get props => [createProductRequest];

  @override
  bool? get stringify => false;
  
}