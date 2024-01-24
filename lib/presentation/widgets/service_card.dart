import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:agro_hack23/common/theme/theme.dart';
import 'package:agro_hack23/presentation/pages/home_page.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:go_router/go_router.dart';

import 'package:url_launcher/url_launcher.dart';

class ServiceCard extends StatelessWidget {
  final SvgPicture icon;
  final void Function() onTap;
  final String name;
  final String? screen;

//  final Function(String)? onClickNewsTag;

  const ServiceCard({
    Key? key,
    required this.icon,
    required this.onTap,
    required this.name,
    required this.screen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4,
        shadowColor: const Color(0xFF0C2975).withOpacity(0.12),
        color: Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0), //<-- SEE HERE
        ),
        child: InkWell(
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: onTap,
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    icon,
                    const SizedBox(
                      height: 34,
                    ),
                    AutoSizeText(
                      maxLines: 2,
                      name,
                      textAlign: TextAlign.start,
                      style: CustomTextTheme.caption2MS
                          .copyWith(color: Theme.of(context).focusColor),
                    ),
                  ],
                ))));
  }
}
