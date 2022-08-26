import 'package:flutter/material.dart';
import 'package:price_tracker/model/app_controller.dart';
import 'package:price_tracker/model/constants.dart';
import 'package:price_tracker/model/global_data.dart';
import 'package:provider/provider.dart';

import 'custom_button.dart';
import 'custom_textfield.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
    required this.saveButton,
    required this.controllers,
  }) : super(key: key);

  final void Function() saveButton;
  final List<TextEditingController?> controllers;

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
                                onDateChanged: (date) {
                                  Provider.of<AppController>(context,
                                          listen: false)
                                      .changeDate(date);
                                }),
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
                          for (int index = 0;
                              index < GlobalData.cities.length;
                              index++)
                            Expanded(
                              child: CustomTextField(
                                controller: controllers[index],
                                city: GlobalData.cities[index],
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
