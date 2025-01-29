import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class MyCalendarView extends StatelessWidget {
  const MyCalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 384,
      height: 170,
      decoration: const BoxDecoration(color: Color(0x99F3C4FB)),
      child: EasyDateTimeLine(
        headerProps: const EasyHeaderProps(
            centerHeader: true,
            monthPickerType: MonthPickerType.dropDown,
            dateFormatter: DateFormatter.dayOnly()),
        dayProps: const EasyDayProps(
          dayStructure: DayStructure.dayStrDayNum,
          inactiveDayStyle: DayStyle(
              monthStrStyle: TextStyle(fontSize: 12, color: Colors.black),
              decoration: BoxDecoration(
                color: Color(0x99DDB4E4),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              )),
          activeDayStyle: DayStyle(
            monthStrStyle: TextStyle(
              fontSize: 10,
              color: Colors.black,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: Color(0xCCBA68C8),
            ),
          ),
        ),
        initialDate: DateTime.now(),
        onDateChange: (selectedDate) {
          //`selectedDate` the new date selected.
        },
      ),
    );
  }
}
