import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/screens/product_details_screen.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

class StaggerTile extends StatelessWidget {
  const StaggerTile({super.key, required this.height, required this.product});

  final double height;
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(product: product),
          ),
        );
      },
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: height / 1.5,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    product.images[0],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  const Positioned(
                    top: 12,
                    right: 12,
                    child: Icon(Icons.favorite_border),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.title, maxLines: 1),
                  Text(product.description, maxLines: 1),
                  Text("\$ ${product.price.toString()}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
