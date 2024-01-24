import 'package:agro_hack23/domain/entities/excursion.dart';
import 'package:agro_hack23/presentation/bloc/employees/employees_bloc.dart';
import 'package:agro_hack23/presentation/bloc/excursion/excursion_bloc.dart';
import 'package:agro_hack23/presentation/colors.dart';
import 'package:agro_hack23/presentation/provider/book_provider.dart';
import 'package:agro_hack23/presentation/provider/employee_add_provider.dart';
import 'package:agro_hack23/presentation/theme.dart';
import 'package:agro_hack23/presentation/widgets/app_expansion_tile.dart';
import 'package:agro_hack23/presentation/widgets/text_from_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:provider/provider.dart';

class EmployeeAddScreen extends StatefulWidget {
  const EmployeeAddScreen({Key? key}) : super(key: key);
  @override

  // ignore: library_private_types_in_public_api
  _EmployeeAddScreenScreenState createState() =>
      _EmployeeAddScreenScreenState();
}

class _EmployeeAddScreenScreenState extends State<EmployeeAddScreen> {
  bool valuedata = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _secondNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  String placevalue = '';
  String dropdownValue = '';
  String dropdownValue2 = '';
  int dropdownValueint = 0;
  int dropdownValueint2 = 0;

  late EmployeeProvider _formProvider;

  ///[Для отправки запросом нужен другой тип файла]
//   PlatformFile pdf;
// final File fileForFirebase = File(pdf.path);
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nameController.clear();
    _secondNameController.clear();
    _lastNameController.clear();
    _emailController.clear();
    _phoneController.clear();
    _passController.clear();
    _formProvider.disposeValues();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _formProvider = Provider.of<EmployeeProvider>(context);

