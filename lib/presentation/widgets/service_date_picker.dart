import 'package:agro_hack23/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../colors.dart';

class ServiceDatePickerModal extends StatefulWidget {
  ServiceDatePickerModal({
    Key? key,
    this.inputDate,
    this.secondinputDate,
  }) : super(key: key);

  late DateTime? inputDate;
  late DateTime? secondinputDate;
  @override
  _ServiceDatePickerModalState createState() => _ServiceDatePickerModalState();
}

class _ServiceDatePickerModalState extends State<ServiceDatePickerModal> {
  late DateTime _focusedDay;
  late DateTime _selectedDay;
  @override
  void initState() {
    if (widget.inputDate != null && widget.inputDate != '') {
      _focusedDay = widget.inputDate!;
      _selectedDay = widget.inputDate!;

      if (widget.secondinputDate != null && widget.secondinputDate != '') {
        _focusedDay = widget.secondinputDate!;
        _selectedDay = widget.secondinputDate!;
      }
    } else {
      _focusedDay = DateTime.now();
      _selectedDay = DateTime.now();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          color: Theme.of(context).cardColor,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.025),
          child: Column(children: [
            Padding(
                padding: const EdgeInsets.only(top: 20, right: 10),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 15,
                        child: Center(
                          child: Container(
                            height: 4,
                            width: 32,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: MaterialStateProperty.resolveAs<Color?>(
                                    Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant
                                        .withOpacity(0.4),
                                    <MaterialState>{})),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context,
                                DateFormat('dd.MM.yyyy').format(_selectedDay));
                          },
                          child: Text("Выйти",
                              style:
                                  LightTextTheme.subheadlineButtonNS.copyWith(
                                color: Theme.of(context).primaryColor,
                              )),
                        ))
                  ],
                )),
            TableCalendar(
              locale: "ru_RU",
              pageJumpingEnabled: true,
              weekendDays: const [DateTime.sunday],
              calendarBuilders: CalendarBuilders(
                dowBuilder: (context, day) {
                  return const Wrap(
                    spacing: 1,
                    runSpacing: 1,
                  );
                },
              ),
              calendarFormat: CalendarFormat.month,
              firstDay:
                  widget.secondinputDate != null && widget.secondinputDate != ''
                      ? DateTime(
                          widget.secondinputDate!.year,
                          widget.secondinputDate!.month,
                          widget.secondinputDate!.day)
                      : DateTime(1969, 1, 1),
              lastDay: DateTime(DateTime.now().year + 3, 12, 1),
              sixWeekMonthsEnforced: false,
              startingDayOfWeek: StartingDayOfWeek.monday,
              focusedDay: _focusedDay,
              headerStyle: HeaderStyle(
                headerPadding: EdgeInsets.zero,
                leftChevronIcon: Icon(
                  Icons.chevron_left_outlined,
                  color: Theme.of(context).primaryColor,
                ),
                rightChevronIcon: Icon(
                  Icons.chevron_right_outlined,
                  color: Theme.of(context).primaryColor,
                ),
                formatButtonShowsNext: true,
                titleTextStyle: DarkTextTheme.calloutNS.copyWith(
                  color: Theme.of(context).focusColor,
                ),
                formatButtonTextStyle: DarkTextTheme.calloutNS
                    .copyWith(color: Theme.of(context).focusColor),
                formatButtonDecoration: BoxDecoration(
                    border: Border.fromBorderSide(BorderSide(
                        color: Theme.of(context).indicatorColor, width: 3)),
                    borderRadius: const BorderRadius.all(Radius.circular(8.0))),
              ),
              calendarStyle: CalendarStyle(
                defaultTextStyle: TextStyle(
                    color: Theme.of(context).focusColor,
                    fontWeight: FontWeight.bold),
                // weekNumberTextStyle: TextStyle(color: DarkThemeColors.active),
                todayTextStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold),
                selectedTextStyle: TextStyle(
                    color: Theme.of(context).unselectedWidgetColor,
                    fontWeight: FontWeight.bold),
                selectedDecoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: LightThemeColors.buttonchosen,
                ),
                todayDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: LightThemeColors.primary.withOpacity(0.0)),
                rangeHighlightColor: Theme.of(context).primaryColor,
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: DarkTextTheme.calloutNS.copyWith(
                  color: Theme.of(context).focusColor,
                ),
                weekendStyle: DarkTextTheme.calloutNS.copyWith(
                  color: Theme.of(context).disabledColor,
                ),
              ),

              // calendarStyle: CalendarStyle(
              //   defaultTextStyle: TextStyle(
              //       color: Theme.of(context).focusColor,
              //       fontWeight: FontWeight.bold),
              //   // weekNumberTextStyle: TextStyle(color: DarkThemeColors.active),
              //   todayTextStyle: TextStyle(
              //       color: Theme.of(context).primaryColor,
              //       fontWeight: FontWeight.bold),
              //   selectedTextStyle: TextStyle(
              //       color: Theme.of(context).focusColor,

              //       ///[DD]
              //       fontWeight: FontWeight.bold),
              //   selectedDecoration: BoxDecoration(
              //     shape: BoxShape.circle,
              //     color: Theme.of(context).highlightColor,
              //   ),
              //   todayDecoration: BoxDecoration(
              //       shape: BoxShape.circle,
              //       color: DarkThemeColors.primary.withOpacity(0.0)),
              //   rangeHighlightColor: Theme.of(context).primaryColor,
              // ),
              // daysOfWeekStyle: DaysOfWeekStyle(
              //   weekdayStyle: DarkTextTheme.calloutNS.copyWith(
              //     color: Theme.of(context).focusColor,
              //   ),
              //   weekendStyle: DarkTextTheme.calloutNS.copyWith(
              //     color: Theme.of(context).disabledColor,
              //   ),
              // ),
              availableCalendarFormats: {
                CalendarFormat.month: "месяц",
              },
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(_selectedDay, selectedDay)) {
                  setState(() {
                    _selectedDay = selectedDay;
                    if (focusedDay.isAfter(_focusedDay)) {
                      _focusedDay = _selectedDay;
                    } else {
                      _focusedDay = focusedDay;
                    }
                  });
                }
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
              onHeaderLongPressed: (date) {
                final currentDate = DateTime.now();
                setState(() {
                  _focusedDay = currentDate;
                  _selectedDay = currentDate;
                });
              },
              onHeaderTapped: (year) {
                // set up the AlertDialog
                AlertDialog alert = AlertDialog(
                    contentPadding:
                        const EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 8.0),
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    title: const Text("Выберите год"),
                    content: SingleChildScrollView(
                        child: Wrap(
                      spacing: 4.0,
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runAlignment: WrapAlignment.center,
                      children: [
                        for (int i = widget.secondinputDate != null &&
                                    widget.secondinputDate != ''
                                ? widget.secondinputDate!.year
                                : 1970;
                            i <= DateTime.now().year + 2;
                            i++)
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: LightThemeColors.primary,
                              onPrimary: Colors.white,
                              shadowColor: Colors.transparent,
                            ),
                            onPressed: () {
                              setState(() {
                                _selectedDay = DateTime(
                                    i, _selectedDay.month, _selectedDay.day);
                                _focusedDay = _selectedDay;
                              });
                            },
                            child: Text(i.toString()),
                          ),
                      ],
                    )));

                // show the dialog
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    });
              },
            ),
          ]),
        ));
  }
}
