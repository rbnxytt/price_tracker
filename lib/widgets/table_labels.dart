import 'package:flutter/material.dart';

class TableLabels extends StatelessWidget {
  const TableLabels({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
          fontSize: 9.0, color: Colors.white, fontWeight: FontWeight.w600),
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
                  mainAxisAlignment: MainAxisAlignment.center,
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
                title: const Text(
                  'Change',
                  style: TextStyle(fontSize: 9.0, fontWeight: FontWeight.bold),
                ),
              ),
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