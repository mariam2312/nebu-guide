import 'dart:core';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:quiver/time.dart';

class DateAndTime {
  DateTime immediateTime = DateTime.now();

  bool isSameOrBeforeOneDay(
      {required DateTime realTime, required DateTime? operationTime}) {
    bool result = false;

    if (operationTime != null) {
      int operationDay = operationTime.day;
      int realTimeDay = realTime.day;

      if (((realTimeDay == operationDay) ||
          ((realTimeDay == 1) &&
              ((daysInMonth(realTime.year, realTime.month) -
                  operationDay) <=
                  1))) &&
          ((realTime.month == (operationTime).month) ||
              (realTime.month == ((operationTime).month + 1)) ||
              ((realTime.month == 1) && ((operationTime).month == 12))) &&
          (realTime.year == (operationTime).year)) {
        result = true;
      } else {
        result = false;
      }
    } else {
      result = false;
    }

    return result;
  }

  bool isSameDay(
      {required DateTime realTime, required DateTime? operationTime}) {
    bool result = false;

    if (operationTime != null) {
      if (realTime.day == (operationTime).day &&
          realTime.month == (operationTime).month &&
          realTime.year == (operationTime).year) {
        result = true;
      } else {
        result = false;
      }
    } else {
      result = false;
    }

    return result;
  }

  String getDMY(Timestamp time) {
    var t = time.toDate();
    String month = DateFormat.M("en_US").format(t);
    String day = DateFormat.d("en_US").format(t);
    String year = DateFormat.y("en_US").format(t).substring(2, 4);
    return "$day-$month-$year";
  }

  String getDMYTotal(Timestamp time) {
    var t = time.toDate();
    String month = DateFormat.M("en_US").format(t);
    String day = DateFormat.d("en_US").format(t);
    String year = DateFormat.y("en_US").format(t);
    return "$day-$month-$year";
  }

  String getDMYHMS(Timestamp time) {
    var t = time.toDate();
    String month = DateFormat.M("en_US").format(t);
    String day = DateFormat.d("en_US").format(t);
    String year = DateFormat.y("en_US").format(t).substring(2, 4);
    String hour = DateFormat.H("en_US").format(t);
    String minute = DateFormat.m("en_US").format(t);

    return "$day-$month-$year , $hour:$minute";
  }

  String getDMYHMS23(Timestamp time) {
    var t = time.toDate();
    String month = DateFormat.M("en_US").format(t);
    String day = DateFormat.d("en_US").format(t);
    String year = DateFormat.y("en_US").format(t);
    String hour = DateFormat.H("en_US").format(t);
    String minute = DateFormat.m("en_US").format(t);

    return "$day-$month-$year , $hour:$minute";
  }

  String getM(Timestamp time) {
    var t = time.toDate();
    String month = DateFormat.M("en_US").format(t);
    String day = DateFormat.d("en_US").format(t);
    String year = DateFormat.y("en_US").format(t);
    return "$month-$year";
  }

  String getMonthYearDate(Timestamp time) {
    var t = time.toDate();
    String month = DateFormat.M("en_US").format(t);
    String year = DateFormat.y("en_US").format(t);
    return "$month-$year";
  }

  String getMonthYearDateAddedOneMonth(Timestamp time) {
    var t = time.toDate();
    String month = DateFormat.M("en_US").format(t);

    String updatedMonth = "";
    month != "12"
        ? updatedMonth = (int.parse(month) + 1).toStringAsFixed(0)
        : updatedMonth = "1";

    String year = DateFormat.y("en_US").format(t);
    return "$updatedMonth-$year";
  }

  String getD(Timestamp time) {
    var t = time.toDate();
    String month = DateFormat.M("en_US").format(t);
    String day = DateFormat.d("en_US").format(t);
    return "$day-$month";
  }

  String getDD(Timestamp time) {
    var t = time.toDate();
    String month = DateFormat.M("en_US").format(t);
    String day = DateFormat.d("en_US").format(t);
    String finalDate = time != null ? "$day-$month" : "NULL";
    return finalDate;
  }

  // String getDM(Timestamp time) {
  //   var t = time.toDate();
  //   String eDay = DateFormat.E("en_US").format(t);
  //   String month = DateFormat.M("en_US").format(t);
  //   String day = DateFormat.d("en_US").format(t);
  //   return "$eDay.$day-$month";
  // }

