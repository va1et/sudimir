import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:agro_hack23/common/theme/theme.dart';
import 'package:agro_hack23/presentation/pages/profile/about_app_page.dart';
import 'package:agro_hack23/presentation/widgets/profile_card.dart';
import 'package:agro_hack23/presentation/widgets/service_card.dart';

class ProfileUserInfoScreen extends StatefulWidget {
  const ProfileUserInfoScreen({
    Key? key,
  }) : super(key: key);

  @override

  // ignore: library_private_types_in_public_api
  _ProfileUserInfoScreenState createState() => _ProfileUserInfoScreenState();
}

class _ProfileUserInfoScreenState extends State<ProfileUserInfoScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return BlocBuilder<LibBooksBloc, LibBooksState>(builder: (context, state) {
    //   print(state);
    //   if (state is LibBooksLoading) {

    return CupertinoPageScaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: SafeArea(
            bottom: false,
            child: CupertinoTheme(
                data: CupertinoThemeData(
                  textTheme: CupertinoTextThemeData(
                    navLargeTitleTextStyle: TextStyle(
                      fontSize: 32, color: Theme.of(context).focusColor,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w600,
                      //height: 24,
                      letterSpacing: -0.44,
                    ),
                    navTitleTextStyle: TextStyle(
                      fontSize: 18, color: Theme.of(context).focusColor,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w600,
                      //height: 24,
                      letterSpacing: -0.44,
                    ),
                  ),
                  barBackgroundColor: Colors.white,
                ),
                child: NestedScrollView(
                    physics: const BouncingScrollPhysics(),
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return [
                        CupertinoSliverNavigationBar(
                          // leading: Material(
                          //   child: IconButton(
                          //     padding: EdgeInsets.zero,
                          //     iconSize: 28,
                          //     splashColor: Colors.transparent,
                          //     highlightColor: Colors.transparent,
                          //     icon: const Icon(CupertinoIcons.chevron_left,
                          //         color: Color(0xFF808B9F)),
                          //     onPressed: () => Navigator.of(context).pop(),
                          //   ),
                          // ),
                          leading: CupertinoNavigationBarBackButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            color: const Color(0xFF808B9F),
                          ),
                          trailing: CupertinoContextMenu(
                            previewBuilder: (BuildContext context,
                                Animation<double> animation, Widget child) {
                              return CupertinoTheme(
                                data: const CupertinoThemeData(
                                  brightness: Brightness.light,
                                ),
                                child: Container(
                                  color: Colors.transparent,
                                  child: child,
                                ),
                              );
                            },
                            actions: <Widget>[
                              CupertinoContextMenuAction(
                                child: const Text('Option 1'),
                                onPressed: () {
                                  Navigator.pop(context);
                                  // Perform action for Option 1
                                },
                              ),
                              CupertinoContextMenuAction(
                                child: Text('Option 2'),
                                onPressed: () {
                                  Navigator.pop(context);
                                  // Perform action for Option 2
                                },
                              ),
                            ],
                            child: GestureDetector(
                              onTap: () {
                                showCupertinoModalPopup(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      CupertinoActionSheet(
                                    actions: <Widget>[
                                      CupertinoActionSheetAction(
                                        child: Text('изменить'),
                                        onPressed: () {
                                          Navigator.pop(context);
                                          // Perform action for Option 1
                                        },
                                      ),
                                    ],
                                    cancelButton: CupertinoActionSheetAction(
                                      child: Text('Отмена'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                );
                              },
                              child: Icon(CupertinoIcons.ellipsis),
                            ),
                          ),
                          largeTitle: const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Мои данные",
                              )),
                        ),
                      ];
                    },
                    body: ListView(
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.025,
                            vertical: 20),
                        children: <Widget>[
                          Column(
                            // mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              ListView(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: [
                                    Card(
                                        elevation: 4,
                                        shadowColor: const Color(0xFF0C2975)
                                            .withOpacity(0.12),
                                        color: Theme.of(context).cardColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              12.0), //<-- SEE HERE
                                        ),
                                        child: InkWell(
                                            splashColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () => {},
                                            child: Padding(
                                                padding:
                                                    const EdgeInsets.all(16),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "ФИО",
                                                      maxLines: 1,
                                                      style: CustomTextTheme
                                                          .subheadlineNS
                                                          .copyWith(
                                                              color: Theme.of(
                                                                      context)
                                                                  .disabledColor),
                                                    ),
                                                    const SizedBox(
                                                      height: 3,
                                                    ),
                                                    Text(
                                                      "Фамилия Имя Отчество",
                                                      maxLines: 2,
                                                      style: CustomTextTheme
                                                          .caption2MS
                                                          .copyWith(
                                                              color: Theme.of(
                                                                      context)
                                                                  .focusColor),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      "Пол",
                                                      maxLines: 1,
                                                      style: CustomTextTheme
                                                          .subheadlineNS
                                                          .copyWith(
                                                              color: Theme.of(
                                                                      context)
                                                                  .disabledColor),
                                                    ),
                                                    const SizedBox(
                                                      height: 3,
                                                    ),
                                                    Text(
                                                      "Мужской",
                                                      maxLines: 1,
                                                      style: CustomTextTheme
                                                          .caption2MS
                                                          .copyWith(
                                                              color: Theme.of(
                                                                      context)
                                                                  .focusColor),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      "Дата рождения",
                                                      maxLines: 1,
                                                      style: CustomTextTheme
                                                          .subheadlineNS
                                                          .copyWith(
                                                              color: Theme.of(
                                                                      context)
                                                                  .disabledColor),
                                                    ),
                                                    const SizedBox(
                                                      height: 3,
                                                    ),
                                                    Text(
                                                      "01.01.1999",
                                                      maxLines: 1,
                                                      style: CustomTextTheme
                                                          .caption2MS
                                                          .copyWith(
                                                              color: Theme.of(
                                                                      context)
                                                                  .focusColor),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      "Город рождения",
                                                      maxLines: 1,
                                                      style: CustomTextTheme
                                                          .subheadlineNS
                                                          .copyWith(
                                                              color: Theme.of(
                                                                      context)
                                                                  .disabledColor),
                                                    ),
                                                    const SizedBox(
                                                      height: 3,
                                                    ),
                                                    Text(
                                                      "Москва",
                                                      maxLines: 1,
                                                      style: CustomTextTheme
                                                          .caption2MS
                                                          .copyWith(
                                                              color: Theme.of(
                                                                      context)
                                                                  .focusColor),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                  ],
                                                )))),
                                    Card(
                                        elevation: 4,
                                        shadowColor: const Color(0xFF0C2975)
                                            .withOpacity(0.12),
                                        color: Theme.of(context).cardColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              12.0), //<-- SEE HERE
                                        ),
                                        child: InkWell(
                                            splashColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () => {},
                                            child: Padding(
                                                padding:
                                                    const EdgeInsets.all(16),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Телефон",
                                                      maxLines: 1,
                                                      style: CustomTextTheme
                                                          .subheadlineNS
                                                          .copyWith(
                                                              color: Theme.of(
                                                                      context)
                                                                  .disabledColor),
                                                    ),
                                                    const SizedBox(
                                                      height: 3,
                                                    ),
                                                    Text(
                                                      "+7 (999) 999-99-99",
                                                      maxLines: 1,
                                                      style: CustomTextTheme
                                                          .caption2MS
                                                          .copyWith(
                                                              color: Theme.of(
                                                                      context)
                                                                  .focusColor),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      "Почта",
                                                      maxLines: 1,
                                                      style: CustomTextTheme
                                                          .subheadlineNS
                                                          .copyWith(
                                                              color: Theme.of(
                                                                      context)
                                                                  .disabledColor),
                                                    ),
                                                    const SizedBox(
                                                      height: 3,
                                                    ),
                                                    Text(
                                                      "example@gmai.com",
                                                      maxLines: 1,
                                                      style: CustomTextTheme
                                                          .caption2MS
                                                          .copyWith(
                                                              color: Theme.of(
                                                                      context)
                                                                  .focusColor),
                                                    ),
                                                  ],
                                                )))),
                                    Card(
                                        elevation: 4,
                                        shadowColor: const Color(0xFF0C2975)
                                            .withOpacity(0.12),
                                        color: Theme.of(context).cardColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              12.0), //<-- SEE HERE
                                        ),
                                        child: InkWell(
                                            splashColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () => {},
                                            child: Padding(
                                                padding:
                                                    const EdgeInsets.all(16),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "Серия",
                                                              maxLines: 1,
                                                              style: CustomTextTheme
                                                                  .subheadlineNS
                                                                  .copyWith(
                                                                      color: Theme.of(
                                                                              context)
                                                                          .disabledColor),
                                                            ),
                                                            const SizedBox(
                                                              height: 3,
                                                            ),
                                                            Text(
                                                              "0000",
                                                              maxLines: 1,
                                                              style: CustomTextTheme
                                                                  .caption2MS
                                                                  .copyWith(
                                                                      color: Theme.of(
                                                                              context)
                                                                          .focusColor),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          width: 30,
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "Номер",
                                                              maxLines: 1,
                                                              style: CustomTextTheme
                                                                  .subheadlineNS
                                                                  .copyWith(
                                                                      color: Theme.of(
                                                                              context)
                                                                          .disabledColor),
                                                            ),
                                                            const SizedBox(
                                                              height: 3,
                                                            ),
                                                            Text(
                                                              "000000",
                                                              maxLines: 1,
                                                              style: CustomTextTheme
                                                                  .caption2MS
                                                                  .copyWith(
                                                                      color: Theme.of(
                                                                              context)
                                                                          .focusColor),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      "Кем выдан",
                                                      maxLines: 1,
                                                      style: CustomTextTheme
                                                          .subheadlineNS
                                                          .copyWith(
                                                              color: Theme.of(
                                                                      context)
                                                                  .disabledColor),
                                                    ),
                                                    const SizedBox(
                                                      height: 3,
                                                    ),
                                                    Text(
                                                      "Кем то мб выдан, а мб и не выдан",
                                                      maxLines: 2,
                                                      style: CustomTextTheme
                                                          .caption2MS
                                                          .copyWith(
                                                              color: Theme.of(
                                                                      context)
                                                                  .focusColor),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      "Кем Адрес регистрации",
                                                      maxLines: 1,
                                                      style: CustomTextTheme
                                                          .subheadlineNS
                                                          .copyWith(
                                                              color: Theme.of(
                                                                      context)
                                                                  .disabledColor),
                                                    ),
                                                    const SizedBox(
                                                      height: 3,
                                                    ),
                                                    Text(
                                                      "Москва",
                                                      maxLines: 2,
                                                      style: CustomTextTheme
                                                          .caption2MS
                                                          .copyWith(
                                                              color: Theme.of(
                                                                      context)
                                                                  .focusColor),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      "Код гражданства",
                                                      maxLines: 1,
                                                      style: CustomTextTheme
                                                          .subheadlineNS
                                                          .copyWith(
                                                              color: Theme.of(
                                                                      context)
                                                                  .disabledColor),
                                                    ),
                                                    const SizedBox(
                                                      height: 3,
                                                    ),
                                                    Text(
                                                      "Москва",
                                                      maxLines: 2,
                                                      style: CustomTextTheme
                                                          .caption2MS
                                                          .copyWith(
                                                              color: Theme.of(
                                                                      context)
                                                                  .focusColor),
                                                    ),
                                                  ],
                                                )))),
                                  ]),
                            ],
                          ),
                        ])))));
  }
}
