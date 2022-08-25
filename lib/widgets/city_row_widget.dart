import 'package:flutter/material.dart';

class CityRowWidget extends StatelessWidget {
  const CityRowWidget({
    Key? key,
    required this.city,
    required this.currentPrice,
    required this.previousPrice,
  }) : super(key: key);

  final String city;
  final double currentPrice;
  final double previousPrice;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: SizedBox(
              child: Text(
                city,
                style: const TextStyle(
                    color: Color.fromARGB(
                      255,
                      236,
                      112,
                      112,
                    ),
                    fontWeight: FontWeight.w600,
                    fontSize: 10.0),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              child: Text(
                '$currentPrice',
                style: const TextStyle(
                    color: Color.fromARGB(255, 16, 207, 198),
                    fontWeight: FontWeight.w600,
                    fontSize: 10.0),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              child: Text(
                '$previousPrice',
                style: const TextStyle(
                    color: Color.fromARGB(255, 189, 226, 24),
                    fontWeight: FontWeight.w600,
                    fontSize: 10.0),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: SizedBox(
                child: Row(
                  children: [
                    currentPrice - previousPrice < 0
                        ? const Icon(
                            Icons.arrow_drop_down_sharp,
                            color: Colors.red,
                          )
                        : const Icon(
                            Icons.arrow_drop_up_sharp,
                            color: Colors.greenAccent,
                          ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      (currentPrice - previousPrice).toStringAsFixed(2),
                      style: const TextStyle(fontSize: 10.0),
                    ),
                    const SizedBox(
                      width: 90.0,
                    ),
                  ],
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
