import 'package:flutter/material.dart';
import 'package:agro_hack23/common/theme/theme.dart';

class Textbutton extends StatefulWidget {
  final String text;
  final Color color;
  final void Function()? onPressed;

  const Textbutton(
      {Key? key,
      required this.text,
      required this.color,
      required this.onPressed})
      : super(key: key);

  @override
  State<Textbutton> createState() => _TextbuttonState();
}

class _TextbuttonState extends State<Textbutton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return widget.color
                .withRed((widget.color.red * 0.85).round())
                .withGreen((widget.color.green * 0.85).round())
                .withBlue((widget.color.blue * 0.85).round());
          }
          return widget.color;
        }),
      ),
      onPressed: widget.onPressed,
      child: Text(widget.text, style: CustomTextTheme.subheadlineButtonNS),
    );
  }
}
