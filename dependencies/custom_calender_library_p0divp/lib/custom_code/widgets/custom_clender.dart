import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomClender extends StatefulWidget {
  const CustomClender({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _CustomClenderState createState() => _CustomClenderState();
}

class _CustomClenderState extends State<CustomClender> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.0,
      child: CupertinoDatePicker(
        mode: CupertinoDatePickerMode.date,
        initialDateTime: selectedDate,
        maximumDate: DateTime.now(),
        onDateTimeChanged: (DateTime newDate) {
          setState(() {
            selectedDate = newDate;
            print("Fecha seleccionada: $selectedDate");
            // Si usas FFAppState (FlutterFlow):
            // FFAppState().update(() {
            //   FFAppState().date = selectedDate;
            // });
          });
        },
      ),
    );
  }
}
