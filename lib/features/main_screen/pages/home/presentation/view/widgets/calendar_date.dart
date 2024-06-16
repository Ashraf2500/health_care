import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';
import 'package:intl/intl.dart';

class CustomCalendarDate extends StatefulWidget {
   CustomCalendarDate({
    Key? key,

  }) : super(key: key);
  @override
  State<CustomCalendarDate> createState() => _CustomCalendarDateState();
}

class _CustomCalendarDateState extends State<CustomCalendarDate> {

  DateTime _selectedDate = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String dayDateInit = (DateTime.now().day<10)?"0${DateTime.now().day}":DateTime.now().day.toString();
    String monthDateInit = (DateTime.now().month<10)?"0${DateTime.now().month}":DateTime.now().month.toString();
    String yearDateInit = DateTime.now().year.toString();
    context.read<CreateAppointmentCubit>().setDate(date: "$yearDateInit-$monthDateInit-$dayDateInit");
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          //color: Color(0x0A000000),
          color: ColorHelper.whiteColor,
          // border: Border.all(color: ColorHelper.blackColor.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(FixedVariables.radius12),
        ),
        child: TableCalendar(
          firstDay: DateTime.now(),
          lastDay: DateTime.utc(DateTime.now().year+1, DateTime.now().month, DateTime.now().day),
          focusedDay: _selectedDate,
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
            return isSameDay(_selectedDate, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDate = selectedDay;
              _focusedDay = focusedDay;
              print(_selectedDate.year);
              print(_selectedDate.month);
              print(_selectedDate.day);
              //print(_selectedDay.);
              String dayName = DateFormat('EEEE').format(_selectedDate);

                String dayDate = (_selectedDate.day<10)?"0${_selectedDate.day}":_selectedDate.day.toString();
                String monthDate = (_selectedDate.month<10)?"0${_selectedDate.month}":_selectedDate.month.toString();
                String yearDate = _selectedDate.year.toString();

                context.read<CreateAppointmentCubit>().setDateInt(dateInt: _selectedDate);
                context.read<CreateAppointmentCubit>().setDate(date: "$yearDate-$monthDate-$dayDate");


              //print("${_selectedDay.year}-${_selectedDay.month}-${_selectedDay.day}");
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
