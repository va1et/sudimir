import 'package:agro_hack23/domain/entities/excursion.dart';
import 'package:agro_hack23/presentation/bloc/excursion/excursion_bloc.dart';
import 'package:agro_hack23/presentation/colors.dart';
import 'package:agro_hack23/presentation/provider/book_provider.dart';
import 'package:agro_hack23/presentation/provider/service_provider.dart';
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

class ServiceSendScreen extends StatefulWidget {
  const ServiceSendScreen({Key? key}) : super(key: key);
  @override

  // ignore: library_private_types_in_public_api
  _ServiceSendScreenState createState() => _ServiceSendScreenState();
}

class _ServiceSendScreenState extends State<ServiceSendScreen> {
  bool valuedata = false;
  final _formKey1 = GlobalKey<FormState>();
  final GlobalKey<AppExpansionTileState> expansionTile = GlobalKey();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _personsController = TextEditingController();
  String placevalue = '';
  String dropdownValue = '';
  int dropdownValueint = 0;

  late ServiceProvider _formProvider;

  ///[Для отправки запросом нужен другой тип файла]
//   PlatformFile pdf;
// final File fileForFirebase = File(pdf.path);
  @override
  void initState() {
    super.initState();
    _dateController.text = DateFormat('dd.MM.yyyy').format(DateTime.now());
    if ((DateTime.now().hour + 3) >= 10) {
      DateTime.now().minute >= 10
          ? _timeController.text =
              '${DateTime.now().hour + 3}:${DateTime.now().minute}'
          : _timeController.text =
              '${DateTime.now().hour + 3}:0${DateTime.now().minute}';
    } else {
      DateTime.now().minute >= 10
          ? _timeController.text =
              '0${DateTime.now().hour + 3}:${DateTime.now().minute}'
          : _timeController.text =
              '0${DateTime.now().hour + 3}:0${DateTime.now().minute}';
    }
  }