  String showDateAndTime(DateTime time) {
    String month = DateFormat.M("en_US").format(DateTime.now());
    String day = DateFormat.d("en_US").format(DateTime.now());
    String year = DateFormat.y("en_US").format(DateTime.now());
    return "${DateFormat.jms("en_US").format(time)} - $day.$month.$year";
  }

  // used in the invoice number generator .

  String showHMSDMY(DateTime time) {
    String day = "";
    String month = "";
    String year = "";

    String hour = DateFormat.H("en_US").format(time);
    String minute = DateFormat.m("en_US").format(time);
    String second = DateFormat.s("en_US").format(time);

    if (int.parse(hour) < 5) {
      day =
          DateFormat.d("en_US").format(time.subtract(const Duration(days: 1)));
      month =
          DateFormat.M("en_US").format(time.subtract(const Duration(days: 1)));
      year =
          DateFormat.y("en_US").format(time.subtract(const Duration(days: 1)));
    } else {
      day = DateFormat.d("en_US").format(time);
      month = DateFormat.M("en_US").format(time);
      year = DateFormat.y("en_US").format(time);
    }

    return "$hour$minute|$day$month$year|$second";
  }

  String showHMSDMY2(DateTime time) {
    String day = DateFormat.d("en_US").format(time);
    String month = DateFormat.M("en_US").format(time);
    String year = DateFormat.y("en_US").format(time);
    String hour = DateFormat.H("en_US").format(time);
    String minute = DateFormat.m("en_US").format(time);
    String second = DateFormat.s("en_US").format(time);
    return "$day$month$year|$hour$minute$second";
  }

  String showHMSDMY4(DateTime time) {
    String day = DateFormat.d("en_US").format(time);
    String month = DateFormat.M("en_US").format(time);
    String year = DateFormat.y("en_US").format(time);
    String hour = DateFormat.H("en_US").format(time);
    String minute = DateFormat.m("en_US").format(time);
    String second = DateFormat.s("en_US").format(time);

    Random rnd = new Random();
    // for linking code :
    int min = 1000;
    int max = 9900;

    // calc
    var Year = year.substring(2, 4);
    var r = min + rnd.nextInt(max - min);

    day.length == 1 ? day = "0" + day : null;

    minute.length == 1 ? minute = "0" + minute : null;

    second.length == 1 ? second = "0" + second : null;

    month.length == 1 ? month = "0" + month : null;

    return "$day$r$Year$minute$second";
  }

  String showHMSDMY44(DateTime time) {
    String day = DateFormat.d("en_US").format(time);
    String month = DateFormat.M("en_US").format(time);
    String year = DateFormat.y("en_US").format(time);
    String hour = DateFormat.H("en_US").format(time);
    String minute = DateFormat.m("en_US").format(time);
    String second = DateFormat.s("en_US").format(time);

    Random rnd = new Random();
    // for linking code :
    int min = 1000;
    int max = 9900;

    // calc
    var Year = year.substring(2, 4);
    var r = min + rnd.nextInt(max - min);

    day.length == 1 ? day = "0" + day : print("ready");

    minute.length == 1 ? minute = "0" + minute : print("ready");

    hour.length == 1 ? second = "0" + second : print("ready");

    second.length == 1 ? second = "0" + second : print("ready");

    month.length == 1 ? month = "0" + month : print("ready");

    return "$day$Year$minute$second";
  }

  String showS(DateTime time) {
    String hour = DateFormat.H("en_US").format(time);
    String minute = DateFormat.m("en_US").format(time);
    String second = DateFormat.s("en_US").format(time);
    return "$hour$minute$second";
  }

  DateTime showDateFromStringEnhanced(String time) {
    String newDate = "";
    String newDayDate = "";
    DateTime date;

    if (time != "") {
      /// 2-1-23
      newDate = time;

      List<String> dateStringList = newDate.split("-");
      String dayString = dateStringList[0];
      String monthString = dateStringList[1];
      String yearString = dateStringList[2];

      if (dayString.length == 1) {
        dayString = "0${dayString}";
      }

      if (monthString.length == 1) {
        monthString = "0${monthString}";
      }
      if (yearString.length == 2) {
        yearString = "20${yearString}";
      }

      newDayDate = "${yearString}${monthString}${dayString}";

      String cleanTime = newDayDate
          .trim()
          .replaceAll("-", "")
          .replaceAll(" ", "T")
          .replaceAll(":", "");
      date = DateTime.parse(cleanTime);
    } else {
      date = DateTime.now();
    }

    return date;
  }

