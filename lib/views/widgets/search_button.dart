import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: () {},
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: Container(
          width: 40,
          decoration: const BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: const Icon(Icons.search_rounded),
        ),
      ),
    );
  }
}
