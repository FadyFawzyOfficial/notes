import 'package:flutter/material.dart';

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  var selectedColorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          onTap: () => setState(() => selectedColorIndex = index),
          child: ColorItem(
            color: Colors.teal,
            isSelected: selectedColorIndex == index,
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 8),
      ),
    );
  }
}

class ColorItem extends StatelessWidget {
  final Color color;
  final bool isSelected;

  const ColorItem({
    super.key,
    required this.color,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) => isSelected
      ? CircleAvatar(
          radius: 24,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 22,
            backgroundColor: color,
          ),
        )
      : CircleAvatar(
          radius: 24,
          backgroundColor: color,
        );
}
