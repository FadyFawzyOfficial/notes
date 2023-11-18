import 'package:flutter/material.dart';

class ColorsListView extends StatelessWidget {
  const ColorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => const CircleAvatar(
          radius: 24,
          backgroundColor: Colors.amber,
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 4),
      ),
    );
  }
}
