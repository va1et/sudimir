// ignore_for_file: unnecessary_new, prefer_interpolation_to_compose_strings, curly_braces_in_flow_control_structures

import 'dart:ui';

import 'package:agro_hack23/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:agro_hack23/common/theme/theme.dart';
import 'package:flutter/services.dart';

class LabelledInput extends StatefulWidget {
  final String label;
  final String placeholder;
  final String? value;
  final TextInputType keyboardType;
  final bool obscureText;
  final TextEditingController controller;
  const LabelledInput(
      {Key? key,
      required this.placeholder,
      required this.keyboardType,
      required this.controller,
      required this.obscureText,
      required this.label,
      this.value})
      : super(key: key);

  @override
  State<LabelledInput> createState() => _LabelledInputState();
}

class _LabelledInputState extends State<LabelledInput> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        TextFormField(
          controller: widget.controller,
          style: CustomTextTheme.calloutNS
              .copyWith(color: Theme.of(context).focusColor),
          onTap: () {},
          keyboardType: widget.keyboardType,
          obscureText: (widget.placeholder == 'Пароль' ||
                      widget.placeholder == 'Введите Пароль') &&
                  _showPassword == false
              ? true
              : false,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
            suffixIcon: widget.placeholder == "Пароль"
                ? InkWell(
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                    child: ImageIcon(
                      _showPassword
                          ? const AssetImage('assets/icon/passwordvisible.png')
                          : const AssetImage(
                              'assets/icon/passwordinvisible.png'),
                      color: const Color(0xFF97A4BA),
                    ))
                : const SizedBox(),
            hintText: widget.placeholder,
            alignLabelWithHint: true,
            hintStyle: CustomTextTheme.calloutNS
                .copyWith(color: Theme.of(context).disabledColor),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).cardColor),
                borderRadius: BorderRadius.circular(12.0)),
            filled: true,
            fillColor: Theme.of(context).cardColor,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: Theme.of(context).cardColor),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: Theme.of(context).cardColor),
            ),
          ),
        ),
      ],
    );
  }
}

class LabelledInputPhone extends StatefulWidget {
  final String label;
  final String placeholder;
  final Function(String?)? onChanged;
  final String? error;
  final String? value;
  final TextInputType keyboardType;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputAction? action;
  const LabelledInputPhone(
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
  State<LabelledInputPhone> createState() => _LabelledInputPhoneState();
}

class _LabelledInputPhoneState extends State<LabelledInputPhone> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          textInputAction: widget.action ?? TextInputAction.none,
          onChanged: widget.onChanged,
          inputFormatters: [
            PhoneTextFormatter(),
          ],
          controller: widget.controller,
          style: DarkTextTheme.calloutNS
              .copyWith(color: Theme.of(context).focusColor),
          keyboardType: widget.keyboardType,
          obscureText: (widget.placeholder == 'Пароль' ||
                      widget.placeholder == 'Введите Пароль') &&
                  _showPassword == false
              ? true
              : false,
          decoration: InputDecoration(
            errorMaxLines: 2,
            errorText: widget.error,
            contentPadding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
            suffixIcon: widget.placeholder == "Пароль"
                ? InkWell(
                    onTap: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                    child: ImageIcon(
                      _showPassword
                          ? const AssetImage('assets/icon/passwordvisible.png')
                          : const AssetImage(
                              'assets/icon/passwordinvisible.png'),
                      color: const Color(0xFF97A4BA),
                    ))
                : const SizedBox(),
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
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: Theme.of(context).primaryColorDark),
            ),
          ),
        ),
      ],
    );
  }
}

class LabelledInputDate extends StatefulWidget {
  final TextInputAction? action;
  final String placeholder;
  final String? value;
  final Function(String?)? onChanged;
  final String? error;
  final TextInputType keyboardType;

  final TextEditingController controller;
  const LabelledInputDate(
      {Key? key,
      required this.placeholder,
      required this.keyboardType,
      required this.controller,
      this.action,
      this.onChanged,
      required this.error,
      this.value})
      : super(key: key);

  @override
  State<LabelledInputDate> createState() => _LabelledInputDateState();
}

