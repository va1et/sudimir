import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:agro_hack23/common/theme/theme.dart';
import 'package:agro_hack23/presentation/pages/home_page.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ProfileCard extends StatelessWidget {
  final SvgPicture? icon;
  final String text;
  final Widget? screen;

//  final Function(String)? onClickNewsTag;

  const ProfileCard(
      {Key? key, required this.icon, required this.text, required this.screen})
      : super(key: key);

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
            onTap: () {},
            // onTap: () => PersistentNavBarNavigator.pushNewScreen(context,
            //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
            //     withNavBar: false,
            //     screen: screen ?? HomeScreen()),
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      icon ?? const SizedBox(),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        maxLines: 2,
                        text,
                        style: CustomTextTheme.headline1NS
                            .copyWith(color: Theme.of(context).focusColor),
                      ),
                    ]),
                    const Icon(Icons.chevron_right_outlined,
                        color: Color(0xFF808B9F)),
                  ],
                ))));
  }
}
