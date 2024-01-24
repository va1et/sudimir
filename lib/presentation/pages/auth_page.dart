import 'package:agro_hack23/presentation/theme.dart';
import 'package:agro_hack23/presentation/widgets/nfc_modal.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:agro_hack23/common/theme/theme.dart';
import 'package:agro_hack23/presentation/bloc/user/user_bloc.dart';
import 'package:agro_hack23/presentation/pages/home_page.dart';
import 'package:agro_hack23/presentation/widgets/label_input.dart';
import 'package:agro_hack23/presentation/widgets/text_button.dart';
import 'package:go_router/go_router.dart';

class AuthUserScreen extends StatefulWidget {
  const AuthUserScreen({Key? key}) : super(key: key);

  @override
  State<AuthUserScreen> createState() => _AuthUserScreenState();
}

class _AuthUserScreenState extends State<AuthUserScreen> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  bool obscureText = false;
  String nfcTagData = "";

  void setNfcTagData(String data) {
    setState(() {
      _passController.text = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          print(state);
          state.whenOrNull(
              logInSuccess: (user) => context.go('/profile'),
              logInError: (cause) {
                context.pop();

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  duration: const Duration(seconds: 1),
                  backgroundColor: const Color(0XffFF3B30),
                  content: Text(
                    cause,
                    textAlign: TextAlign.center,
                    style: LightTextTheme.subheadlineNS.copyWith(
                        color: Theme.of(context).focusColor,
                        fontWeight: FontWeight.w600),
                  ),
                  behavior: SnackBarBehavior.floating,
                  margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height - 200,
                    left: MediaQuery.of(context).size.width * 0.025,
                    right: MediaQuery.of(context).size.width * 0.025,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 8.0,
                ));
              },
              loading: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return AlertDialog(
                        insetPadding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.38,
                            vertical: 24.0),
                        alignment: Alignment.center,
                        backgroundColor: Theme.of(context).cardColor,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        content:
                            // Get available height and width of the build area of this widget. Make a choice depending on the size.

                            SizedBox(
                          width: 40,
                          height: 40,
                          child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Center(
                                  child: CupertinoActivityIndicator(
                                color: Theme.of(context).focusColor,
                                radius: 20,
                              ))),
                        ));
                  },
                );
              });
        },
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.1),
                      child: Image.asset('assets/images/logo.png'),
                    ),
                    const SizedBox(height: 25),
                    const SizedBox(height: 30),
                    LabelledInput(
                        placeholder: "Логин",
                        keyboardType: TextInputType.emailAddress,
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
                    const SizedBox(height: 30),
                    ConstrainedBox(
                        constraints: BoxConstraints.tightFor(
                            width: MediaQuery.of(context).size.width * 0.925,
                            height: 48),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            splashFactory: NoSplash.splashFactory,
                            surfaceTintColor:
                                MaterialStateProperty.all(Colors.transparent),
                            shadowColor:
                                MaterialStateProperty.all(Colors.transparent),
                            elevation: MaterialStateProperty.all(0),
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Theme.of(context)
                                    .primaryColor
                                    .withRed(
                                        (Theme.of(context).primaryColor.red *
                                                0.95)
                                            .round())
                                    .withGreen(
                                        (Theme.of(context).primaryColor.green *
                                                0.95)
                                            .round())
                                    .withBlue(
                                        (Theme.of(context).primaryColor.blue *
                                                0.95)
                                            .round());
                              }
                              return Theme.of(context).primaryColor;
                            }),
                            fixedSize: MaterialStateProperty.all(Size.fromWidth(
                                MediaQuery.of(context).size.width * 0.925)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            context.read<UserBloc>().add(UserEvent.logIn(
                                _loginController.text, _passController.text));
                            //context.router.replace(HomeRoute());
                          },
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              "Войти",
                              style: CustomTextTheme.bodyButtonNS
                                  .copyWith(color: Theme.of(context).cardColor),
                            ),
                          ),
                        )),
                    const SizedBox(
                      height: 24,
                    ),
                    // Textbutton(
                    //     onPressed: () {
                    //       showModalBottomSheet(
                    //           context: context,
                    //           isDismissible: false,
                    //           isScrollControlled: true,
                    //           useRootNavigator: true,
                    //           backgroundColor: Colors.transparent,
                    //           builder: (context) => NfcModal(
                    //                 onTagDataReceived: setNfcTagData,
                    //               ));
                    //     },
                    //     text: "Регистрация",
                    //     color: Theme.of(context).primaryColor),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  void _showAlertDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Вы ранее регистрировались?'),
        content: const Text(
            'Если у вас есть учётная запись, воспользуйтесь входом или восстановлением пароля,чтобы получить доступ к услугам'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            onPressed: () {},
            child: const Text('Зарегистрироваться'),
          ),
          CupertinoDialogAction(
            child: const Text("Отмена",
                style: TextStyle(fontWeight: FontWeight.w500)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