  @override
  void dispose() {
    _nameController.clear();
    _descriptionController.clear();
    _dateController.clear();
    _timeController.clear();
    _priceController.clear();
    _durationController.clear();
    _personsController.clear();
    _formProvider.disposeValues();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _formProvider = Provider.of<ServiceProvider>(context);
    // _personsController.text = _formProvider.persons.value ?? "";

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
                  text: "Экскурсии",
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
                                            child: Text("Тип Экскурсии",
                                                style: DarkTextTheme.calloutNS
                                                    .copyWith(
                                                  color: Theme.of(context)
                                                      .focusColor,
                                                )),
                                          )),
                                      Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 0),
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 3),
                                              child: Card(
                                                  elevation: 0,
                                                  color: Theme.of(context)
                                                      .primaryColorDark,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0), //<-- SEE HERE
                                                  ),
                                                  child: Theme(
                                                      data: ThemeData(
                                                        splashColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                      ).copyWith(
                                                          dividerColor: Colors
                                                              .transparent),
                                                      child: AppExpansionTile(
                                                          key: expansionTile,
                                                          title: Text(
                                                              dropdownValue,
                                                              style:
                                                                  DarkTextTheme
                                                                      .calloutNS
                                                                      .copyWith(
                                                                color: Theme.of(
                                                                        context)
                                                                    .focusColor,
                                                              )),
                                                          children: <Widget>[
                                                            SizedBox(
                                                                width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                                child: Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        top: 8),
                                                                    child: InkWell(
                                                                        borderRadius: BorderRadius.circular(12.0),
                                                                        splashColor: Colors.transparent,
                                                                        hoverColor: Colors.transparent,
                                                                        highlightColor: Colors.transparent,
                                                                        focusColor: Colors.transparent,
                                                                        onTap: () {
                                                                          setState(
                                                                              () {
                                                                            dropdownValueint =
                                                                                1;
                                                                            expansionTile.currentState?.collapse();
                                                                            dropdownValue =
                                                                                "tour";
                                                                          });
                                                                        },
                                                                        child: Padding(
                                                                            padding: const EdgeInsets.symmetric(horizontal: 6),
                                                                            child: Text(
                                                                              "Тур",
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
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        top: 8),
                                                                    child: InkWell(
                                                                        borderRadius: BorderRadius.circular(12.0),
                                                                        splashColor: Colors.transparent,
                                                                        hoverColor: Colors.transparent,
                                                                        highlightColor: Colors.transparent,
                                                                        focusColor: Colors.transparent,
                                                                        onTap: () {
                                                                          setState(
                                                                              () {
                                                                            dropdownValueint =
                                                                                2;
                                                                            expansionTile.currentState?.collapse();
                                                                            dropdownValue =
                                                                                "rent";
                                                                          });
                                                                        },
                                                                        child: Padding(
                                                                            padding: const EdgeInsets.symmetric(horizontal: 6),
                                                                            child: Text(
                                                                              "Аренда",
                                                                              style: DarkTextTheme.calloutNS.copyWith(
                                                                                color: Theme.of(context).focusColor,
                                                                              ),
                                                                            ))))),
                                                          ]))))),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.015),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 16),
                                            child: Text("Имя экскурсии",
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
                                                placeholder: "Кормление оленей",
                                                keyboardType:
                                                    TextInputType.text,
                                                controller: _nameController,
                                                obscureText: false,
                                                label: "",
                                                error: _formProvider.name.error,
                                                onChanged: (val) {
                                                  setState(() {
                                                    _formProvider
                                                        .validateName(val);
                                                  });
                                                }),
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
                                            child: Text("Описание экскурсии",
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
                                                placeholder: "Очень вкусно",
                                                keyboardType:
                                                    TextInputType.text,
                                                controller:
                                                    _descriptionController,
                                                obscureText: false,
                                                label: "",
                                                error: _formProvider
                                                    .description.error,
                                                onChanged: (val) {
                                                  setState(() {
                                                    _formProvider
                                                        .validateDescription(
                                                            val);
                                                  });
                                                }),
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
                                            child: Text("Цена экскурсии",
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
                                                placeholder: "1000",
                                                keyboardType:
                                                    TextInputType.number,
                                                controller: _priceController,
                                                obscureText: false,
                                                label: "",
                                                error:
                                                    _formProvider.price.error,
                                                onChanged: (val) {
                                                  setState(() {
                                                    _formProvider
                                                        .validatePrice(val);
                                                  });
                                                }),
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
                                            child: Text(
                                                "Продолжительность экскурсии",
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
                                                placeholder: "1 час",
                                                keyboardType:
                                                    TextInputType.text,
                                                controller: _durationController,
                                                obscureText: false,
                                                label: "",
                                                error: _formProvider
                                                    .duration.error,
                                                onChanged: (val) {
                                                  setState(() {
                                                    _formProvider
                                                        .validateDuration(val);
                                                  });
                                                }),
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
                                                placeholder: "12",
                                                keyboardType:
                                                    TextInputType.number,
                                                controller: _personsController,
                                                obscureText: false,
                                                label: "",
                                                error:
                                                    _formProvider.persons.error,
                                                onChanged: (val) {
                                                  setState(() {
                                                    _formProvider
                                                        .validatePersons(val);
                                                  });
                                                }),
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
                                            child: Text("Дата экскурсии",
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
                                                  const EdgeInsets.only(top: 0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: LabelledInputDate(
                                                        action: TextInputAction
                                                            .next,
                                                        controller:
                                                            _dateController,
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        placeholder:
                                                            'ДД.ММ.ГГГГ',
                                                        error: _formProvider
                                                            .datetime.error,
                                                        onChanged: (val) {
                                                          setState(() {
                                                            _formProvider
                                                                .validateDate(
                                                                    val);
                                                          });
                                                        }),
                                                  ),
                                                  SizedBox(
                                                      width: 60,
                                                      height: 60,
                                                      child: Card(
                                                          elevation: 4,
                                                          shadowColor:
                                                              const Color(
                                                                      0xFF0C2975)
                                                                  .withOpacity(
                                                                      0.12),
                                                          color:
                                                              Theme.of(context)
                                                                  .cardColor,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
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
                                                              ),
                                                              child: IconButton(
                                                                icon: SvgPicture
                                                                    .asset(
                                                                  'assets/icon/calendarpick.svg',
                                                                  color: LightThemeColors
                                                                      .primary,
                                                                ),
                                                                iconSize: 20,
                                                                onPressed: () {
                                                                  showModalBottomSheet(
                                                                      isDismissible:
                                                                          false,
                                                                      context:
                                                                          context,
                                                                      isScrollControlled:
                                                                          true,
                                                                      useRootNavigator:
                                                                          true,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      builder:
                                                                          (context) {
                                                                        return ServiceDatePickerModal(
                                                                            inputDate: _formProvider.datetime.error == null && _dateController.text != ''
                                                                                ? DateFormat('dd.MM.yyyy').parse(_dateController.text)
                                                                                : DateTime.now());
                                                                      }).then((value) {
                                                                    setState(
                                                                        () {
                                                                      _dateController
                                                                              .text =
                                                                          value;
                                                                      _formProvider
                                                                              .datetime
                                                                              .value =
                                                                          _dateController
                                                                              .text;

                                                                      _formProvider
                                                                          .validateDate(
                                                                              value);
                                                                    });
                                                                  });
                                                                },
                                                              )))),
                                                ],
                                              ))), //cale
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.015),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 16),
                                            child: Text("Время экскурсии",
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
                                                  const EdgeInsets.only(top: 0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: LabelledInputTime(
                                                        action: TextInputAction
                                                            .next,
                                                        controller:
                                                            _timeController,
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        placeholder: "чч:мм",
                                                        error: _formProvider
                                                            .time.error,
                                                        onChanged: (val) {
                                                          setState(() {
                                                            _formProvider
                                                                .validateTime(
                                                                    val);
                                                          });
                                                        }),
                                                  ),
                                                  SizedBox(
                                                      width: 60,
                                                      height: 60,
                                                      child: Card(
                                                          elevation: 4,
                                                          shadowColor:
                                                              const Color(
                                                                      0xFF0C2975)
                                                                  .withOpacity(
                                                                      0.12),
                                                          color:
                                                              Theme.of(context)
                                                                  .cardColor,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
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
                                                              ),
                                                              child: IconButton(
                                                                  icon:
                                                                      SvgPicture
                                                                          .asset(
                                                                    'assets/icon/clock.svg',
                                                                    color: LightThemeColors
                                                                        .primary,
                                                                  ),
                                                                  iconSize: 20,
                                                                  onPressed:
                                                                      () {
                                                                    showModalBottomSheet(
                                                                        context:
                                                                            context,
                                                                        isScrollControlled:
                                                                            true,
                                                                        useRootNavigator:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors
                                                                                .transparent,
                                                                        builder: (context) =>
                                                                            Container(
                                                                              decoration: BoxDecoration(
                                                                                color: Theme.of(context).cardColor,
                                                                                borderRadius: const BorderRadius.only(
                                                                                  topLeft: Radius.circular(12),
                                                                                  topRight: Radius.circular(12),
                                                                                ),
                                                                              ),
                                                                              height: 200,
                                                                              padding: const EdgeInsets.only(top: 6.0),
                                                                              child: DefaultTextStyle(
                                                                                style: DarkTextTheme.footnoteMS.copyWith(
                                                                                  color: Theme.of(context).focusColor,
                                                                                  fontSize: 22.0,
                                                                                ),
                                                                                child: GestureDetector(
                                                                                  onTap: () {},
                                                                                  child: SafeArea(
                                                                                    top: false,
                                                                                    child: CupertinoTimerPicker(
                                                                                      initialTimerDuration: _formProvider.time.value != null && _timeController.text.length == 5 ? Duration(hours: int.parse(_timeController.text.substring(0, 2)), minutes: int.parse(_timeController.text.substring(3, 5))) : Duration(hours: DateTime.now().hour + 3, minutes: DateTime.now().minute),
                                                                                      mode: CupertinoTimerPickerMode.hm,
                                                                                      minuteInterval: 1,
                                                                                      secondInterval: 1,
                                                                                      onTimerDurationChanged: (Duration changeTimer) {
                                                                                        setState(() {
                                                                                          if (changeTimer.inHours >= 10) {
                                                                                            if ((changeTimer.inMinutes % 60).ceil() >= 10) {
                                                                                              _timeController.text = '${changeTimer.inHours}:${(changeTimer.inMinutes % 60).ceil()}';
                                                                                              _formProvider.time.value = _timeController.text;
                                                                                              _formProvider.validateTime('${changeTimer.inHours}:${(changeTimer.inMinutes % 60).ceil()}');
                                                                                            } else {
                                                                                              _timeController.text = '${changeTimer.inHours}:0${(changeTimer.inMinutes % 60).ceil()}';
                                                                                              _formProvider.time.value = _timeController.text;
                                                                                              _formProvider.validateTime('${changeTimer.inHours}:0${(changeTimer.inMinutes % 60).ceil()}');
                                                                                            }
                                                                                          } else {
                                                                                            if ((changeTimer.inMinutes % 60).ceil() >= 10) {
                                                                                              _timeController.text = '0${changeTimer.inHours}:${(changeTimer.inMinutes % 60).ceil()}';
                                                                                              _formProvider.time.value = _timeController.text;
                                                                                              _formProvider.validateTime('0${changeTimer.inHours}:${(changeTimer.inMinutes % 60).ceil()}');
                                                                                            } else {
                                                                                              _timeController.text = '0${changeTimer.inHours}:0${(changeTimer.inMinutes % 60).ceil()}';
                                                                                              _formProvider.time.value = _timeController.text;
                                                                                              _formProvider.validateTime('0${changeTimer.inHours}:0${(changeTimer.inMinutes % 60).ceil()}');
                                                                                            }
                                                                                          }
                                                                                        });
                                                                                      },
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ));
                                                                  }))))
                                                ],
                                              ))),
                                    ]));
                          })))),
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 20),
                child:
                    Consumer<ServiceProvider>(builder: (context, model, child) {
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
                            if (model.validate && dropdownValueint > 0) {
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
                        onPressed: model.validate && dropdownValueint > 0
                            ? () {
                                // print(_dateController.text);
                                context
                                    .read<ExcursionBloc>()
                                    .add(ExcursionSend(data: {
                                      "name": _nameController.text,
                                      "description":
                                          _descriptionController.text,
                                      "price": int.parse(_priceController.text),
                                      "duration": _durationController.text,
                                      "datetime":
                                          "${_dateController.text.replaceAll(".", "-")} ${_timeController.text}",
                                      "max_number_persons":
                                          int.parse(_personsController.text),
                                      "type": dropdownValue
                                    }));
                                context.pop();
                              }
                            : () {},
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            "Отправить",
                            style: model.validate && dropdownValueint > 0
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
