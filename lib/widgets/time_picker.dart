import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/plan.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({super.key});

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  TimeOfDay? time = const TimeOfDay(hour: 0, minute: 0);

  @override
  Widget build(BuildContext context) {

    final planData = Provider.of<Plan>(context, listen: false);

    return SizedBox(
      height: 20,
      width: 50,
      child: TextButton(
        onPressed: () async {
          TimeOfDay? newTime =
              await showTimePicker(context: context, initialTime: new TimeOfDay.now(), );
          if (newTime != null) {
            setState(() {
              time = newTime;
            });
          }
        },
        style: TextButton.styleFrom(padding: EdgeInsets.zero, tapTargetSize: MaterialTapTargetSize.shrinkWrap),
        child: Text('${time!.hour.toString()} : ${time!.minute.toString()}',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
      ),
    );
  }
}
