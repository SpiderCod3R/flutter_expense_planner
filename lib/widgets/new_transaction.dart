import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final ammountController = TextEditingController();

  void submitTransaction() {
    final titleInput = titleController.text;
    final ammountInput = double.parse(ammountController.text);

    if (titleInput.isEmpty || ammountInput <= 0) {
      return;
    }

    widget.addNewTransaction(
      titleInput,
      ammountInput,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
                onSubmitted: (_) => submitTransaction()
                // onChanged: (val) {
                //   titleInput = val;
                // },
                ),
            TextField(
              decoration: InputDecoration(labelText: 'Ammout'),
              controller: ammountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitTransaction(),
              // onChanged: (val) => ammoutInput = val,
            ),
            FlatButton(
                child: Text("Add Transaction"),
                textColor: Colors.purple,
                onPressed: submitTransaction),
          ],
        ),
      ),
    );
  }
}
