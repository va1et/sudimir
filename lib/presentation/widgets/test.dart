import 'package:flutter/material.dart';

class MyCustomWidget extends StatelessWidget {
  final String text;
  final bool isChecked;
  bool overflowed = false;
  MyCustomWidget({required this.text, required this.isChecked});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Align(
            alignment: Alignment.center,
            child: Container(
                // width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: Row(
                  // mainAxisSize: MainAxisSize.max,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Текстовое поле
                    overflowed
                        ? Flexible(
                            fit: FlexFit.loose,
                            child: Text(
                              text,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          )
                        : Text(
                            text,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                    // const SizedBox(width: 10), // Промежуток
                    VerticalDivider(color: Colors.amber, width: 2.0),
                    // Пунктирная линия
                    Expanded(
                        child: LayoutBuilder(builder: (context, constraints) {
                      if (constraints.maxWidth >= 40) {
                        setState() {
                          overflowed = true;
                        }

                        return Container(
                            height: 2.0,
                            margin:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black,
                                  width: 0.5,
                                  style: BorderStyle.solid,
                                ),
                              ),
                            ));
                      } else {
                        setState() {
                          overflowed = false;
                        }

                        print(constraints.maxHeight);
                        return Container();
                      }
                    })),

                    Flexible(
                        fit: FlexFit.loose,
                        // Чек-бокс
                        child: Checkbox(
                          value: isChecked,
                          onChanged: (bool? value) {
                            print(MediaQuery.of(context).size.width);
                            // Обработка изменения состояния чек-бокса
                          },
                        )),
                  ],
                ))));
  }
}
