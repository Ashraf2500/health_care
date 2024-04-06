import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class CustomCalendarDate extends StatefulWidget {
  const CustomCalendarDate({Key? key}) : super(key: key);

  @override
  State<CustomCalendarDate> createState() => _CustomCalendarDateState();
}

class _CustomCalendarDateState extends State<CustomCalendarDate> {

  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.twoWeeks;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          color: ColorHelper.whiteColor,
          // border: Border.all(color: ColorHelper.blackColor.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(FixedVariables.radius12),
        ),
        child: TableCalendar(
          firstDay: DateTime.now(),
          lastDay: DateTime.utc(DateTime.now().year+1, DateTime.now().month, DateTime.now().day),
          focusedDay: _selectedDay,
          daysOfWeekHeight: FixedVariables.heightScreenQuery(context)*0.06,

          //---------------- Header Style --------------------------
          headerStyle: HeaderStyle(
            titleTextStyle: TextStyleHelper.style18M.copyWith(color: ColorHelper.whiteColor),
            leftChevronIcon: Icon(Icons.chevron_left,color: ColorHelper.whiteColor,),
            rightChevronIcon: Icon(Icons.chevron_right,color: ColorHelper.whiteColor,),
            decoration: BoxDecoration(
              color: ColorHelper.mainColor,
              borderRadius: BorderRadius.vertical(top:Radius.circular(FixedVariables.radius12)),
            ),
            formatButtonShowsNext: false,
            formatButtonDecoration: BoxDecoration(
              color: ColorHelper.whiteColor,
              borderRadius: BorderRadius.circular(FixedVariables.radius8),
            ),
            formatButtonTextStyle: TextStyle(color: ColorHelper.mainColor),
          ),

          //---------------- calendar Style ------------------------
          calendarStyle: CalendarStyle(
            selectedDecoration: BoxDecoration(
              color: ColorHelper.mainColor,
              shape: BoxShape.circle,
            ),
            todayDecoration: BoxDecoration(
              color: ColorHelper.mainColor.withOpacity(0.3),
              shape: BoxShape.circle,
            ),

          ),

          //---------------- selected Day --------------------------
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          },

          //---------------- Calendar Format -----------------------
          calendarFormat: _calendarFormat,
          onFormatChanged: (format) {
            setState(() {
              _calendarFormat = format;
            });
          },

          //---------------- OnPage Changed  -----------------------
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },

        ),
      ),
    );
  }
}
