import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:price_tracker/view/side_panel.dart';
import 'package:provider/provider.dart';

import '../app_controller.dart';
import '../constants.dart';
import '../widgets/app_drawer.dart';
import '../widgets/table_labels.dart';

// Create a key for the home page scaffold.
final GlobalKey<ScaffoldState> _key = GlobalKey();

// Main page of the app.
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

    return SafeArea(
      child: Scaffold(
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
                                          Text('August 18, 2022',
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
                    child: Container(color: defaultBackgroundColor),
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
