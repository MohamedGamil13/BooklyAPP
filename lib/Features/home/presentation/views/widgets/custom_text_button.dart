import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.backGroundColor,
    required this.textColor,
    required this.text,
    this.borderRadius,
    this.fontWeight,
  });
  final Color backGroundColor;
  final Color textColor;
  final String text;
  final BorderRadius? borderRadius;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backGroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadiusGeometry.circular(16),
          ),
        ),
        onPressed: () {},
        child: Text(
          text,
          style: Styles.textStyle18.copyWith(
            color: textColor,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