  // DateTime showDateFromString(String time) {
  //   if (time.allBetween("-", "-").length == 1) {
  //     String beforeEdit = time.allBefore("-");
  //
  //     time = time.replaceAll("${beforeEdit}-", "${beforeEdit}-0");
  //   }
  //
  //   String cleanTime = time
  //       .trim()
  //       .replaceAll("-", "")
  //       .replaceAll(" ", "T")
  //       .replaceAll(":", "");
  //
  //   DateTime date = DateTime.parse(cleanTime);
  //   return date;
  // }

  DateTime differentDaySameTime(DateTime date) {
    // differentDay
    int year = int.parse(DateFormat.y("en_US").format(date));
    int month = int.parse(DateFormat.M("en_US").format(date));
    int day = int.parse(DateFormat.d("en_US").format(date));

    //DaySameTime
    int hour = int.parse(DateFormat.H("en_US").format(immediateTime));
    int minute = int.parse(DateFormat.m("en_US").format(immediateTime));
    int second = int.parse(DateFormat.s("en_US").format(immediateTime));

    // result
    DateTime result = DateTime(year, month, day, hour, minute, second);

    return result;
  }

  DateTime differentDaySameTimeEnhanced({
    required DateTime date,
    required DateTime trueDate,
  }) {
    // differentDay
    int year = int.parse(DateFormat.y("en_US").format(date));
    int month = int.parse(DateFormat.M("en_US").format(date));
    int day = int.parse(DateFormat.d("en_US").format(date));

    //DaySameTime
    int hour = int.parse(DateFormat.H("en_US").format(trueDate));
    int minute = int.parse(DateFormat.m("en_US").format(trueDate));
    int second = int.parse(DateFormat.s("en_US").format(trueDate));

    // result
    DateTime result = DateTime(year, month, day, hour, minute, second);

    return result;
  }

  String minutesToString(int minutes) {
    var d = Duration(minutes: minutes);
    List<String> parts = d.toString().split(':');
    return '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}';
  }

  String showHMSDMY21S(Timestamp? time) {
    String result = "-:-";

    if (time != null) {
      var t = time.toDate();
      String hour = DateFormat.H("en_US").format(t);
      String minute = DateFormat.m("en_US").format(t);
      int.parse(hour) > 12 ? hour = (int.parse(hour) - 12).toString() : null;

      result = "${hour.padLeft(2, '0')}:${minute.padLeft(2, '0')}";
    }

    return result;
  }

  String showHMSDMY21S2(Timestamp? time) {
    String result = "-:-";

    if (time != null) {
      var t = time.toDate();
      int year = int.parse(DateFormat.y("en_US").format(t));
      int month = int.parse(DateFormat.M("en_US").format(t));
      int day = int.parse(DateFormat.d("en_US").format(t));
      String hour = DateFormat.H("en_US").format(t);
      String minute = DateFormat.m("en_US").format(t);
      int.parse(hour) > 12 ? hour = (int.parse(hour) - 12).toString() : null;

      result =
      "${hour.padLeft(2, '0')}:${minute.padLeft(2, '0')} , $day-$month-$year";
    }

    return result;
  }

  DateTime cleanDate(DateTime date) {
    // differentDay
    int year = int.parse(DateFormat.y("en_US").format(date));
    int month = int.parse(DateFormat.M("en_US").format(date));
    int day = int.parse(DateFormat.d("en_US").format(date));

    // result
    DateTime result = DateTime(year, month, day);

    return result;
  }

  String showS4(DateTime time) {
    String hour = DateFormat.H("en_US").format(time);
    String minute = DateFormat.m("en_US").format(time);
    String month = DateFormat.M("en_US").format(time);
    String second = DateFormat.s("en_US").format(time);
    String day = DateFormat.d("en_US").format(time);
    String year = DateFormat.y("en_US").format(time);
    return "$day$month$year$hour$minute$second";
  }

