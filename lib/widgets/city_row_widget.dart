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
    return Row(
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
                  fontSize: 16.0),
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
                  fontSize: 16.0),
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
                  fontSize: 16.0),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            child: ListTile(
              leading: currentPrice - previousPrice < 0
                  ? const Icon(
                      Icons.arrow_drop_down_sharp,
                      color: Colors.red,
                    )
                  : const Icon(
                      Icons.arrow_drop_up_sharp,
                      color: Colors.greenAccent,
                    ),
              title: Text(
                (currentPrice - previousPrice).toStringAsFixed(2),
              ),
            ),
          ),
        ),
        const Expanded(
          child: SizedBox(),
        ),
      ],
    );
  }
}
