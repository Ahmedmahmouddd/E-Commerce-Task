import 'package:ahmed_mahmoud_flutter_task/features/home/domain/entities/product_entity.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/widgets/filter_bottom_sheet.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/widgets/stagger_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';

class ShowAllScreen extends StatelessWidget {
  const ShowAllScreen({super.key, required this.products});

  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/icons/wavesOpacity.svg',
            height: MediaQuery.of(context).size.height / 1.5,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.close_rounded,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () => showFilterBottomSheet(context),
                        icon: const Icon(
                          Icons.settings_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: MasonryGridView.builder(
                      padding: const EdgeInsets.all(12),
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      gridDelegate:
                          const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final height = (index.isEven) ? 260.0 : 230.0;
                        return StaggerTile(
                          height: height,
                          product: products[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
