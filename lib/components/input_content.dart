import 'package:flutter/material.dart';

import 'constants.dart';

class IconContent extends StatelessWidget {
  const IconContent({super.key, this.IconData, required this.label});

  final IconData;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          IconData,
          size: 70,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton({
    this.iconName,
    super.key,
  });
  final iconName;
  @override
  Widget build(BuildContext context) {
    return Icon(
      iconName,
      // FontAwesomeIcons.minus,
      color: Colors.white,
    );
  }
}
