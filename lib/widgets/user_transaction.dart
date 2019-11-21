import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './new_transaction.dart';
import './transaction_list.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'Jackate',
      amount: 29.9,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't1',
      title: 'Monitor',
      amount: 99.0,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'T-Shirt',
      amount: 53.9,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'MacBook Pro',
      amount: 88.0,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't5',
      title: 'Pants',
      amount: 93.0,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't6',
      title: 'Juice',
      amount: 18.0,
      date: DateTime.now(),
    ),
  ];

  // Add a new transaction to the _userTransactions list.
  void _addNewTransaction(String txTitle, double txAmount) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
    );
    setState(() {
      _userTransactions.add(newTransaction);
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
