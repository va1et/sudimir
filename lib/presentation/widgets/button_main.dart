import 'package:agro_hack23/common/theme/theme.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ButtonMain extends StatelessWidget {
  const ButtonMain({Key? key, required this.text, required this.onClick})
      : super(key: key);

  final String text;
  final Function()? onClick;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        splashFactory: NoSplash.splashFactory,
        surfaceTintColor: MaterialStateProperty.all(Colors.transparent),
        shadowColor: MaterialStateProperty.all(Colors.transparent),
        elevation: MaterialStateProperty.all(0),
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return Theme.of(context)
                .primaryColor
                .withRed((Theme.of(context).primaryColor.red * 0.95).round())
                .withGreen(
                    (Theme.of(context).primaryColor.green * 0.95).round())
                .withBlue((Theme.of(context).primaryColor.blue * 0.95).round());
          }

          return Theme.of(context).primaryColor;
        }),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
      onPressed: onClick,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
            child: AutoSizeText(
          text,
          style: CustomTextTheme.bodyButtonNS.copyWith(
              color: Theme.of(context).focusColor, fontWeight: FontWeight.w600),
        )),
      ),
    );
  }
}
