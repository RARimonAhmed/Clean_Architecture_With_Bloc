import 'package:flutter/material.dart';
import 'package:clean_with_bloc_practice/domain/product/entity/product_entity.dart';

class ProductItem extends StatelessWidget {
  final ProductEntity productEntity;
  final VoidCallback? click;
  const ProductItem({ Key? key, required this.productEntity, required this.click }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: click,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productEntity.name,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18
                ),
              ),
              Text("Rp. ${productEntity.price}")
            ],
          ),
        )
      ),
      
    );
  }
}