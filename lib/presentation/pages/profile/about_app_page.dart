import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:agro_hack23/common/theme/theme.dart';
import 'package:agro_hack23/service_locator.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: CupertinoNavigationBarBackButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: const Color(0xFF808B9F),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(
            //size: 20,
            color: Theme.of(context).primaryColor, //change your color here
          ),
          backgroundColor: Theme.of(context).bottomAppBarColor,
          shadowColor: Theme.of(context).bottomAppBarColor,
          title: Text(
            "О приложении",
            style: CustomTextTheme.headline1NS.copyWith(
                color: Theme.of(context).focusColor,
                fontWeight: FontWeight.w600),
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          bottom: false,
          child: LayoutBuilder(builder:
              (BuildContext context, BoxConstraints viewportConstraints) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.025),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.1),
                      child: SvgPicture.asset('assets/images/logo.svg'),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.025),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Версия приложения",
                                style: CustomTextTheme.calloutNS.copyWith(
                                  color: Theme.of(context).disabledColor,
                                )),
                            Text(
                              getIt<PackageInfo>().version,
                              style: CustomTextTheme.calloutNS.copyWith(
                                color: Theme.of(context).disabledColor,
                              ),
                            ),
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.05),
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: CustomTextTheme.calloutNS.copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w600),
                              children: <TextSpan>[
                                TextSpan(
                                    text:
                                        "Сервис взаимодействия бизнеса с органами контроля",
                                    style: CustomTextTheme.calloutNS.copyWith(
                                        color: Theme.of(context).focusColor)),
                                TextSpan(
                                    text: "\nПользовательское соглашение",
                                    style: CustomTextTheme.calloutNS.copyWith(
                                        color: Theme.of(context).primaryColor),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        launch(
                                            "https://www.mos.ru/legal/rules/");
                                      })
                              ],
                            ))),
                    // Padding(
                    //     padding: EdgeInsets.only(
                    //         top: MediaQuery.of(context).size.height * 0.025),
                    //     child: RichText(
                    //       text: TextSpan(
                    //         children: [
                    //           TextSpan(
                    //             text: AppLocalizations.of(context)
                    //                 ?.translate('about_app_appBar_text3'),
                    //             style: CustomTextTheme.calloutNS.copyWith(
                    //                 color: Theme.of(context).focusColor),
                    //           ),
                    //           TextSpan(
                    //             text: ' home.mephi.ru',
                    //             style: CustomTextTheme.calloutNS.copyWith(
                    //                 color: Theme.of(context).primaryColor),
                    //             recognizer: TapGestureRecognizer()
                    //               ..onTap = () {
                    //                 launchUrl(Uri.parse(
                    //                     'https://home.mephi.ru/study_groups?term_id=15'));
                    //               },
                    //           ),
                    //         ],
                    //       ),
                    //     )),
                  ]),
            );
          }),
        ));
  }
}
