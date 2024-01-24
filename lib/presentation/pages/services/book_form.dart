import 'package:agro_hack23/domain/entities/excursion.dart';
import 'package:agro_hack23/presentation/bloc/book/book_bloc.dart';
import 'package:agro_hack23/presentation/bloc/excursion/excursion_bloc.dart';
import 'package:agro_hack23/presentation/colors.dart';
import 'package:agro_hack23/presentation/provider/book_provider.dart';
import 'package:agro_hack23/presentation/theme.dart';
import 'package:agro_hack23/presentation/widgets/app_expansion_tile.dart';
import 'package:agro_hack23/presentation/widgets/label_input.dart';
import 'package:agro_hack23/presentation/widgets/service_date_picker.dart';
import 'package:agro_hack23/presentation/widgets/text_from_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);
  @override

  // ignore: library_private_types_in_public_api
  _SpravkaScreenScreenState createState() => _SpravkaScreenScreenState();
}

class _SpravkaScreenScreenState extends State<BookingScreen> {
  bool valuedata = false;
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<AppExpansionTileState> expansionTile = GlobalKey();
  final GlobalKey<AppExpansionTileState> expansionTile2 = GlobalKey();
  final TextEditingController _personsController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _secondNameController = TextEditingController();

  final TextEditingController _lastNameController = TextEditingController();

  String placevalue = '';
  String dropdownValue = '';
  String dropdownValue2 = '';
  int dropdownValueint = 0;
  int dropdownValueint2 = 0;
  late List<Excursion> services;
  late BookProvider _formProvider;

  ///[Для отправки запросом нужен другой тип файла]
//   PlatformFile pdf;
// final File fileForFirebase = File(pdf.path);
  @override
  void initState() {
    super.initState();
    services = ExcursionBloc.excursionlist ?? [];
  }