  String showSS4(DateTime time) {
    String hour = DateFormat.H("en_US").format(time);
    String minute = DateFormat.m("en_US").format(time);
    String month = DateFormat.M("en_US").format(time);
    String second = DateFormat.s("en_US").format(time);
    String fractionalSecond = time.microsecond.toString();
    String day = DateFormat.d("en_US").format(time);
    String year = DateFormat.y("en_US").format(time);

    return "$day$month$year$hour$minute$second$fractionalSecond";
  }

  String showSSS(DateTime time) {
    String hour = DateFormat.H("en_US").format(time);

    hour.length == 1 ? hour = "0" + hour : print("good");

    String minute = DateFormat.m("en_US").format(time);

    minute.length == 1 ? minute = "0" + minute : print("good");

    String second = DateFormat.s("en_US").format(time);

    second.length == 1 ? second = "0" + second : print("good");

    return "$hour$minute$second";
  }

  String showSS(DateTime time) {
    String hour = DateFormat.H("en_US").format(time);
    String minute = DateFormat.m("en_US").format(time);
    String second = DateFormat.s("en_US").format(time);
    int.parse(hour) > 12 ? hour = (int.parse(hour) - 12).toString() : null;
    return "$hour:$minute:$second";
  }

  String showHMSDMY3(DateTime time) {
    String hour = DateFormat.H("en_US").format(time);
    String minute = DateFormat.m("en_US").format(time);
    return "$hour:$minute";
  }

  String showHMSDMY333(DateTime time) {
    String hour = DateFormat.H("en_US").format(time);
    String minute = DateFormat.m("en_US").format(time);
    int.parse(hour) > 12
        ? hour = (int.parse(hour) - 12).toString()
        : print("normal 12");

    return "$hour:$minute";
  }

  String showHMSDMY212(Timestamp? time) {
    String result = "-:-";

    if (time != null) {
      var t = time.toDate();
      String hour = DateFormat.H("en_US").format(t);
      String minute = DateFormat.m("en_US").format(t);
      int.parse(hour) > 12 ? hour = (int.parse(hour) - 12).toString() : null;

      result = "$hour:$minute";
    }

    return result;
  }

  String showHMSDMY212s(Timestamp? time) {
    String result = "-:-";

    if (time != null) {
      var t = time.toDate();
      String hour = DateFormat.H("en_US").format(t);
      String second = DateFormat.s("en_US").format(t);
      String minute = DateFormat.m("en_US").format(t);
      int.parse(hour) > 12 ? hour = (int.parse(hour) - 12).toString() : null;

      result = "$hour:$minute :$second";
    }

    return result;
  }

  String showHMSDMY222(Timestamp? time) {
    String result = "-:-";

    if (time != null) {
      var t = time.toDate();
      String month = DateFormat.M("en_US").format(t);
      String day = DateFormat.d("en_US").format(t);
      String hour = DateFormat.H("en_US").format(t);
      String minute = DateFormat.m("en_US").format(t);
      int.parse(hour) > 12 ? hour = (int.parse(hour) - 12).toString() : null;

      result = " ($hour:$minute) $day / $month";
    }

    return result;
  }

  String getDMYHMS2(Timestamp? time) {
    String result = "-:-";

    if (time != null) {
      var t = time.toDate();
      String month = DateFormat.M("en_US").format(t);
      String day = DateFormat.d("en_US").format(t);
      String year = DateFormat.y("en_US").format(t).substring(2, 4);
      String hour = DateFormat.H("en_US").format(t);
      String minute = DateFormat.m("en_US").format(t);
      int.parse(hour) > 12 ? hour = (int.parse(hour) - 12).toString() : null;

      result = "$day-$month-$year , $hour:$minute";
    }

    return result;
  }

  // String showHMSDMY4(DateTime time) {
  //   String hour = DateFormat.H("en_US").format(time);
  //   String minute = DateFormat.m("en_US").format(time);
  //   return "$hour-$minute";
  // }

  String showDate(DateTime time) {
    String month = DateFormat.M("en_US").format(time);
    String day = DateFormat.d("en_US").format(time);
    String year = DateFormat.y("en_US").format(time);
    return "$day.$month.$year";
  }

  String showDate2(DateTime time) {
    String day = DateFormat.d("en_US").format(time);
    String month = DateFormat.M("en_US").format(time);
    String year = DateFormat.y("en_US").format(time);
    return "$day-$month-$year";
  }

