import 'package:flutter/material.dart';
import './transctions_list.dart';
import './new_transaction.dart';
import '../models/transaction.dart';
import 'dart:math';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: "t1",
      title: "Pichau Gaming Wave - KIT",
      ammout: 203.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: "Gabinete Gougar",
      ammout: 329.99,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String titleInput, double ammoutInput) {
    final Random random = new Random();
    final newTx = Transaction(
      title: titleInput,
      ammout: ammoutInput,
      date: DateTime.now(),
      id: random.nextInt(999).toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