  @override
  void dispose() {
    _personsController.clear();
    _nameController.clear();
    _lastNameController.clear();
    _secondNameController.clear();
    _phoneController.clear();
    _dateController.clear();
    _timeController.clear();
    _formProvider.disposeValues();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _formProvider = Provider.of<BookProvider>(context);
    _personsController.text = _formProvider.persons.value ?? "";

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
                  text: "Бронирование",
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
                                      services.isNotEmpty
                                          ? Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.015),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 16),
                                                child: Text("Тип Статуса",
                                                    style: DarkTextTheme
                                                        .calloutNS
                                                        .copyWith(
                                                      color: Theme.of(context)
                                                          .focusColor,
                                                    )),
                                              ))
                                          : const SizedBox(),
                                      services.isNotEmpty
                                          ? Padding(
                                              padding: const EdgeInsets
                                                  .symmetric(horizontal: 0),
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 3),
                                                  child: Card(
                                                      elevation: 0,
                                                      color: Theme.of(context)
                                                          .primaryColorDark,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                12.0), //<-- SEE HERE
                                                      ),
                                                      child: Theme(
                                                          data: ThemeData(
                                                            splashColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                          ).copyWith(
                                                              dividerColor: Colors
                                                                  .transparent),
                                                          child:
                                                              AppExpansionTile(
                                                                  key:
                                                                      expansionTile,
                                                                  title: Text(
                                                                      dropdownValue,
                                                                      style: DarkTextTheme
                                                                          .calloutNS
                                                                          .copyWith(
                                                                        color: Theme.of(context)
                                                                            .focusColor,
                                                                      )),
                                                                  children: <Widget>[
                                                                SizedBox(
                                                                    width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width,
                                                                    child: Padding(
                                                                        padding: const EdgeInsets.only(top: 8),
                                                                        child: InkWell(
                                                                            borderRadius: BorderRadius.circular(12.0),
                                                                            splashColor: Colors.transparent,
                                                                            hoverColor: Colors.transparent,
                                                                            highlightColor: Colors.transparent,
                                                                            focusColor: Colors.transparent,
                                                                            onTap: () {
                                                                              setState(() {
                                                                                dropdownValueint = 1;
                                                                                expansionTile.currentState?.collapse();
                                                                                dropdownValue = "pending";
                                                                              });
                                                                            },
                                                                            child: Padding(
                                                                                padding: const EdgeInsets.symmetric(horizontal: 6),
                                                                                child: Text(
                                                                                  "Рассматриваемый",
                                                                                  style: DarkTextTheme.calloutNS.copyWith(
                                                                                    color: Theme.of(context).focusColor,
                                                                                  ),
                                                                                ))))),
                                                                SizedBox(
                                                                    width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width,
                                                                    child: Padding(
                                                                        padding: const EdgeInsets.only(top: 8),
                                                                        child: InkWell(
                                                                            borderRadius: BorderRadius.circular(12.0),
                                                                            splashColor: Colors.transparent,
                                                                            hoverColor: Colors.transparent,
                                                                            highlightColor: Colors.transparent,
                                                                            focusColor: Colors.transparent,
                                                                            onTap: () {
                                                                              setState(() {
                                                                                dropdownValueint = 2;
                                                                                expansionTile.currentState?.collapse();
                                                                                dropdownValue = "confirmed";
                                                                              });
                                                                            },
                                                                            child: Padding(
                                                                                padding: const EdgeInsets.symmetric(horizontal: 6),
                                                                                child: Text(
                                                                                  "Подтверждено",
                                                                                  style: DarkTextTheme.calloutNS.copyWith(
                                                                                    color: Theme.of(context).focusColor,
                                                                                  ),
                                                                                ))))),
                                                                SizedBox(
                                                                    width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width,
                                                                    child: Padding(
                                                                        padding: const EdgeInsets.only(top: 8),
                                                                        child: InkWell(
                                                                            borderRadius: BorderRadius.circular(12.0),
                                                                            splashColor: Colors.transparent,
                                                                            hoverColor: Colors.transparent,
                                                                            highlightColor: Colors.transparent,
                                                                            focusColor: Colors.transparent,
                                                                            onTap: () {
                                                                              setState(() {
                                                                                dropdownValueint = 3;
                                                                                expansionTile.currentState?.collapse();
                                                                                dropdownValue = "cancelled";
                                                                              });
                                                                            },
                                                                            child: Padding(
                                                                                padding: const EdgeInsets.symmetric(horizontal: 6),
                                                                                child: Text(
                                                                                  "Отменен",
                                                                                  style: DarkTextTheme.calloutNS.copyWith(
                                                                                    color: Theme.of(context).focusColor,
                                                                                  ),
                                                                                ))))),
                                                              ])))))
                                          : const SizedBox(),
                                      services.isNotEmpty
                                          ? Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.015),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 16),
                                                child: Text("Тип Экскурсии",
                                                    style: DarkTextTheme
                                                        .calloutNS
                                                        .copyWith(
                                                      color: Theme.of(context)
                                                          .focusColor,
                                                    )),
                                              ))
                                          : const SizedBox(),

                                      services.isNotEmpty
                                          ? Padding(
                                              padding: const EdgeInsets
                                                  .symmetric(horizontal: 0),
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 3),
                                                  child: Card(
                                                      elevation: 0,
                                                      color: Theme.of(context)
                                                          .primaryColorDark,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                12.0), //<-- SEE HERE
                                                      ),
                                                      child: Theme(
                                                          data: ThemeData(
                                                            splashColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                          ).copyWith(
                                                              dividerColor: Colors
                                                                  .transparent),
                                                          child:
                                                              AppExpansionTile(
                                                            key: expansionTile2,
                                                            title: Text(
                                                                services[
                                                                        dropdownValueint2]
                                                                    .name,
                                                                style: DarkTextTheme
                                                                    .calloutNS
                                                                    .copyWith(
                                                                  color: Theme.of(
                                                                          context)
                                                                      .focusColor,
                                                                )),
                                                            children: services
                                                                .map((value) {
                                                              return SizedBox(
                                                                  width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                                  child: Padding(
                                                                      padding: const EdgeInsets.only(top: 8),
                                                                      child: InkWell(
                                                                          borderRadius: BorderRadius.circular(12.0),
                                                                          splashColor: Colors.transparent,
                                                                          hoverColor: Colors.transparent,
                                                                          highlightColor: Colors.transparent,
                                                                          focusColor: Colors.transparent,
                                                                          onTap: () {
                                                                            setState(() {
                                                                              dropdownValueint2 = services.indexOf(value);
                                                                              expansionTile2.currentState?.collapse();
                                                                              dropdownValue2 = value.id;
                                                                            });
                                                                          },
                                                                          child: Padding(
                                                                              padding: const EdgeInsets.symmetric(horizontal: 6),
                                                                              child: Text(
                                                                                value.name,
                                                                                style: DarkTextTheme.calloutNS.copyWith(
                                                                                  color: Theme.of(context).focusColor,
                                                                                ),
                                                                              )))));
                                                            }).toList(),
                                                          )))))
                                          : const SizedBox(),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.015),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 16),
                                            child: Text("Количество людей",
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
                                                  action: TextInputAction.done,
                                                  placeholder: "2",
                                                  keyboardType:
                                                      TextInputType.number,
                                                  controller:
                                                      _personsController,
                                                  obscureText: false,
                                                  label: "",
                                                  error: _formProvider
                                                      .persons.error,
                                                  onChanged: (val) {
                                                    setState(() {
                                                      _formProvider
                                                          .validatePerson(val);
                                                    });
                                                  }))),

                                      // Padding(
                                      //     padding: EdgeInsets.symmetric(
                                      //         horizontal: MediaQuery.of(context)
                                      //                 .size
                                      //                 .width *
                                      //             0.015),
                                      //     child: Padding(
                                      //       padding:
                                      //           const EdgeInsets.only(top: 16),
                                      //       child: Text('дата бронирования',
                                      //           style: DarkTextTheme.calloutNS
                                      //               .copyWith(
                                      //             color: Theme.of(context)
                                      //                 .focusColor,
                                      //           )),
                                      //     )),
                                      // Padding(
                                      //     padding: EdgeInsets.symmetric(
                                      //         horizontal: MediaQuery.of(context)
                                      //                 .size
                                      //                 .width *
                                      //             0.015),
                                      //     child: Padding(
                                      //         padding:
                                      //             const EdgeInsets.only(top: 0),
                                      //         child: Row(
                                      //           mainAxisAlignment:
                                      //               MainAxisAlignment
                                      //                   .spaceBetween,
                                      //           children: [
                                      //             Expanded(
                                      //               child: LabelledInputDate(
                                      //                   action: TextInputAction
                                      //                       .next,
                                      //                   controller:
                                      //                       _dateController,
                                      //                   keyboardType:
                                      //                       TextInputType
                                      //                           .number,
                                      //                   placeholder:
                                      //                       'ДД.ММ.ГГГГ',
                                      //                   error: _formProvider
                                      //                       .date.error,
                                      //                   onChanged: (val) {
                                      //                     setState(() {
                                      //                       _formProvider
                                      //                           .validateDate(
                                      //                               val);
                                      //                     });
                                      //                   }),
                                      //             ),
                                      //             SizedBox(
                                      //                 width: 60,
                                      //                 height: 60,
                                      //                 child: Card(
                                      //                     elevation: 4,
                                      //                     shadowColor:
                                      //                         const Color(
                                      //                                 0xFF0C2975)
                                      //                             .withOpacity(
                                      //                                 0.12),
                                      //                     color:
                                      //                         Theme.of(context)
                                      //                             .cardColor,
                                      //                     shape:
                                      //                         RoundedRectangleBorder(
                                      //                       borderRadius:
                                      //                           BorderRadius
                                      //                               .circular(
                                      //                                   12.0), //<-- SEE HERE
                                      //                     ),
                                      //                     child: Theme(
                                      //                         data: ThemeData(
                                      //                           splashColor: Colors
                                      //                               .transparent,
                                      //                           hoverColor: Colors
                                      //                               .transparent,
                                      //                           focusColor: Colors
                                      //                               .transparent,
                                      //                           highlightColor:
                                      //                               Colors
                                      //                                   .transparent,
                                      //                         ),
                                      //                         child: IconButton(
                                      //                           icon: SvgPicture
                                      //                               .asset(
                                      //                                   'assets/icon/calendarpick.svg'),
                                      //                           iconSize: 20,
                                      //                           onPressed: () {
                                      //                             showModalBottomSheet(
                                      //                                 isDismissible:
                                      //                                     false,
                                      //                                 context:
                                      //                                     context,
                                      //                                 isScrollControlled:
                                      //                                     true,
                                      //                                 useRootNavigator:
                                      //                                     true,
                                      //                                 backgroundColor:
                                      //                                     Colors
                                      //                                         .transparent,
                                      //                                 builder:
                                      //                                     (context) {
                                      //                                   return ServiceDatePickerModal(
                                      //                                       inputDate: _formProvider.date.error == null && _dateController.text != ''
                                      //                                           ? DateFormat('dd.MM.yyyy').parse(_dateController.text)
                                      //                                           : DateTime.now());
                                      //                                 }).then((value) {
                                      //                               setState(
                                      //                                   () {
                                      //                                 _dateController
                                      //                                         .text =
                                      //                                     value;
                                      //                                 _formProvider
                                      //                                         .date
                                      //                                         .value =
                                      //                                     _dateController
                                      //                                         .text;

                                      //                                 _formProvider
                                      //                                     .validateDate(
                                      //                                         value);
                                      //                               });
                                      //                             });
                                      //                           },
                                      //                         )))),
                                      //           ],
                                      //         ))), //calendarpick.png
                                      // // Padding(
                                      //     padding: EdgeInsets.symmetric(
                                      //         horizontal: MediaQuery.of(context)
                                      //                 .size
                                      //                 .width *
                                      //             0.015),
                                      //     child: Padding(
                                      //       padding:
                                      //           const EdgeInsets.only(top: 16),
                                      //       child: Text('время бронирования',
                                      //           style: DarkTextTheme.calloutNS
                                      //               .copyWith(
                                      //             color: Theme.of(context)
                                      //                 .focusColor,
                                      //           )),
                                      //     )),
                                      // Padding(
                                      //     padding: EdgeInsets.symmetric(
                                      //         horizontal: MediaQuery.of(context)
                                      //                 .size
                                      //                 .width *
                                      //             0.015),
                                      //     child: Padding(
                                      //         padding:
                                      //             const EdgeInsets.only(top: 0),
                                      //         child: Row(
                                      //           mainAxisAlignment:
                                      //               MainAxisAlignment
                                      //                   .spaceBetween,
                                      //           children: [
                                      //             Expanded(
                                      //               child: LabelledInputTime(
                                      //                   action: TextInputAction
                                      //                       .next,
                                      //                   controller:
                                      //                       _timeController,
                                      //                   keyboardType:
                                      //                       TextInputType
                                      //                           .number,
                                      //                   placeholder: "чч:мм",
                                      //                   error: _formProvider
                                      //                       .time.error,
                                      //                   onChanged: (val) {
                                      //                     setState(() {
                                      //                       _formProvider
                                      //                           .validateTime(
                                      //                               val);
                                      //                     });
                                      //                   }),
                                      //             ),
                                      //             SizedBox(
                                      //                 width: 60,
                                      //                 height: 60,
                                      //                 child: Card(
                                      //                     elevation: 4,
                                      //                     shadowColor:
                                      //                         const Color(
                                      //                                 0xFF0C2975)
                                      //                             .withOpacity(
                                      //                                 0.12),
                                      //                     color:
                                      //                         Theme.of(context)
                                      //                             .cardColor,
                                      //                     shape:
                                      //                         RoundedRectangleBorder(
                                      //                       borderRadius:
                                      //                           BorderRadius
                                      //                               .circular(
                                      //                                   12.0), //<-- SEE HERE
                                      //                     ),
                                      //                     child: Theme(
                                      //                         data: ThemeData(
                                      //                           splashColor: Colors
                                      //                               .transparent,
                                      //                           hoverColor: Colors
                                      //                               .transparent,
                                      //                           focusColor: Colors
                                      //                               .transparent,
                                      //                           highlightColor:
                                      //                               Colors
                                      //                                   .transparent,
                                      //                         ),
                                      //                         child: IconButton(
                                      //                             icon: SvgPicture
                                      //                                 .asset(
                                      //                                     'assets/icon/clock.svg'),
                                      //                             iconSize: 20,
                                      //                             onPressed:
                                      //                                 () {
                                      //                               showModalBottomSheet(
                                      //                                   context:
                                      //                                       context,
                                      //                                   isScrollControlled:
                                      //                                       true,
                                      //                                   useRootNavigator:
                                      //                                       true,
                                      //                                   backgroundColor:
                                      //                                       Colors
                                      //                                           .transparent,
                                      //                                   builder: (context) =>
                                      //                                       Container(
                                      //                                         decoration: BoxDecoration(
                                      //                                           color: Theme.of(context).cardColor,
                                      //                                           borderRadius: const BorderRadius.only(
                                      //                                             topLeft: Radius.circular(12),
                                      //                                             topRight: Radius.circular(12),
                                      //                                           ),
                                      //                                         ),
                                      //                                         height: 200,
                                      //                                         padding: const EdgeInsets.only(top: 6.0),
                                      //                                         child: DefaultTextStyle(
                                      //                                           style: DarkTextTheme.footnoteMS.copyWith(
                                      //                                             color: Theme.of(context).focusColor,
                                      //                                             fontSize: 22.0,
                                      //                                           ),
                                      //                                           child: GestureDetector(
                                      //                                             onTap: () {},
                                      //                                             child: SafeArea(
                                      //                                               top: false,
                                      //                                               child: CupertinoTimerPicker(
                                      //                                                 initialTimerDuration: _formProvider.time.value != null && _timeController.text.length == 5 ? Duration(hours: int.parse(_timeController.text.substring(0, 2)), minutes: int.parse(_timeController.text.substring(3, 5))) : Duration(hours: DateTime.now().hour + 3, minutes: DateTime.now().minute),
                                      //                                                 mode: CupertinoTimerPickerMode.hm,
                                      //                                                 minuteInterval: 1,
                                      //                                                 secondInterval: 1,
                                      //                                                 onTimerDurationChanged: (Duration changeTimer) {
                                      //                                                   setState(() {
                                      //                                                     if (changeTimer.inHours >= 10) {
                                      //                                                       if ((changeTimer.inMinutes % 60).ceil() >= 10) {
                                      //                                                         _timeController.text = '${changeTimer.inHours}:${(changeTimer.inMinutes % 60).ceil()}';
                                      //                                                         _formProvider.time.value = _timeController.text;
                                      //                                                         _formProvider.validateTime('${changeTimer.inHours}:${(changeTimer.inMinutes % 60).ceil()}');
                                      //                                                       } else {
                                      //                                                         _timeController.text = '${changeTimer.inHours}:0${(changeTimer.inMinutes % 60).ceil()}';
                                      //                                                         _formProvider.time.value = _timeController.text;
                                      //                                                         _formProvider.validateTime('${changeTimer.inHours}:0${(changeTimer.inMinutes % 60).ceil()}');
                                      //                                                       }
                                      //                                                     } else {
                                      //                                                       if ((changeTimer.inMinutes % 60).ceil() >= 10) {
                                      //                                                         _timeController.text = '0${changeTimer.inHours}:${(changeTimer.inMinutes % 60).ceil()}';
                                      //                                                         _formProvider.time.value = _timeController.text;
                                      //                                                         _formProvider.validateTime('0${changeTimer.inHours}:${(changeTimer.inMinutes % 60).ceil()}');
                                      //                                                       } else {
                                      //                                                         _timeController.text = '0${changeTimer.inHours}:0${(changeTimer.inMinutes % 60).ceil()}';
                                      //                                                         _formProvider.time.value = _timeController.text;
                                      //                                                         _formProvider.validateTime('0${changeTimer.inHours}:0${(changeTimer.inMinutes % 60).ceil()}');
                                      //                                                       }
                                      //                                                     }
                                      //                                                   });
                                      //                                                 },
                                      //                                               ),
                                      //                                             ),
                                      //                                           ),
                                      //                                         ),
                                      //                                       ));
                                      //                             }))))
                                      //           ],
                                      //         ))),

                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.015),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 16),
                                            child: Text("номер телефона",
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
                                            child: LabelledInputPhone(
                                              action: TextInputAction.done,
                                              placeholder: "+7 (900) 000-00-00",
                                              keyboardType: TextInputType.phone,
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
                                          )), //cal
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
                                              error: null,
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
                                              error: null,
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
                                              error: null,
                                            ),
                                          )),
                                    ]));
                          })))),
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 20),
                child: Consumer<BookProvider>(builder: (context, model, child) {
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
                            if (model.validate &&
                                dropdownValueint > 0 &&
                                dropdownValueint2 >= 0) {
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
                        onPressed: model.validate &&
                                dropdownValueint > 0 &&
                                dropdownValueint2 >= 0
                            ? () {
                                Map<String, dynamic> data = {
                                  "service_guid":
                                      "${services[dropdownValueint2].id}",
                                  "number_persons":
                                      int.parse(_personsController.text),
                                  "status": "${dropdownValue}",
                                  // "datetime":
                                  //     "${_dateController.text.replaceAll('.', '-')} ${_timeController.text}",
                                  "first_name": _nameController.text,
                                  "middle_name": _secondNameController.text,
                                  "last_name": _lastNameController.text,
                                  "phone": _phoneController.text
                                      .replaceAll(' (', '')
                                      .replaceAll(') ', '')
                                      .replaceAll('-', '')
                                };
                                // if (_nameController.text.isEmpty) {
                                //   data.remove('first_name');
                                // }
                                // if (_secondNameController.text.isEmpty) {
                                //   data.remove('middle_name');
                                // }
                                // if (_lastNameController.text.isEmpty) {
                                //   data.remove('last_name');
                                // }
                                context
                                    .read<BookBloc>()
                                    .add(BookSend(data: data));
                                context.pop();
                              }
                            : () {
                                print(dropdownValueint2 > 0);
                              },
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            "Отправить",
                            style: model.validate &&
                                    dropdownValueint > 0 &&
                                    dropdownValueint2 >= 0
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