  String showDayMonth(DateTime time) {
    String day = DateFormat.d("en_US").format(time);
    String month = DateFormat.M("en_US").format(time);
    return "$day-$month";
  }

  String showDate2_OverNight(DateTime time, {bool isForReenterData = false}) {
    String month = DateFormat.M("en_US").format(time);
    String year = DateFormat.y("en_US").format(time);
    String hour = DateFormat.H("en_US").format(time);
    String day = DateFormat.d("en_US").format(time);

    String dayBefore = "";
    String monthBefore = "";

    String result = "";

    if (int.parse(hour) < 5 && (isForReenterData == false)) {
      dayBefore =
          DateFormat.d("en_US").format(time.subtract(const Duration(days: 1)));
      monthBefore =
          DateFormat.M("en_US").format(time.subtract(const Duration(days: 1)));

      result = "$dayBefore-$monthBefore-$year";
    } else {
      result = "$day-$month-$year";
    }

    return result;
  }

  String showDate2_OverNight_HS(DateTime time,
      {bool isForReenterData = false}) {
    String month = DateFormat.M("en_US").format(time);
    String year = DateFormat.y("en_US").format(time);
    String hour = DateFormat.H("en_US").format(time);
    String minute = DateFormat.m("en_US").format(time);
    String day = DateFormat.d("en_US").format(time);

    String dayBefore = "";
    String monthBefore = "";

    String result = "";

    if (int.parse(hour) < 5 && (isForReenterData == false)) {
      dayBefore =
          DateFormat.d("en_US").format(time.subtract(const Duration(days: 1)));
      monthBefore =
          DateFormat.M("en_US").format(time.subtract(const Duration(days: 1)));

      result = "$dayBefore-$monthBefore-$year , $hour:$minute";
    } else {
      result = "$day-$month-$year , $hour:$minute";
    }

    return result;
  }

  DateTime showDate_OverNight(DateTime time) {
    String hour = DateFormat.H("en_US").format(time);
    DateTime result;

    if (int.parse(hour) < 5) {
      result = time.subtract(const Duration(days: 1));
    } else {
      result = time;
    }

    return result;
  }

  DateTime showDate_OverNight2(DateTime time) {
    String hour = DateFormat.H("en_US").format(time);
    String year = DateFormat.y("en_US").format(time);
    String minute = DateFormat.m("en_US").format(time);
    String second = DateFormat.s("en_US").format(time);

    DateTime result;
    String dayBefore = "";
    String monthBefore = "";

    if (int.parse(hour) < 5) {
      dayBefore =
          DateFormat.d("en_US").format(time.subtract(const Duration(days: 1)));
      monthBefore =
          DateFormat.M("en_US").format(time.subtract(const Duration(days: 1)));

      var intYear = int.parse(year);
      var intMonth = int.parse(monthBefore);
      var intDay = int.parse(dayBefore);

      result = DateTime(
          int.parse(year),
          int.parse(monthBefore),
          int.parse(dayBefore),
          int.parse(hour),
          int.parse(minute),
          int.parse(second));
    } else {
      result = time;
    }

    return result;
  }

  String getMonthYearDate_OverNight(Timestamp time,
      {bool isForReenterData = false}) {
    var t = time.toDate();

    String hour = DateFormat.H("en_US").format(t);
    String month = "";
    String year = "";

    if (int.parse(hour) < 5 && isForReenterData == false) {
      month = DateFormat.M("en_US").format(t.subtract(const Duration(days: 1)));
      year = DateFormat.y("en_US").format(t.subtract(const Duration(days: 1)));
    } else {
      month = DateFormat.M("en_US").format(t);
      year = DateFormat.y("en_US").format(t);
    }

    return "$month-$year";
  }

  String showDate2A(DateTime time) {
    String day = DateFormat.d("ar_EGP").format(time);
    String month = DateFormat.M("ar_EGP").format(time);
    String year = DateFormat.y("ar_EGP").format(time);
    return "$day-$month-$year";
  }

  String showDayMonthYearAddedByOneMonth(DateTime time) {
    String day = DateFormat.d("en_US").format(time);
    String month = DateFormat.M("en_US").format(time);
    String updatedMonth = "";
    month != "12"
        ? updatedMonth = (int.parse(month) + 1).toStringAsFixed(0)
        : updatedMonth = "1";

    String year = DateFormat.y("en_US").format(time);
    return "$day-$updatedMonth-$year";
  }

