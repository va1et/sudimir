import 'package:agro_hack23/domain/entities/user.dart';
import 'package:agro_hack23/presentation/bloc/user/user_bloc.dart';
import 'package:agro_hack23/presentation/theme.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:agro_hack23/presentation/pages/profile/about_app_page.dart';
import 'package:agro_hack23/presentation/pages/profile/profile_user_business_page.dart';
import 'package:agro_hack23/presentation/pages/profile/profile_user_info_page.dart';
import 'package:agro_hack23/presentation/widgets/profile_card.dart';
import 'package:agro_hack23/presentation/widgets/service_card.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override

  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final bool show = true;
  static const List<String> names = [
    'Фамилия Имя Отчество',
    'Бизнесы',
    'О приложении',
  ];
  static const List<Widget?> screens = [
    ProfileUserInfoScreen(),
    ProfileUserBusinessScreen(),
    AboutAppScreen()
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return BlocBuilder<LibBooksBloc, LibBooksState>(builder: (context, state) {
    //   print(state);
    //   if (state is LibBooksLoading) {

    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return state.map(
            unauthorized: (_) => Container(),
            loading: (_) => Container(),
            logInError: (st) => Container(),
            logInSuccess: (st) => CupertinoPageScaffold(
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
                            headerSliverBuilder: (BuildContext context,
                                bool innerBoxIsScrolled) {
                              return [
                                const CupertinoSliverNavigationBar(
                                    largeTitle: Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    "Профиль",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                )),
                              ];
                            },
                            body: ListView(
                                physics: const BouncingScrollPhysics(),
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.025,
                                    vertical: 20),
                                children: <Widget>[
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0),
                                      child: SizedBox(
                                          child: Card(
                                              elevation: 4,
                                              shadowColor:
                                                  const Color(0xFF0C2975)
                                                      .withOpacity(0.12),
                                              color:
                                                  Theme.of(context).cardColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        12.0), //<-- SEE HERE
                                              ),
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(16),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'ФИО',
                                                              style: DarkTextTheme
                                                                  .headline1NS
                                                                  .copyWith(
                                                                color: Theme.of(
                                                                        context)
                                                                    .focusColor,
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding: EdgeInsets.only(
                                                                    top: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.025),
                                                                child: Text(
                                                                  "${st.user.name} ${st.user.secondName} ${st.user.lastName}" ??
                                                                      '',
                                                                  style: DarkTextTheme
                                                                      .calloutNS
                                                                      .copyWith(
                                                                          color:
                                                                              Theme.of(context).focusColor),
                                                                )),
                                                          ]),
                                                    ],
                                                  ))))),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0),
                                      child: SizedBox(
                                          child: Card(
                                              elevation: 4,
                                              shadowColor:
                                                  const Color(0xFF0C2975)
                                                      .withOpacity(0.12),
                                              color:
                                                  Theme.of(context).cardColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        12.0), //<-- SEE HERE
                                              ),
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(16),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Почта',
                                                              style: DarkTextTheme
                                                                  .headline1NS
                                                                  .copyWith(
                                                                color: Theme.of(
                                                                        context)
                                                                    .focusColor,
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding: EdgeInsets.only(
                                                                    top: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.025),
                                                                child: Text(
                                                                  st.user.email ??
                                                                      '',
                                                                  style: DarkTextTheme
                                                                      .calloutNS
                                                                      .copyWith(
                                                                          color:
                                                                              Theme.of(context).focusColor),
                                                                )),
                                                          ]),
                                                    ],
                                                  ))))),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0),
                                      child: SizedBox(
                                          child: Card(
                                              elevation: 4,
                                              shadowColor:
                                                  const Color(0xFF0C2975)
                                                      .withOpacity(0.12),
                                              color:
                                                  Theme.of(context).cardColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        12.0), //<-- SEE HERE
                                              ),
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(16),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Телефон',
                                                              style: DarkTextTheme
                                                                  .headline1NS
                                                                  .copyWith(
                                                                color: Theme.of(
                                                                        context)
                                                                    .focusColor,
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding: EdgeInsets.only(
                                                                    top: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.025),
                                                                child: Text(
                                                                  st.user.phone ??
                                                                      '',
                                                                  style: DarkTextTheme
                                                                      .calloutNS
                                                                      .copyWith(
                                                                          color:
                                                                              Theme.of(context).focusColor),
                                                                )),
                                                          ]),
                                                    ],
                                                  ))))),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.005),
                                      child: TextButton(
                                        style: ButtonStyle(
                                          overlayColor:
                                              MaterialStateProperty.all(
                                                  Colors.transparent),
                                          foregroundColor: MaterialStateProperty
                                              .resolveWith<Color>(
                                                  (Set<MaterialState> states) {
                                            if (states.contains(
                                                MaterialState.pressed)) {
                                              return const Color(0XffFF3B30)
                                                  .withRed(
                                                      (const Color(0XffFF3B30)
                                                                  .red *
                                                              0.85)
                                                          .round())
                                                  .withGreen(
                                                      (const Color(0XffFF3B30)
                                                                  .green *
                                                              0.85)
                                                          .round())
                                                  .withBlue(
                                                      (const Color(0XffFF3B30)
                                                                  .blue *
                                                              0.85)
                                                          .round());
                                            }
                                            return const Color(0XffFF3B30);
                                          }),
                                        ),
                                        onPressed: () {
                                          context
                                              .read<UserBloc>()
                                              .add(const UserEvent.logOut());
                                          context.go('/login');
                                        },
                                        child: const FittedBox(
                                          fit: BoxFit.contain,
                                          child: Text("Выход",
                                              style: DarkTextTheme
                                                  .subheadlineButtonNS),
                                        ),
                                      ))
                                ]))))));
      },
    );
  }
}