    // return BlocConsumer<InvoiceInfoBloc, InvoiceInfoState>(
    //     listener: (context, state) {
    //   state.whenOrNull(loadingError: (cause) {
    //     context.pop();
    //   }, loadingSuccess: (user) {
    //     context.go('/services/serviceit/history/invoiceinfo');
    //   });
    // }, builder: (context, state) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar: CupertinoNavigationBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              border:
                  Border.all(color: Theme.of(context).scaffoldBackgroundColor),
              middle: RichText(
                  text: TextSpan(children: <TextSpan>[
                TextSpan(
                  text: "Персонал",
                  style: LightTextTheme.headline1NS.copyWith(
                      color: Theme.of(context).focusColor,
                      fontWeight: FontWeight.w600),
                ),
              ])),
              leading: CupertinoNavigationBarBackButton(
                onPressed: () {
                  context.pop();
                },
                color: const Color(0xFF808B9F),
              ),
            ),
            body: Column(children: [
              Expanded(
                  child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: SafeArea(
                          bottom: false,
                          child: LayoutBuilder(builder: (BuildContext context,
                              BoxConstraints viewportConstraints) {
                            return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.015),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.015),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 16),
                                            child: Text("Имя",
                                                style: DarkTextTheme.calloutNS
                                                    .copyWith(
                                                  color: Theme.of(context)
                                                      .focusColor,
                                                )),
                                          )),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.015),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8),
                                            child: LabelledInputTextOneSign(
                                              action: TextInputAction.next,
                                              placeholder: "Иван",
                                              keyboardType: TextInputType.text,
                                              controller: _nameController,
                                              obscureText: false,
                                              label: "",
                                              error: _formProvider.name.error,
                                              onChanged: (val) {
                                                setState(() {
                                                  _formProvider
                                                      .validateName(val);
                                                });
                                              },
                                            ),
                                          )),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.015),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 16),
                                            child: Text("Фамилия",
                                                style: DarkTextTheme.calloutNS
                                                    .copyWith(
                                                  color: Theme.of(context)
                                                      .focusColor,
                                                )),
                                          )),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.015),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8),
                                            child: LabelledInputTextOneSign(
                                              action: TextInputAction.next,
                                              placeholder: "Иванов",
                                              keyboardType: TextInputType.text,
                                              controller: _secondNameController,
                                              obscureText: false,
                                              label: "",
                                              error: _formProvider
                                                  .secondName.error,
                                              onChanged: (val) {
                                                setState(() {
                                                  _formProvider
                                                      .validateSecondName(val);
                                                });
                                              },
                                            ),
                                          )),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.015),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 16),
                                            child: Text("Отчество",
                                                style: DarkTextTheme.calloutNS
                                                    .copyWith(
                                                  color: Theme.of(context)
                                                      .focusColor,
                                                )),
                                          )),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.015),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8),
                                            child: LabelledInputTextOneSign(
                                              action: TextInputAction.next,
                                              placeholder: "Иванович",
                                              keyboardType: TextInputType.text,
                                              controller: _lastNameController,
                                              obscureText: false,
                                              label: "",
                                              error: _formProvider
                                                  .secondName.error,
                                              onChanged: (val) {
                                                setState(() {
                                                  _formProvider
                                                      .validateLastName(val);
                                                });
                                              },
                                            ),
                                          )),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.015),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 16),
                                            child: Text("Почта",
                                                style: DarkTextTheme.calloutNS
                                                    .copyWith(
                                                  color: Theme.of(context)
                                                      .focusColor,
                                                )),
                                          )),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.015),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8),
                                            child: LabelledInputTextOneSign(
                                              action: TextInputAction.next,
                                              placeholder: "email@email.com",
                                              keyboardType: TextInputType.text,
                                              controller: _emailController,
                                              obscureText: false,
                                              label: "",
                                              error: _formProvider.email.error,
                                              onChanged: (val) {
                                                setState(() {
                                                  _formProvider
                                                      .validateEmail(val);
                                                });
                                              },
                                            ),
                                          )),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.015),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 16),
                                            child: Text("Телефон",
                                                style: DarkTextTheme.calloutNS
                                                    .copyWith(
                                                  color: Theme.of(context)
                                                      .focusColor,
                                                )),
                                          )),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.015),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8),
                                            child: LabelledInputTextOneSign(
                                              action: TextInputAction.next,
                                              placeholder: "+7 7777777777",
                                              keyboardType:
                                                  TextInputType.number,
                                              controller: _phoneController,
                                              obscureText: false,
                                              label: "",
                                              error: _formProvider.phone.error,
                                              onChanged: (val) {
                                                setState(() {
                                                  _formProvider
                                                      .validatePhone(val);
                                                });
                                              },
                                            ),
                                          )),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.015),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 16),
                                            child: Text("Пароль",
                                                style: DarkTextTheme.calloutNS
                                                    .copyWith(
                                                  color: Theme.of(context)
                                                      .focusColor,
                                                )),
                                          )),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.015),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8),
                                            child: LabelledInputTextOneSign(
                                              action: TextInputAction.next,
                                              placeholder: "пароль",
                                              keyboardType: TextInputType.text,
                                              controller: _passController,
                                              obscureText: false,
                                              label: "",
                                              error: _formProvider.pass.error,
                                              onChanged: (val) {
                                                setState(() {
                                                  _formProvider
                                                      .validatePass(val);
                                                });
                                              },
                                            ),
                                          )),
                                    ]));
                          })))),
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 20),
                child: Consumer<EmployeeProvider>(
                    builder: (context, model, child) {
                  return ConstrainedBox(
                      constraints: BoxConstraints.tightFor(
                          width: MediaQuery.of(context).size.width * 0.95,
                          height: 60),
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
                            if (model.validate) {
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
                              } else {
                                return Theme.of(context).primaryColor;
                              }
                            } else {
                              return LightThemeColors.buttondisable;
                            }
                          }),
                          fixedSize: MaterialStateProperty.all(Size.fromWidth(
                              MediaQuery.of(context).size.width * 0.95)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                        onPressed: model.validate
                            ? () {
                                context
                                    .read<EmployeesBloc>()
                                    .add(EmployeeSend(data: {
                                      "first_name": _nameController.text,
                                      "middle_name": _secondNameController.text,
                                      "last_name": _lastNameController.text,
                                      "email": _emailController.text,
                                      "phone": _phoneController.text,
                                      "password": _passController.text,
                                      "role": "worker"
                                    }));
                                context.pop();
                              }
                            : () {},
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            "Отправить",
                            style: model.validate &&
                                    dropdownValueint > 0 &&
                                    dropdownValueint2 > 0
                                ? DarkTextTheme.bodyButtonNS.copyWith(
                                    color: Theme.of(context).focusColor)
                                : DarkTextTheme.bodyButtonNS.copyWith(
                                    color: Theme.of(context).cardColor),
                          ),
                        ),
                      ));
                }),
              )
            ])));
  }
}
