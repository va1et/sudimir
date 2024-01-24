import 'package:agro_hack23/domain/entities/excursion.dart';
import 'package:agro_hack23/presentation/bloc/book/book_bloc.dart';
import 'package:agro_hack23/presentation/bloc/customers/customers_bloc.dart';
import 'package:agro_hack23/presentation/bloc/employees/employees_bloc.dart';
import 'package:agro_hack23/presentation/bloc/excursion/excursion_bloc.dart';
import 'package:agro_hack23/presentation/bloc/user/user_bloc.dart';
import 'package:agro_hack23/presentation/colors.dart';
import 'package:agro_hack23/presentation/widgets/test.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:agro_hack23/common/theme/theme.dart';
import 'package:agro_hack23/presentation/widgets/service_card.dart';
import 'package:go_router/go_router.dart';

@RoutePage(
  name: 'ServicesRouter',
)
class ServicesScreen extends StatefulWidget {
  const ServicesScreen({
    Key? key,
  }) : super(key: key);

  @override

  // ignore: library_private_types_in_public_api
  _ServicesScreenState createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  final bool show = true;

  late dynamic funcs;
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
                        const CupertinoSliverNavigationBar(
                          largeTitle: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Услуги",
                              )),
                        ),
                      ];
                    },
                    body: BlocBuilder<UserBloc, UserState>(
                        builder: (context, state) {
                      return state.when(
                          unauthorized: () => Container(),
                          loading: () => Container(),
                          logInError: (c) => Container(),
                          logInSuccess: (st) {
                            return ListView(
                                physics: const BouncingScrollPhysics(),
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.025,
                                    vertical: 20),
                                children: <Widget>[
                                  Column(
                                    // mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      GridView(
                                        shrinkWrap: true,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          mainAxisExtent: 145,
                                          crossAxisSpacing: 13,
                                          mainAxisSpacing: 13,
                                        ),
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        children: [
                                          SizedBox(
                                              height:
                                                  120, // Здесь задайте желаемую высоту элемента
                                              child: Card(
                                                  elevation: 4,
                                                  shadowColor:
                                                      const Color(0xFF0C2975)
                                                          .withOpacity(0.12),
                                                  color: Theme.of(context)
                                                      .cardColor,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0), //<-- SEE HERE
                                                  ),
                                                  child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () {
                                                        context
                                                            .read<BookBloc>()
                                                            .add(
                                                                const BookGet());

                                                        context.push(
                                                            '/services/books');
                                                        context
                                                            .read<
                                                                ExcursionBloc>()
                                                            .add(
                                                                const ExcursionGet());
                                                      },
                                                      child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(16),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              const Icon(
                                                                CupertinoIcons
                                                                    .doc_chart,
                                                                color: LightThemeColors
                                                                    .colorful01,
                                                              ),
                                                              const SizedBox(
                                                                height: 34,
                                                              ),
                                                              AutoSizeText(
                                                                maxLines: 2,
                                                                'Бронирования',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: CustomTextTheme
                                                                    .caption2MS
                                                                    .copyWith(
                                                                        color: Theme.of(context)
                                                                            .focusColor),
                                                              ),
                                                            ],
                                                          ))))),
                                          SizedBox(
                                              height:
                                                  120, // Здесь задайте желаемую высоту элемента
                                              child: Card(
                                                  elevation: 4,
                                                  shadowColor:
                                                      const Color(0xFF0C2975)
                                                          .withOpacity(0.12),
                                                  color: Theme.of(context)
                                                      .cardColor,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0), //<-- SEE HERE
                                                  ),
                                                  child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () {
                                                        context
                                                            .read<
                                                                ExcursionBloc>()
                                                            .add(
                                                                const ExcursionGet());
                                                        context.push(
                                                            '/services/ecursions');
                                                      },
                                                      child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(16),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              const Icon(
                                                                CupertinoIcons
                                                                    .calendar_badge_plus,
                                                                color: LightThemeColors
                                                                    .colorful02,
                                                              ),
                                                              const SizedBox(
                                                                height: 34,
                                                              ),
                                                              AutoSizeText(
                                                                maxLines: 2,
                                                                'Экскурсии',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: CustomTextTheme
                                                                    .caption2MS
                                                                    .copyWith(
                                                                        color: Theme.of(context)
                                                                            .focusColor),
                                                              ),
                                                            ],
                                                          ))))),
                                          st.role == "admin"
                                              ? SizedBox(
                                                  height:
                                                      120, // Здесь задайте желаемую высоту элемента
                                                  child: Card(
                                                      elevation: 4,
                                                      shadowColor: const Color(
                                                              0xFF0C2975)
                                                          .withOpacity(0.12),
                                                      color: Theme.of(context)
                                                          .cardColor,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                12.0), //<-- SEE HERE
                                                      ),
                                                      child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () {
                                                            print("empl");
                                                            context
                                                                .read<
                                                                    EmployeesBloc>()
                                                                .add(
                                                                    const EmployeesGet());
                                                            context.push(
                                                                '/services/personals');
                                                          },
                                                          child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(16),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  const Icon(
                                                                    CupertinoIcons
                                                                        .group,
                                                                    color: LightThemeColors
                                                                        .colorful03,
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 34,
                                                                  ),
                                                                  AutoSizeText(
                                                                    maxLines: 2,
                                                                    'Персонал',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: CustomTextTheme
                                                                        .caption2MS
                                                                        .copyWith(
                                                                            color:
                                                                                Theme.of(context).focusColor),
                                                                  ),
                                                                ],
                                                              )))))
                                              : const SizedBox(),
                                          st.role == "admin"
                                              ? SizedBox(
                                                  height:
                                                      120, // Здесь задайте желаемую высоту элемента
                                                  child: Card(
                                                      elevation: 4,
                                                      shadowColor: const Color(
                                                              0xFF0C2975)
                                                          .withOpacity(0.12),
                                                      color: Theme.of(context)
                                                          .cardColor,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                12.0), //<-- SEE HERE
                                                      ),
                                                      child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () {
                                                            print("cust");
                                                            context
                                                                .read<
                                                                    CustomersBloc>()
                                                                .add(
                                                                    const CustomersGet());
                                                            context.push(
                                                                '/services/users');
                                                          },
                                                          child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(16),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  const Icon(
                                                                    CupertinoIcons
                                                                        .money_dollar,
                                                                    color: LightThemeColors
                                                                        .buttonchosen,
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 34,
                                                                  ),
                                                                  AutoSizeText(
                                                                    maxLines: 2,
                                                                    'Пользователи',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: CustomTextTheme
                                                                        .caption2MS
                                                                        .copyWith(
                                                                            color:
                                                                                Theme.of(context).focusColor),
                                                                  ),
                                                                ],
                                                              )))))
                                              : const SizedBox(),
                                        ],
                                      ),
                                    ],
                                  ),
                                ]);
                          });
                    })))));
  }
}
