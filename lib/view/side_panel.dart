import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:price_tracker/model/constants.dart';
import 'package:price_tracker/widgets/custom_button.dart';

class SidePanel extends StatelessWidget {
  const SidePanel({
    Key? key,
    required this.updateData,
    this.dateTime,
  }) : super(key: key);

  final void Function() updateData;
  final DateTime? dateTime;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: secondaryBackgroundColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Expanded(
                  child: SizedBox(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Text(
                            'Current Date',
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                        ListTile(
                          minLeadingWidth: 0,
                          leading: const FaIcon(
                            FontAwesomeIcons.calendarDays,
                            size: 20.0,
                            color: Color(0xffE25933),
                          ),
                          title: Text(
                            DateFormat('M/dd/yyyy').format(dateTime!),
                            style: const TextStyle(fontSize: 12.0),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    child: Center(
                      child: CustomButton(
                        onPressed: updateData,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            FaIcon(
                              FontAwesomeIcons.penToSquare,
                              color: Color(0xffE25933),
                              size: 15.0,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Center(
                              child: Text(
                                'Update Data',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 10.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomButton(
                        child: const Text(
                          'Exit',
                          style: TextStyle(fontSize: 12.0, color: Colors.black),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
