import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:agro_hack23/presentation/pages/profile/profile_user_business_info_page.dart';
import 'package:agro_hack23/presentation/pages/profile/profile_user_info_page.dart';
import 'package:agro_hack23/presentation/widgets/profile_card.dart';

class ProfileUserBusinessScreen extends StatefulWidget {
  const ProfileUserBusinessScreen({
    Key? key,
  }) : super(key: key);

  @override

  // ignore: library_private_types_in_public_api
  _ProfileUserBusinessScreenState createState() =>
      _ProfileUserBusinessScreenState();
}

class _ProfileUserBusinessScreenState extends State<ProfileUserBusinessScreen> {
  final bool show = true;
  static const List<String> names = [
    'ООО ТСА',
    'ООО ТСА2',
    'ООО ТСА3',
  ];
  static const List<Widget?> screens = [
    ProfileUserBusinessInfoScreen(),
    ProfileUserBusinessInfoScreen(),
    ProfileUserBusinessInfoScreen(),
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
                          leading: CupertinoNavigationBarBackButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            color: const Color(0xFF808B9F),
                          ),
                          largeTitle: const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Бизнес",
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
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 3,
                                itemBuilder: (_, index) => SizedBox(
                                  height:
                                      68, // Здесь задайте желаемую высоту элемента
                                  child: ProfileCard(
                                    icon: null,
                                    screen: screens[index],
                                    text: names[index],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ])))));
  }
}
