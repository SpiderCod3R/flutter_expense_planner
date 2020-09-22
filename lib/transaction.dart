import 'package:flutter/foundation.dart';

class Transaction {
  String id;
  String title;
  double ammout;
  DateTime date;

  Transaction({
    @required this.id,
    @required this.title,
    @required this.ammout,
    @required this.date,
  });
}
