import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addNewTransaction;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addNewTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: titleController,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                      controller: amountController,
                    ),
                    FlatButton(
                      onPressed: () {
                        print(titleController.text);
                        print(amountController.text);
                        addNewTransaction(titleController.text, double.parse(amountController.text));
                      },
                      textColor: Colors.purple,
                      child: Text(
                        'Add Transaction',
                      ),
                    )
                  ],
                ),
              ),
            );
  }
}