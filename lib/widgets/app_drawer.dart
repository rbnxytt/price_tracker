import 'package:flutter/material.dart';
import 'package:price_tracker/constants.dart';
import 'package:price_tracker/global_data.dart';

import 'custom_button.dart';
import 'custom_textfield.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
    required this.saveButton,
  }) : super(key: key);

  final void Function() saveButton;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width,
      backgroundColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 300.0,
            width: 900.0,
            color: defaultBackgroundColor,
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Pick a Date',
                            style: subheaderTextStyle,
                          ),
                          Expanded(
                            child: CalendarDatePicker(
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2022, 8, 1),
                                lastDate: DateTime(DateTime.now().year,
                                    DateTime.now().month, DateTime.now().day),
                                onDateChanged: (date) {}),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const VerticalDivider(),
                Expanded(
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Update Prices',
                            style: subheaderTextStyle,
                          ),
                          for (String city in GlobalData.cities)
                            Expanded(
                              child: CustomTextField(
                                city: city,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Back',
                  style: TextStyle(fontSize: 12.0, color: Colors.black),
                ),
              ),
              const SizedBox(
                width: 80.0,
              ),
              CustomButton(
                color: Colors.greenAccent,
                onPressed: saveButton,
                child: const Text(
                  'Save',
                  style: TextStyle(fontSize: 12.0, color: Colors.white),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
