import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/widgets/all_products_list.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/widgets/background_image.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/widgets/home_headline.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/widgets/home_product_card_listview.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/widgets/row_of_options.dart';
import 'package:ahmed_mahmoud_flutter_task/features/home/presentation/UI/widgets/you_might_also_like_text.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          BackGroundImage(),
          SafeArea(
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeHeadline(),
                  RowOfOptions(),
                  AllProductsList(),
                  YouMightAlsoLikeText(),
                  HomeProductCardListView(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
