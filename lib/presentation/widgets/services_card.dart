import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:agro_hack23/common/theme/theme.dart';
import 'package:agro_hack23/presentation/pages/home_page.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:url_launcher/url_launcher.dart';

class ServicesCard extends StatelessWidget {
  final SvgPicture icon;
  final String name;
  final List<Color> colors;
  final Widget? screen;
  final bool? browser;
//  final Function(String)? onClickNewsTag;

  const ServicesCard(
      {Key? key,
      required this.icon,
      required this.name,
      required this.screen,
      required this.colors,
      required this.browser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        borderOnForeground: false,
        color: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.transparent,
        child: Container(
            height: 92,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(color: const Color(0xff0c29751a).withOpacity(0.1))
              ],
              gradient: LinearGradient(
                colors: [
                  colors[0],
                  colors[1],
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: InkWell(
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {},
                child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // browser == false
                        //     ?
                        icon,
                        // :
                        // Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       icon,
                        //       Flexible(
                        //           child: Text(
                        //         "Сайт",
                        //         maxLines: 2,
                        //         style: CustomTextTheme.subheadlineNS.copyWith(
                        //             color: Theme.of(context).disabledColor),
                        //       ))
                        //     ],
                        //   ),
                        // const SizedBox(
                        //   height: 34,
                        // ),
                        AutoSizeText(
                          maxLines: 1,
                          name,
                          textAlign: TextAlign.start,
                          style: CustomTextTheme.subheadlineNS
                              .copyWith(color: Theme.of(context).cardColor),
                        ),
                      ],
                    )))));
  }
}
