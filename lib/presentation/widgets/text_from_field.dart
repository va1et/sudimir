import 'package:agro_hack23/presentation/theme.dart';
import 'package:flutter/material.dart';

class LabelledInputTextOneSign extends StatefulWidget {
  final TextInputAction? action;
  final String label;
  final String placeholder;
  final String? value;
  final TextInputType keyboardType;
  final bool obscureText;
  final Function(String?)? onChanged;
  final String? error;
  final TextEditingController controller;
  const LabelledInputTextOneSign(
      {Key? key,
      required this.placeholder,
      required this.keyboardType,
      required this.controller,
      required this.obscureText,
      required this.label,
      required this.error,
      this.action,
      this.onChanged,
      this.value})
      : super(key: key);

  @override
  State<LabelledInputTextOneSign> createState() =>
      _LabelledInputTextOneSignState();
}

class _LabelledInputTextOneSignState extends State<LabelledInputTextOneSign> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          textInputAction: widget.action ?? TextInputAction.none,
          onChanged: widget.onChanged,
          validator: (value) {
            return value!.isEmpty ? 'Поле необходимо заполнить' : null;
          },
          controller: widget.controller,
          style: LightTextTheme.calloutNS
              .copyWith(color: Theme.of(context).focusColor),
          onTap: () {},
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            errorText: widget.error,

            contentPadding: const EdgeInsets.fromLTRB(12, 5, 12, 5),

            hintText: widget.placeholder,
            alignLabelWithHint: true,
            hintStyle: DarkTextTheme.calloutNS
                .copyWith(color: Theme.of(context).disabledColor),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).primaryColorDark),
                borderRadius: BorderRadius.circular(12.0)),
            filled: true,
            fillColor: widget.error == null
                ? Theme.of(context).primaryColorDark
                : Theme.of(context).splashColor,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: Theme.of(context).primaryColorDark),
            ),
            // enabledBorder: UnderlineInputBorder(
            //   borderRadius: BorderRadius.circular(12.0),
            //   borderSide: BorderSide(color: Theme.of(context).cardColor),
            // ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: Theme.of(context).primaryColorDark),
            ),
            // border: const UnderlineInputBorder(

            //   borderSide: BorderSide(color: Colors.green),
            // ),
          ),
        ),
      ],
    );
  }
}
