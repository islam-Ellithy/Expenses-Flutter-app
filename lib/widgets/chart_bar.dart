import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String day;
  final double amount;
  final double percentage;

  ChartBar({this.amount, this.day, this.percentage});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      FittedBox(child: Text('\$${amount.toStringAsFixed(0)}')),
      SizedBox(
        height: 10,
      ),
      Container(
        width: 10,
        height: 100,
        color: Color.fromRGBO(220, 220, 220, 1),
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: FractionallySizedBox(
                heightFactor: percentage,
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 5,
      ),
      Text(this.day)
    ]);
  }
}