class _LabelledInputDateState extends State<LabelledInputDate> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          textInputAction: widget.action ?? TextInputAction.none,
          onChanged: widget.onChanged,
          inputFormatters: [
            DateTextFormatter(),
          ],
          controller: widget.controller,
          style: LightTextTheme.calloutNS
              .copyWith(color: Theme.of(context).focusColor),
          onTap: () {},
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            errorMaxLines: 2,
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

class PhoneTextFormatter extends TextInputFormatter {
  final phoneMask = '+0 (000) 000-00-00';

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final result = StringBuffer();
    var text = newValue.text
        .replaceAll('+', '')
        .replaceAll('-', '')
        .replaceAll('(', '')
        .replaceAll(')', '')
        .replaceAll(' ', '')
        .toUpperCase();
    if (text.length > 1 && oldValue.text.length > newValue.text.length) {
      text = text.substring(0, text.length);
    }
    var readPosition = 0;
    for (var i = 0; i < phoneMask.length; i++) {
      if (readPosition > text.length - 1) {
        break;
      }
      var curSymbol = phoneMask[i];
      if (isZeroSymbol(curSymbol)) {
        curSymbol = text[readPosition];
        readPosition++;
      }
      result.write(curSymbol);
    }
    final textResult = result.toString();
    return TextEditingValue(
      text: textResult,
      selection: TextSelection.collapsed(
        offset: textResult.length,
      ),
    );
  }

  bool isZeroSymbol(String symbol) => symbol == "0";
}

class TimeTextFormatter extends TextInputFormatter {
  final phoneMask = '00:00';

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final result = StringBuffer();
    var text =
        newValue.text.replaceAll(':', '').replaceAll(' ', '').toUpperCase();
    if (text.length > 1 && oldValue.text.length > newValue.text.length) {
      text = text.substring(0, text.length);
    }
    var readPosition = 0;
    for (var i = 0; i < phoneMask.length; i++) {
      if (readPosition > text.length - 1) {
        break;
      }
      var curSymbol = phoneMask[i];
      if (isZeroSymbol(curSymbol)) {
        curSymbol = text[readPosition];
        readPosition++;
      }
      result.write(curSymbol);
    }
    final textResult = result.toString();
    return TextEditingValue(
      text: textResult,
      selection: TextSelection.collapsed(
        offset: textResult.length,
      ),
    );
  }

  bool isZeroSymbol(String symbol) => symbol == "0";
}

class DateTextFormatter extends TextInputFormatter {
  final phoneMask = '00.00.0000';

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final result = StringBuffer();
    var text =
        newValue.text.replaceAll('.', '').replaceAll(' ', '').toUpperCase();
    if (text.length > 1 && oldValue.text.length > newValue.text.length) {
      text = text.substring(0, text.length);
    }
    var readPosition = 0;
    for (var i = 0; i < phoneMask.length; i++) {
      if (readPosition > text.length - 1) {
        break;
      }
      var curSymbol = phoneMask[i];
      if (isZeroSymbol(curSymbol)) {
        curSymbol = text[readPosition];
        readPosition++;
      }
      result.write(curSymbol);
    }
    final textResult = result.toString();
    return TextEditingValue(
      text: textResult,
      selection: TextSelection.collapsed(
        offset: textResult.length,
      ),
    );
  }

  bool isZeroSymbol(String symbol) => symbol == "0";
}

class LabelledInputTime extends StatefulWidget {
  final TextInputAction? action;
  final String placeholder;
  final String? value;
  final Function(String?)? onChanged;
  final String? error;
  final TextInputType keyboardType;

  final TextEditingController controller;
  const LabelledInputTime(
      {Key? key,
      required this.placeholder,
      required this.keyboardType,
      required this.controller,
      this.action,
      this.onChanged,
      required this.error,
      this.value})
      : super(key: key);

  @override
  State<LabelledInputTime> createState() => _LabelledInputTimeState();
}

class _LabelledInputTimeState extends State<LabelledInputTime> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          textInputAction: widget.action ?? TextInputAction.none,
          onChanged: widget.onChanged,
          inputFormatters: [
            TimeTextFormatter(),
          ],
          controller: widget.controller,
          style: DarkTextTheme.calloutNS
              .copyWith(color: Theme.of(context).focusColor),
          onTap: () {},
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            errorMaxLines: 2,
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
