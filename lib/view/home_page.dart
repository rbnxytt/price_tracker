import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:price_tracker/view/side_panel.dart';
import 'package:provider/provider.dart';

import '../model/app_controller.dart';
import '../model/constants.dart';
import '../model/database.dart';
import '../model/global_data.dart';
import '../widgets/app_drawer.dart';
import '../widgets/table_labels.dart';

// Main page of the app.
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController? _gzTextEditingController;
  TextEditingController? _szTextEditingController;
  TextEditingController? _hzTextEditingController;
  TextEditingController? _mmTextEditingController;
  TextEditingController? _fsTextEditingController;
  DateTime? _dateTime;
  Box? box;

  void _getDateTime() {
    setState(() {
      _dateTime = DateTime.now();
    });
  }

  @override
  void initState() {
    openBox();
    _gzTextEditingController = TextEditingController();
    _szTextEditingController = TextEditingController();
    _hzTextEditingController = TextEditingController();
    _mmTextEditingController = TextEditingController();
    _fsTextEditingController = TextEditingController();

    _getDateTime();
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (_) => _getDateTime());
  }

  void openBox() async {
    box = await Hive.openBox<Database>('database');
  }

  @override
  void dispose() {
    _gzTextEditingController!.dispose();
    _szTextEditingController!.dispose();
    _hzTextEditingController!.dispose();
    _mmTextEditingController!.dispose();
    _fsTextEditingController!.dispose();
    box!.close();
    super.dispose();
  }

  // Function that saves the data input from AppDrawer, then shows a Snackbar to tell status.
  void save(List<String> data) {
    // Provider.of<AppController>(context, listen: false).updateData(data);

    if (GlobalData.formKey.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              actionsAlignment: MainAxisAlignment.center,
              title: const Text(
                'Please check if everything is correct.',
                style: TextStyle(fontSize: 14.0, color: Colors.greenAccent),
              ),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Date: ${DateFormat('yyyy/d/MM').format(Provider.of<AppController>(context).dateTime)}'),
                  const Divider(),
                  for (int index = 0; index < GlobalData.cities.length; index++)
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('${GlobalData.cities[index]}: ${data[index]}'),
                        const Divider()
                      ],
                    )
                ],
              ),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop('dialog');
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(primary: Colors.greenAccent),
                    onPressed: () {
                      _gzTextEditingController!.clear();
                      _szTextEditingController!.clear();
                      _hzTextEditingController!.clear();
                      _mmTextEditingController!.clear();
                      _fsTextEditingController!.clear();
                      Navigator.of(context, rootNavigator: true).pop('dialog');
                      // Saves Price data to hive storage
                      // Provider.of<AppController>(context, listen: false).updateDatabase(data);
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
                    },
                    child: const Text('Confirm'))
              ],
            );
          });
    }
  }

  // Function responsible for toggling between charts.
  void showChart(int index) {
    Provider.of<AppController>(context, listen: false).changeChart(index);
  }

  Color cityColor(String city) {
    return Provider.of<AppController>(context).currentCity == city
        ? Colors.amberAccent
        : Colors.lightBlueAccent;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawerEnableOpenDragGesture: false,
        resizeToAvoidBottomInset: false,
        key: GlobalData.key,
        endDrawer: AppDrawer(
          controllers: [
            _gzTextEditingController,
            _szTextEditingController,
            _hzTextEditingController,
            _mmTextEditingController,
            _fsTextEditingController,
          ],
          // Edit the prices here. Contains buttons to update and textfields to enter new prices.
          saveButton: () {
            save([
              _gzTextEditingController!.text,
              _szTextEditingController!.text,
              _hzTextEditingController!.text,
              _mmTextEditingController!.text,
              _fsTextEditingController!.text
            ]);
            setState(() {});
          },
        ),
        backgroundColor: defaultBackgroundColor,
        body: Row(
          children: [
            // Contains the left side panel
            SidePanel(
              dateTime: _dateTime,
              updateData: () {
                GlobalData.key.currentState!.openEndDrawer();
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
                                    Text('Market Values',
                                        style: titleTextStyle.copyWith(
                                            color: Colors.amberAccent)),
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
                                    const Expanded(
                                        flex: 2,
                                        child: TableLabels()), // Table headers
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
                                                      setState(() {});
                                                    },
                                                    child: Text(
                                                      'Guangzhou',
                                                      style: TextStyle(
                                                          color: cityColor(
                                                              'Guangzhou'),
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
                                                      setState(() {});
                                                    },
                                                    child: Text(
                                                      'Shenzhen',
                                                      style: TextStyle(
                                                          color: cityColor(
                                                              'Shenzhen'),
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
                                                      setState(() {});
                                                    },
                                                    child: Text(
                                                      'Huizhou',
                                                      style: TextStyle(
                                                          color: cityColor(
                                                              'Huizhou'),
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
                                                      setState(() {});
                                                    },
                                                    child: Text(
                                                      'Maoming',
                                                      style: TextStyle(
                                                          color: cityColor(
                                                              'Maoming'),
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
                                                      setState(() {});
                                                    },
                                                    child: Text(
                                                      'Foshan',
                                                      style: TextStyle(
                                                          color: cityColor(
                                                              'Foshan'),
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
                                                child: InkWell(
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
                                                      color: Colors.grey,
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
                                                      color: Colors.grey,
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
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0),
                                            child: Text(
                                              '${Provider.of<AppController>(context).currentCity} 7-Day View',
                                              style: const TextStyle(
                                                  fontSize: 9,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.amberAccent),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 5,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20.0,
                                                vertical: 5.0),
                                            child: Table(
                                              children: [
                                                const TableRow(
                                                  children: [
                                                    SizedBox(
                                                      child: Center(
                                                        child: Text(
                                                          'Date',
                                                          style: TextStyle(
                                                              fontSize: 9,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Colors
                                                                  .greenAccent),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      child: Center(
                                                        child: Text(
                                                          'Prices',
                                                          style: TextStyle(
                                                              fontSize: 9,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Colors
                                                                  .greenAccent),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                for (int index = 0;
                                                    index < 7;
                                                    index++)
                                                  TableRow(
                                                    decoration: const BoxDecoration(
                                                        border: Border(
                                                            top: BorderSide(
                                                                color:
                                                                    Colors.grey,
                                                                width: 0.25,
                                                                style:
                                                                    BorderStyle
                                                                        .solid),
                                                            bottom: BorderSide(
                                                                color:
                                                                    Colors.grey,
                                                                width: 0.25,
                                                                style: BorderStyle
                                                                    .solid))),
                                                    children: [
                                                      SizedBox(
                                                        height: 15.0,
                                                        child: Center(
                                                          child: Text(
                                                            GlobalData
                                                                .dates[index]!,
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        9),
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
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 9),
                                                        )),
                                                      )
                                                    ],
                                                  ),
                                              ],
                                            ),
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
