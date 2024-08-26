import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomToggleTextButton extends StatelessWidget {
  const CustomToggleTextButton({
    Key? key,
    required this.text,
    required this.isActivity,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final bool isActivity;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: REdgeInsets.symmetric(horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide.none,
        ),
        backgroundColor: isActivity ? Colors.black : null,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: isActivity ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
