import 'package:expenses_planner/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;

  TransactionItem({@required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 10),
              padding: EdgeInsets.all(15),
              child: Text(
                '\$ ${transaction.amount.toStringAsFixed(2)}',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold),
              ),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent, width: 5)),
            ),
            Container(
              padding: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    transaction.title,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    DateFormat("yyyy-MM-dd").format(transaction.date),
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
