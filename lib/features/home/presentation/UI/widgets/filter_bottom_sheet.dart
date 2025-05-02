
  import 'package:flutter/material.dart';

Future<dynamic> showFilterBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      barrierColor: Colors.black38,
      enableDrag: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return const FilterBottomSheet();
      },
    );
  }


class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 12),
          const Text("Price"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Text("Highest To Lowest"),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Text("Lowest To Highest"),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text("Date"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Text("Oldest To Newest"),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Text("Newest To Oldest"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
