import 'package:flutter/material.dart';

class PtElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final Color color;
  final Color? borderColor;
  final String text;
  final Color textColor;
  final double horizontalContentPadding;
  final double fontsize;

  const PtElevatedButton({
    Key? key,
    required this.onPressed,
    this.onLongPress,
    this.color = Colors.orange,
    this.borderColor,
    required this.text,
    this.textColor = Colors.white,
    this.horizontalContentPadding = 17,
    this.fontsize = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ButtonStyle style = ElevatedButton.styleFrom(
      primary: color,
      shape: const StadiumBorder(),
      side: borderColor != null
          ? BorderSide(
        color: borderColor!,
        width: 2,
      )
          : null,
    );

    return ElevatedButton(
      style: style,
      onPressed: onPressed,
      onLongPress: onLongPress,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 17,
          horizontal: horizontalContentPadding,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontFamily: 'Calibri',
            fontSize: fontsize,
          ),
        ),
      ),
    );
  }
}
