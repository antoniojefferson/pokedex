import 'package:flutter/material.dart';

class PokeChip extends StatelessWidget {
  final String text;
  final double paddingVertical;
  final double paddingHorizontal;
  const PokeChip({
    Key? key,
    required this.text,
    this.paddingVertical = 0,
    this.paddingHorizontal = 0
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: paddingVertical, horizontal: paddingHorizontal),
      child: Container(
        height: 20,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(18)),
          color: Colors.white38
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white
            )
          )
        )
      ),
    );
  }
}