import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _ammountController = TextEditingController();
  DateTime _selectedDate;

  void _submitTransaction() {
    if (_ammountController.text.isEmpty) {
      return;
    }

    final titleInput = _titleController.text;
    final ammountInput = double.parse(_ammountController.text);

    if (titleInput.isEmpty || ammountInput <= 0 || _selectedDate == null) {
      return;
    }

    widget.addNewTransaction(
      titleInput,
      ammountInput,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presetDatePicker() {
    showRoundedDatePicker(
      context: context,
      height: 350,
      initialDate: DateTime.now(),
      firstDate: DateTime(2016),
      lastDate: DateTime.now(),
      borderRadius: 10,
      theme: ThemeData(primarySwatch: Colors.purple),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });

    // showDatePicker(
    //   context: context,
    //   initialDate: DateTime.now(),
    //   firstDate: DateTime(2020),
    //   lastDate: DateTime.now(),
    //   builder: (context, child) {
    //     return Theme(
    //       data: ThemeData.dark().copyWith(
    //         primaryColor: Colors.red, //Head background
    //         accentColor: Colors.red, //selection color
    //         dialogBackgroundColor: Colors.amber, //Background color
    //       ),
    //       child: child,
    //     );
    //   },
    // ).then((pickedDate) {
    //   if (pickedDate == null) {
    //     return;
    //   }
    //   setState(() {
    //     _selectedDate = pickedDate;
    //   });
    // });
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
              controller: _titleController,
              onSubmitted: (_) => _submitTransaction(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Ammout'),
              controller: _ammountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitTransaction(),
              // onChanged: (val) => ammoutInput = val,
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'Sem data Selecionada'
                          : 'Data Selecionada - ${DateFormat.yMd('pt').format(_selectedDate)}',
                    ),
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: _presetDatePicker,
                  )
                ],
              ),
            ),
            RaisedButton(
                child: Text("Add Transaction"),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
                onPressed: _submitTransaction),
          ],
        ),
      ),
    );
  }
}
