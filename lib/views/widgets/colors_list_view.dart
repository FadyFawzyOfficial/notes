import 'package:flutter/material.dart';

class ColorsListView extends StatefulWidget {
  final Function(Color) selectColor;

  const ColorsListView({
    super.key,
    required this.selectColor,
  });

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  static const colors = [
    Color(0xFFFF5252), // Watermelon Red
    Color(0xFFFFD740), // Sunflower Yellow
    Color(0xFF4CAF50), // Mint Green
    Color(0xFF2196F3), // Sky Blue
    Color(0xFFFF4081), // Pink
    Color(0xFFFF9800), // Orange
    Color(0xFF4CAF50), // Green
    Color(0xFFFFC107), // Yellow
    Color(0xFF9C27B0), // Purple
    Color(0xFF03A9F4), // Light Blue
  ];

  var selectedColorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (context, index) => InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          onTap: () {
            widget.selectColor(colors[index]);
            setState(() => selectedColorIndex = index);
          },
          child: ColorItem(
            color: colors[index],
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
