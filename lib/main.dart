import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'dart:math';

import './widgets/transctions_list.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';

void main() {
  runApp(
    MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('pt', 'BR'), // Brazil, no country code
      ],
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    return MaterialApp(
      title: "Personal Exepenses",
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: "t1",
      title: "Pichau Gaming Wave - KIT",
      ammount: 203.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: "Gabinete Gougar",
      ammount: 329.99,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String titleInput, double ammountInput) {
    final Random random = new Random();
    final transaction = Transaction(
      title: titleInput,
      ammount: ammountInput,
      date: DateTime.now(),
      id: random.nextInt(999).toString(),
    );

    setState(() {
      _userTransactions.add(transaction);
    });
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.purpleAccent,
                child: Text("CHART"),
                elevation: 5,
              ),
            ),
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
