import 'package:agro_hack23/common/theme/theme.dart';
import 'package:agro_hack23/presentation/bloc/user/user_bloc.dart';
import 'package:agro_hack23/presentation/widgets/label_input.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class RegUserScreen extends StatefulWidget {
  const RegUserScreen({Key? key}) : super(key: key);

  @override
  State<RegUserScreen> createState() => _RegUserScreenState();
}

class _RegUserScreenState extends State<RegUserScreen> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool obscureText = false;

  // bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          state.whenOrNull(logInSuccess: (user) => context.go('/profile'));
        },
        child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Scaffold(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                appBar: CupertinoNavigationBar(
                  middle: const Text('Регистрация'),
                  leading: CupertinoNavigationBarBackButton(
                    onPressed: () {
                      // Navigator.pop(context);
                    },
                    color: const Color(0xFF808B9F),
                  ),
                ),
                body: SafeArea(
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
                              fontWeight: FontWeight.w400,
                              //height: 24,
                              letterSpacing: -0.44,
                            ),
                          ),
                          barBackgroundColor: Colors.white,
                        ),
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.025,
                                vertical: 20),
                            child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                child: SizedBox(
                                    height: MediaQuery.of(context).size.height -
                                        MediaQuery.of(context).padding.top -
                                        CupertinoNavigationBar(
                                          middle: const Text('Регистрация'),
                                          leading:
                                              CupertinoNavigationBarBackButton(
                                            onPressed: () {
                                              // Navigator.pop(context);
                                            },
                                            color: const Color(0xFF808B9F),
                                          ),
                                        ).preferredSize.height,
                                    child: Column(
                                      // mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.005),
                                          child: SvgPicture.asset(
                                              'assets/images/logo.svg'),
                                        ),
                                        const SizedBox(height: 28),
                                        Text(
                                          "Регистрация",
                                          style: CustomTextTheme
                                              .subheadlineButtonMS
                                              .copyWith(
                                                  color: Theme.of(context)
                                                      .disabledColor),
                                        ),
                                        const SizedBox(height: 28),
                                        LabelledInput(
                                            placeholder: "Фамилия",
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            controller: _surnameController,
                                            obscureText: obscureText,
                                            label: ""),
                                        const SizedBox(height: 20),
                                        LabelledInput(
                                            placeholder: "Имя",
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            controller: _nameController,
                                            obscureText: obscureText,
                                            label: ""),
                                        const SizedBox(height: 20),
                                        LabelledInput(
                                            placeholder: "Отчество",
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            controller: _lastnameController,
                                            obscureText: obscureText,
                                            label: ""),
                                        const SizedBox(height: 20),
                                        LabelledInput(
                                            placeholder: "Телефон",
                                            keyboardType: TextInputType.phone,
                                            controller: _phoneController,
                                            obscureText: obscureText,
                                            label: ""),
                                        const SizedBox(height: 20),
                                        LabelledInput(
                                            placeholder: "Логин",
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            controller: _loginController,
                                            obscureText: obscureText,
                                            label: ""),
                                        const SizedBox(height: 20),
                                        LabelledInput(
                                            placeholder: "Пароль",
                                            keyboardType: TextInputType.text,
                                            controller: _passController,
                                            obscureText: obscureText,
                                            label: "Ваш Пароль"),
                                        const Expanded(child: SizedBox()),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: ConstrainedBox(
                                              constraints:
                                                  BoxConstraints.tightFor(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.925,
                                                      height: 48),
                                              child: ElevatedButton(
                                                style: ButtonStyle(
                                                  splashFactory:
                                                      NoSplash.splashFactory,
                                                  surfaceTintColor:
                                                      MaterialStateProperty.all(
                                                          Colors.transparent),
                                                  shadowColor:
                                                      MaterialStateProperty.all(
                                                          Colors.transparent),
                                                  elevation:
                                                      MaterialStateProperty.all(
                                                          0),
                                                  overlayColor:
                                                      MaterialStateProperty.all(
                                                          Colors.transparent),
                                                  backgroundColor:
                                                      MaterialStateProperty
                                                          .resolveWith<
                                                              Color>((Set<
                                                                  MaterialState>
                                                              states) {
                                                    if (states.contains(
                                                        MaterialState
                                                            .pressed)) {
                                                      return Theme.of(context)
                                                          .primaryColor
                                                          .withRed((Theme.of(
                                                                          context)
                                                                      .primaryColor
                                                                      .red *
                                                                  0.95)
                                                              .round())
                                                          .withGreen((Theme.of(
                                                                          context)
                                                                      .primaryColor
                                                                      .green *
                                                                  0.95)
                                                              .round())
                                                          .withBlue((Theme.of(
                                                                          context)
                                                                      .primaryColor
                                                                      .blue *
                                                                  0.95)
                                                              .round());
                                                    }
                                                    return Theme.of(context)
                                                        .primaryColor;
                                                  }),
                                                  fixedSize: MaterialStateProperty
                                                      .all(Size.fromWidth(
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.925)),
                                                  shape:
                                                      MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  context.read<UserBloc>().add(
                                                      UserEvent.signUp(
                                                          _loginController.text,
                                                          _passController.text,
                                                          _nameController.text,
                                                          _surnameController
                                                              .text,
                                                          _lastnameController
                                                              .text,
                                                          _phoneController
                                                              .text));
                                                  // context.router
                                                  //     .replace(HomeRoute());
                                                },
                                                child: FittedBox(
                                                  fit: BoxFit.contain,
                                                  child: Text(
                                                    "Зарегистрироваться",
                                                    style: CustomTextTheme
                                                        .bodyButtonNS
                                                        .copyWith(
                                                            color: Theme.of(
                                                                    context)
                                                                .cardColor),
                                                  ),
                                                ),
                                              )),
                                        )
                                      ],
                                    )))))))));
  }
}
