import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';

class datePage extends StatefulWidget {
  const datePage({super.key});
  @override
  _WidgetPageState createState() => _WidgetPageState();
}

class _WidgetPageState extends State<datePage> {
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: [
              Colors.grey[900]!,
              Colors.black,
            ],
            stops: const [0.7, 1.0],
          )),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: DatePickerWidget(
                    looping: false, 
                    firstDate: DateTime.now(),
                    dateFormat:
                        "dd/MMMM/yyyy",
                    locale: DatePicker.localeFromString('th'),
                    onChange: (DateTime newDate, _) {
                      setState(() {
                        _selectedDate = newDate;
                      });
                      print(_selectedDate);
                    },
                    pickerTheme: DateTimePickerTheme(
                      backgroundColor: Colors.transparent,
                      itemTextStyle:
                          TextStyle(color: Colors.white, fontSize: 19),
                      dividerColor: Colors.white,
                    ),
                  ),
                ),
                Text("${_selectedDate ?? ''}"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}