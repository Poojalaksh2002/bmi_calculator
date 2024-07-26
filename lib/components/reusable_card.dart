import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    required this.colour,
    required this.cardChild,
    this.onTapFunction,
  });
  final Widget cardChild;
  final Color colour;
  final Function? onTapFunction;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction != null ? () => onTapFunction!() : null,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        height: 200,
        width: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
      ),
    );
  }
}
