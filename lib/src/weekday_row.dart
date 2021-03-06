import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_calendar_carousel/src/default_styles.dart'
    show defaultWeekdayTextStyle;
import 'package:intl/intl.dart';

class WeekdayRow extends StatelessWidget {
  WeekdayRow(
      {@required this.showWeekdays,
      @required this.weekdayFormat,
      @required this.weekdayMargin,
      @required this.weekdayTextStyle,
      @required this.localeDate});

  final bool showWeekdays;
  final WeekdayFormat weekdayFormat;
  final EdgeInsets weekdayMargin;
  final TextStyle weekdayTextStyle;
  final DateFormat localeDate;

  Widget _weekdayContainer(String weekDay) => Expanded(
          child: Container(
        margin: weekdayMargin,
        child: Center(
          child: DefaultTextStyle(
            style: defaultWeekdayTextStyle,
            child: Text(
              weekDay,
              style: weekdayTextStyle,
            ),
          ),
        ),
      ));

  List<Widget> _generateWeekdays() {
    switch (weekdayFormat) {
      case WeekdayFormat.weekdays:
        return localeDate.dateSymbols.WEEKDAYS
            .map<Widget>(_weekdayContainer)
            .toList();
      case WeekdayFormat.standalone:
        return localeDate.dateSymbols.STANDALONEWEEKDAYS
            .map<Widget>(_weekdayContainer)
            .toList();
      case WeekdayFormat.short:
        return localeDate.dateSymbols.SHORTWEEKDAYS
            .map<Widget>(_weekdayContainer)
            .toList();
      case WeekdayFormat.standaloneShort:
        return localeDate.dateSymbols.STANDALONESHORTWEEKDAYS
            .map<Widget>(_weekdayContainer)
            .toList();
      case WeekdayFormat.narrow:
        return localeDate.dateSymbols.NARROWWEEKDAYS
            .map<Widget>(_weekdayContainer)
            .toList();
      case WeekdayFormat.standaloneNarrow:
        return localeDate.dateSymbols.STANDALONENARROWWEEKDAYS
            .map<Widget>(_weekdayContainer)
            .toList();
      default:
        return localeDate.dateSymbols.STANDALONEWEEKDAYS
            .map<Widget>(_weekdayContainer)
            .toList();
    }
  }

  @override
  Widget build(BuildContext context) => showWeekdays
      ? Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _generateWeekdays(),
        )
      : Container();
}
