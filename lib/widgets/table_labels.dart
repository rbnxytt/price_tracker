import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../model/app_controller.dart';

class TableLabels extends StatelessWidget {
  const TableLabels({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
          fontSize: 11.0, color: Colors.white, fontWeight: FontWeight.w600),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(bottom: 2.0, right: 5.0),
                    child: FaIcon(
                      FontAwesomeIcons.city,
                      size: 10.0,
                      color: Colors.greenAccent,
                    ),
                  ),
                  Text('City'),
                ],
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              child: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(bottom: 2.0, right: 5.0),
                    child: FaIcon(
                      FontAwesomeIcons.yenSign,
                      size: 10.0,
                      color: Colors.redAccent,
                    ),
                  ),
                  Text('Current Price'),
                ],
              ),
            ),
          ),
          const Expanded(
            child: SizedBox(
              child: Text('Previous Price'),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                SizedBox(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: IconButton(
                              onPressed: () {
                                bool up = true;
                                int days = Provider.of<AppController>(context,
                                        listen: false)
                                    .daysAgo;
                                Provider.of<AppController>(context,
                                        listen: false)
                                    .changeDaysAgo(context, days, up);
                              },
                              icon: const Icon(
                                Icons.arrow_drop_up_sharp,
                                color: Colors.greenAccent,
                              ),
                            ),
                          ),
                          Expanded(
                            child: IconButton(
                              onPressed: () {
                                bool down = false;
                                int days = Provider.of<AppController>(context,
                                        listen: false)
                                    .daysAgo;
                                Provider.of<AppController>(context,
                                        listen: false)
                                    .changeDaysAgo(context, days, down);
                              },
                              icon: const Icon(
                                Icons.arrow_drop_down_sharp,
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(children: [
                  Text(
                    '${Provider.of<AppController>(context).daysAgo} day ',
                    style: const TextStyle(color: Colors.amberAccent),
                  ),
                  const Text(
                    'Change',
                    style:
                        TextStyle(fontSize: 11.0, fontWeight: FontWeight.bold),
                  ),
                ]),
              ],
            ),
          ),
          // const Expanded(
          //   child: SizedBox(),
          // ),
        ],
      ),
    );
  }
}