  String showDayMonthYearAddedByOtherDate(
      {required DateTime time, required DateTime secondDate}) {
    String day = DateFormat.d("en_US").format(time);
    String month = DateFormat.M("en_US").format(secondDate);
    String year = DateFormat.y("en_US").format(time);
    return "$day-$month-$year";
  }

  String showDay(DateTime time) {
    String day = DateFormat.E("en_US").format(time);
    return " $day ";
  }

  Future<String> showArabicMonth(DateTime time) async {
    await initializeDateFormatting("ar_SA", null);
    String month = DateFormat.MMMM("ar_SA").format(time);
    return "$month";
  }

  Future<String> showArabicDay(DateTime time) async {
    await initializeDateFormatting("ar_SA", null);
    String month = DateFormat.E("ar_SA").format(time);
    return "$month";
  }

  String showDate22(DateTime time) {
    String month = DateFormat.M("en_US").format(time);
    String day = DateFormat.d("en_US").format(time);
    String year = DateFormat.y("en_US").format(time);
    String hour = DateFormat.H("en_US").format(time);
    String minute = DateFormat.m("en_US").format(time);
    return "$day-$month-$year ,$hour:$minute ";
  }

  String showDate23(DateTime time) {
    String month = DateFormat.M("en_US").format(time);
    String day = DateFormat.d("en_US").format(time);
    String year = DateFormat.y("en_US").format(time);
    String hour = DateFormat.H("en_US").format(time);
    String minute = DateFormat.m("en_US").format(time);
    return "$day-$month-$year-$hour-$minute";
  }

  String showDate23_Overnight(DateTime time) {
    String month = DateFormat.M("en_US").format(time);
    String day = DateFormat.d("en_US").format(time);
    String year = DateFormat.y("en_US").format(time);
    String hour = DateFormat.H("en_US").format(time);
    String minute = DateFormat.m("en_US").format(time);

    if (int.parse(hour) < 5) {
      day =
          DateFormat.d("en_US").format(time.subtract(const Duration(days: 1)));
      month =
          DateFormat.M("en_US").format(time.subtract(const Duration(days: 1)));
      year =
          DateFormat.y("en_US").format(time.subtract(const Duration(days: 1)));
    } else {
      day = DateFormat.d("en_US").format(time);
      month = DateFormat.M("en_US").format(time);
      year = DateFormat.y("en_US").format(time);
    }

    return "$day-$month-$year-$hour-$minute";
  }

  String showDate3(DateTime time) {
    String month = DateFormat.M("en_US").format(time);
    String year = DateFormat.y("en_US").format(time);
    return "$month-$year";
  }

  String showDate3_OverNight(DateTime time) {
    String hour = DateFormat.H("en_US").format(time);
    String month = DateFormat.M("en_US").format(time);
    String year = DateFormat.y("en_US").format(time);

    if (int.parse(hour) < 5) {
      month =
          DateFormat.M("en_US").format(time.subtract(const Duration(days: 1)));
      year =
          DateFormat.y("en_US").format(time.subtract(const Duration(days: 1)));
    }

    return "$month-$year";
  }

  String showDate4(DateTime time) {
    String day = DateFormat.d("en_US").format(time);
    String month = DateFormat.M("en_US").format(time);
    String year = DateFormat.y("en_US").format(time);
    String hour = DateFormat.H("en_US").format(time);
    String minute = DateFormat.m("en_US").format(time);
    String second = DateFormat.s("en_US").format(time);
    return "$day-$month-$year-$hour-$minute-$second";
  }

  String showDate3A(DateTime time) {
    String month = DateFormat.M("ar_EGP").format(time);
    String year = DateFormat.y("ar_EGP").format(time);
    return "$month-$year";
  }

  String showDate3FromList(DateTime time, int month) {
    String year = DateFormat.y("en_US").format(time);
    return "$month-$year";
  }

  String showDate3FromListPreviousYear(DateTime time, int month) {
    String year =
    DateFormat.y("en_US").format(time.subtract(const Duration(days: 33)));
    return "$month-$year";
  }

  String showMonthlyDateIncreasedByOne(DateTime time) {
    String month = DateFormat.M("en_US").format(time);
    String updatedMonth = "";

    month != "12"
        ? updatedMonth = (int.parse(month) + 1).toStringAsFixed(0)
        : updatedMonth = "1";

    String year = DateFormat.y("en_US").format(time);
    return "$updatedMonth-$year";
  }

