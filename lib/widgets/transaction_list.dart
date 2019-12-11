import 'package:expenses_planner/widgets/transaction_widget.dart';
import 'package:flutter/material.dart';
import 'package:expenses_planner/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return TransactionItem(
            transaction: transactions[index],
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
