import 'package:expenses_planner/widgets/transaction_widget.dart';
import 'package:flutter/material.dart';
import 'package:expenses_planner/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text('No Transactions Added Yet',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 400,
                    child: Image.asset('assets/images/no-result.png',
                        fit: BoxFit.scaleDown)),
              ],
            )
          : ListView.builder(
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