  DateTime getMonthlyDateIncreasedByOne(DateTime time) {
    String month = DateFormat.M("en_US").format(time);
    DateTime updatedMonth = time;

    month != "12"
        ? updatedMonth = DateTime(time.year, (time.month + 1), time.day)
        : updatedMonth = DateTime((time.year + 1), 1, time.day);

    return updatedMonth;
  }

  DateTime getMonthlyDateDecreasedByOne(DateTime time) {
    String month = DateFormat.M("en_US").format(time);
    DateTime updatedMonth = time;

    month != "1"
        ? updatedMonth = DateTime(time.year, (time.month - 1), time.day)
        : updatedMonth = DateTime((time.year - 1), 12, time.day);

    return updatedMonth;
  }

  String showMonthlyDateDecreasedByOne(DateTime time) {
    String month = DateFormat.M("en_US").format(time);
    String updatedMonth = "";

    month != "1"
        ? updatedMonth = (int.parse(month) - 1).toStringAsFixed(0)
        : updatedMonth = "12";

    String year = DateFormat.y("en_US").format(time);
    return "$updatedMonth-$year";
  }

  String showDateYear(DateTime time) {
    String year = DateFormat.y("en_US").format(time);
    return "$year";
  }

  /// todo modify this function to remove the risky : and spaces from the paths , that can cause issues in future .

  String showTime(DateTime time) {
    ///     OLD FUNCTION  : return "${DateFormat.jms().format(time)}";
    ///     our purpose to make this conversion  .
    ///      4:20:17 PM to => 4-20-17
    String modifiedDate = DateFormat.jms("en_US").format(time);

    String cleanDate = modifiedDate.replaceAll(":", "-");
    String dateWithNoSpace = cleanDate.replaceAll(" ", "");
    String dateWithNoPM = dateWithNoSpace.replaceAll("PM", "");
    String dateWithNoAM = dateWithNoPM.replaceAll("AM", "");
    String cleanFinalDate = dateWithNoAM;

    return cleanFinalDate;
  }

  String showTimeH(DateTime time) {
    ///     OLD FUNCTION  : return "${DateFormat.jms().format(time)}";
    ///     our purpose to make this conversion  .
    ///      4:20:17 PM to => 4-20-17
    String modifiedDate = DateFormat.Hms("en_US").format(time);

    // all our timing is H => 0-23 hours , we need to check if it's PM then add 12 .

    String cleanDate = modifiedDate.replaceAll(":", "-");
    String dateWithNoSpace = cleanDate.replaceAll(" ", "");
    String dateWithNoPM = dateWithNoSpace.replaceAll("PM", "");
    String dateWithNoAM = dateWithNoPM.replaceAll("AM", "");
    String cleanFinalDate = dateWithNoAM;

    return cleanFinalDate;
  }

  String showTime33(DateTime time) {
    ///     OLD FUNCTION  : return "${DateFormat.jms().format(time)}";
    ///     our purpose to make this conversion  .
    ///      4:20:17 PM to => 4-20-17
    String modifiedDate = DateFormat.jms("en_US").format(time);

    String cleanDate = modifiedDate.replaceAll(":", "-");
    String dateWithNoSpace = cleanDate.replaceAll(" ", "");
    String dateWithNoPM = dateWithNoSpace.replaceAll("PM", "");
    String dateWithNoAM = dateWithNoPM.replaceAll("AM", "");
    String cleanFinalDate = dateWithNoAM + "_2";

    return cleanFinalDate;
  }

  String showTime33H(DateTime time) {
    ///     OLD FUNCTION  : return "${DateFormat.jms().format(time)}";
    ///     our purpose to make this conversion  .
    ///      4:20:17 PM to => 4-20-17
    String modifiedDate = DateFormat.Hms("en_US").format(time);

    String cleanDate = modifiedDate.replaceAll(":", "-");
    String dateWithNoSpace = cleanDate.replaceAll(" ", "");
    String dateWithNoPM = dateWithNoSpace.replaceAll("PM", "");
    String dateWithNoAM = dateWithNoPM.replaceAll("AM", "");
    String cleanFinalDate = dateWithNoAM + "_2";

    return cleanFinalDate;
  }
}
