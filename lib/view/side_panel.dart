import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class SidePanel extends StatelessWidget {
  const SidePanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: const Color(0xff1E1E1E),
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
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: const FaIcon(
                            FontAwesomeIcons.calendarDays,
                            size: 30.0,
                            color: Color(0xffE25933),
                          ),
                          title: Text(
                            DateFormat('M/dd/yyyy').format(DateTime.now()),
                            style: const TextStyle(fontSize: 18.0),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    child: Center(
                      child: TextButton(
                        onPressed: () {},
                        child: Container(
                          height: 52,
                          width: 205,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0)),
                          child: const ListTile(
                            leading: FaIcon(
                              FontAwesomeIcons.penToSquare,
                              color: Color(0xffE25933),
                            ),
                            title: Text(
                              'Update Data',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: TextButton(
                        onPressed: () {},
                        child: Container(
                          height: 52,
                          width: 205,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0)),
                          child: const Center(
                            child: Text(
                              'Exit',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
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
