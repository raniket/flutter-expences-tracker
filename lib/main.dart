import 'package:flutter/material.dart';
import 'transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'Jackate',
      amount: 2999.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't1',
      title: 'Monitor',
      amount: 9999.00,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Expences Tracker')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                child: Text('Chart'),
                color: Colors.blue,
              ),
            ),
            Column(
              children: <Widget>[
                ...(transactions as List<Transaction>).map((tx) {
                  return Card(
                    child: Text(tx.title),
                  );
                }).toList(),
              ],
            )
          ],
        ));
  }
}
