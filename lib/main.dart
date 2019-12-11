import 'package:expenses_planner/widgets/new_transaction.dart';
import 'package:expenses_planner/widgets/user_transactions.dart';
import 'package:flutter/material.dart';

import 'models/transaction.dart';
import 'widgets/transaction_list.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 'T1', title: 'New shoes', amount: 99.00, date: DateTime.now()),
    Transaction(
        id: 'T2', title: 'Checken', amount: 110.00, date: DateTime.now()),
    Transaction(id: 'T3', title: 'Juice', amount: 20.00, date: DateTime.now()),
    Transaction(id: 'T4', title: 'Fish', amount: 45.00, date: DateTime.now()),
  ];

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(_addNewTransaction);
        });
  }

  void _addNewTransaction(String txTitle, double txAmount) {
    
    final Transaction tx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: DateTime.now(),
        id: _userTransactions.length.toString());
    setState(() {
      _userTransactions.add(tx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense planner"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _startAddNewTransaction(context)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
                width: double.infinity,
                child: Card(
                  color: Colors.blue,
                  child: Text(
                    'Charts',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                )),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
