import 'package:flutter/material.dart';
import 'package:price_tracker/view/side_panel.dart';
import 'package:provider/provider.dart';

import '../app_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff151515),
      body: Row(
        children: [
          const SidePanel(),
          Expanded(
            flex: 6,
            child: Container(
              color: const Color(0xff151515),
              child: Column(children: [
                Expanded(
                  flex: 6,
                  child: Container(
                    color: const Color(0xff151515),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: SizedBox(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'Live Price Tracker',
                                    style: TextStyle(
                                        color: Color(0xff16EEEE),
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'ZHONG SHI LIANG',
                                    style: TextStyle(
                                        color: Color(0xff16EEEE),
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: SizedBox(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Expanded(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Market Values',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                          color: Color(0xffF8A1A1),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'Latest Data',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0,
                                            color: Color(0xffFFFA7F),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 200.0,
                                        ),
                                        Text(
                                          'August 18, 2022',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 7,
                          child: Container(
                            color: const Color(0xff1E1E1E),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  DefaultTextStyle(
                                    style: const TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                    child: Row(
                                      children: [
                                        const Expanded(
                                          child: SizedBox(
                                            child: Text('City'),
                                          ),
                                        ),
                                        const Expanded(
                                          child: SizedBox(
                                            child: Text('Current Price (RMB)'),
                                          ),
                                        ),
                                        const Expanded(
                                          child: SizedBox(
                                            child: Text('Previous Price'),
                                          ),
                                        ),
                                        Expanded(
                                          child: SizedBox(
                                            child: ListTile(
                                              minLeadingWidth: 5.0,
                                              leading: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: const [
                                                  Icon(
                                                    Icons.arrow_drop_up_sharp,
                                                    color: Colors.greenAccent,
                                                  ),
                                                  Icon(
                                                    Icons.arrow_drop_down_sharp,
                                                    color: Colors.redAccent,
                                                  ),
                                                ],
                                              ),
                                              title: const Text('Change'),
                                            ),
                                          ),
                                        ),
                                        const Expanded(
                                          child: SizedBox(),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Divider(),
                                  ...Provider.of<AppController>(context).data
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(color: const Color(0xff151515)),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
