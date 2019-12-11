import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewTransaction extends StatefulWidget {
  final Function addTxHandler;

  NewTransaction(this.addTxHandler);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    
    if (enteredTitle.length == 0 || enteredAmount < 0) {
      return;
    }

    widget.addTxHandler(enteredTitle, enteredAmount);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Price'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData,
            ),
            FlatButton(
                child: Text('Add Transaction'),
                textColor: Colors.blueAccent,
                onPressed: () => submitData())
          ],
        ),
      ),
    );
  }
}
