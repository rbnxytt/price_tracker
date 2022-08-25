import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:price_tracker/view/side_panel.dart';
import 'package:price_tracker/widgets/custom_button.dart';
import 'package:price_tracker/widgets/custom_line_chart.dart';
import 'package:provider/provider.dart';

import '../model/app_controller.dart';
import '../model/constants.dart';
import '../model/global_data.dart';
import '../widgets/app_drawer.dart';
import '../widgets/table_labels.dart';

// Create a key for the home page scaffold.
final GlobalKey<ScaffoldState> _key = GlobalKey();

// Main page of the app.
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController? _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController!.dispose();
    super.dispose();
  }

  void save() {
    Navigator.pop(context);
    var snackBar = SnackBar(
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.greenAccent,
      content: Row(
        children: const [
          FaIcon(
            FontAwesomeIcons.check,
            color: Colors.black,
          ),
          Text('  Saved Successfully.'),
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showChart(int index) {
    Provider.of<AppController>(context, listen: false).changeChart(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawerEnableOpenDragGesture: false,
        resizeToAvoidBottomInset: false,
        key: _key,
        endDrawer: AppDrawer(
          // Edit the prices here. Contains buttons to update and textfields to enter new prices.
          saveButton: save,
        ),
        backgroundColor: defaultBackgroundColor,
        body: Row(
          children: [
            // Contains the left side panel
            SidePanel(
              updateData: () {
                _key.currentState!.openEndDrawer();
              },
            ),
            // Contains the body of the app
            Expanded(
              flex: 4,
              child: Container(
                color: defaultBackgroundColor,
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Expanded(
                    flex: 7,
                    child: Container(
                      color: defaultBackgroundColor,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Contains the App Title and Company Name
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15.0),
                              child: SizedBox(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Live Price Tracker',
                                        style: titleTextStyle),
                                    Text('ZHONG SHI LIANG',
                                        style: titleTextStyle)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // Contains Headers above the price table which includes the latest date of the data.
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: SizedBox(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Market Values',
                                          style: subheaderTextStyle,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Latest Data',
                                            style: subheaderTextStyle.copyWith(
                                                color: const Color.fromARGB(
                                                    255, 224, 224, 80)),
                                          ),
                                          const SizedBox(
                                            width: 122.0,
                                          ),
                                          Text(
                                              Provider.of<AppController>(
                                                      context)
                                                  .latestData!,
                                              style: dateTextStyle),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // contains the price table
                          Expanded(
                            flex: 5,
                            child: Container(
                              color: secondaryBackgroundColor,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const TableLabels(), // Table headers
                                    const Divider(),
                                    ...Provider.of<AppController>(context)
                                        .data // Holds the price data
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
                    child: Container(
                      color: defaultBackgroundColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 7.5, top: 5.0),
                              child: SizedBox(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Expanded(
                                        flex: 1, child: Text('Trends')),
                                    Expanded(
                                      flex: 5,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20.0),
                                        child: SizedBox(
                                          child: Row(children: [
                                            Expanded(
                                              child: Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: SizedBox(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      showChart(0);
                                                    },
                                                    child: const Text(
                                                      'Guangzhou',
                                                      style: TextStyle(
                                                          color: Colors
                                                              .lightBlueAccent,
                                                          fontSize: 9.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: SizedBox(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      showChart(1);
                                                    },
                                                    child: const Text(
                                                      'Shenzhen',
                                                      style: TextStyle(
                                                          color: Colors
                                                              .lightBlueAccent,
                                                          fontSize: 9.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: SizedBox(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      showChart(2);
                                                    },
                                                    child: const Text(
                                                      'Huizhou',
                                                      style: TextStyle(
                                                          color: Colors
                                                              .lightBlueAccent,
                                                          fontSize: 9.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: SizedBox(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      showChart(3);
                                                    },
                                                    child: const Text(
                                                      'Maoming',
                                                      style: TextStyle(
                                                          color: Colors
                                                              .lightBlueAccent,
                                                          fontSize: 9.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: SizedBox(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      showChart(4);
                                                    },
                                                    child: const Text(
                                                      'Foshan',
                                                      style: TextStyle(
                                                          color: Colors
                                                              .lightBlueAccent,
                                                          fontSize: 9.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ]),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: SizedBox(
                                        width: 150.0,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            SizedBox(
                                              child: Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: GestureDetector(
                                                  onTap: () {},
                                                  child: const Text(
                                                    'Weekly',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 9.0,
                                                      color: Colors.greenAccent,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              child: Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: GestureDetector(
                                                  onTap: () {},
                                                  child: const Text(
                                                    'Monthly',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 9.0,
                                                      color: Colors.greenAccent,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              child: Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: GestureDetector(
                                                  onTap: () {},
                                                  child: const Text(
                                                    'Yearly',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 9.0,
                                                      color: Colors.greenAccent,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const Divider(),
                          Expanded(
                            flex: 9,
                            child: Row(
                              children: [
                                SizedBox(
                                  child: GlobalData.charts[
                                      Provider.of<AppController>(context)
                                          .currentChart],
                                ),
                                Expanded(
                                  child: Container(
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: secondaryBackgroundColor,
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            '${Provider.of<AppController>(context).currentCity} 7-Day Prices View',
                                            style: const TextStyle(fontSize: 9),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 5,
                                          child: Table(
                                            children: [
                                              const TableRow(
                                                children: [
                                                  SizedBox(
                                                      child: Center(
                                                          child: Text(
                                                    'Date',
                                                    style:
                                                        TextStyle(fontSize: 9),
                                                  ))),
                                                  SizedBox(
                                                      child: Center(
                                                          child: Text(
                                                    'Prices',
                                                    style:
                                                        TextStyle(fontSize: 9),
                                                  )))
                                                ],
                                              ),
                                              for (int index = 0;
                                                  index < 7;
                                                  index++)
                                                TableRow(
                                                  children: [
                                                    SizedBox(
                                                      height: 15.0,
                                                      child: Center(
                                                        child: Text(
                                                          GlobalData
                                                              .dates[index]!,
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 9),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 15.0,
                                                      child: Center(
                                                          child: Text(
                                                        GlobalData
                                                            .priceList[Provider
                                                                    .of<AppController>(
                                                                        context)
                                                                .currentCity]![index]
                                                            .toString(),
                                                        style: const TextStyle(
                                                            fontSize: 9),
                                                      )),
                                                    )
                                                  ],
                                                )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
