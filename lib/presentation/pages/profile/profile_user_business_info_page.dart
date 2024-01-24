import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:agro_hack23/common/theme/theme.dart';

class ProfileUserBusinessInfoScreen extends StatefulWidget {
  const ProfileUserBusinessInfoScreen({
    Key? key,
  }) : super(key: key);

  @override

  // ignore: library_private_types_in_public_api
  _ProfileUserBusinessInfoScreenState createState() =>
      _ProfileUserBusinessInfoScreenState();
}

class _ProfileUserBusinessInfoScreenState
    extends State<ProfileUserBusinessInfoScreen> {
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
                                "Данные о бизнесе",
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
                                                      "Название",
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
                                                      "ООО ТСА",
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
                                                      "Адрес",
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
                                                      "Адрес",
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
                                                      "Классификация деятельности",
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
                                                      "Тяжелая промышленность",
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
                                                      "Виды деятельности",
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
                                                      "код вид деятельности",
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
                                  ]),
                            ],
                          ),
                        ])))));
  }
}
