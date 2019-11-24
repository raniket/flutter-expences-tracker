import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate = null;

  void _submitData() {
    final enteredTtile = _titleController.text;
    final enteredAmout = double.parse(_amountController.text);

    // Do not add a new transaction if any of the field is empty or has invalid value.
    if (enteredTtile.isEmpty || enteredAmout < 0) return;

    widget.addNewTransaction(
      enteredTtile,
      enteredAmout,
    );

    Navigator.of(context).pop();
  }

  // Show the date picker to the user.
  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: _titleController,
            onSubmitted: (_) => _submitData(),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: _amountController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => _submitData(),
          ),
          Container(
            height: 70,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    _selectedDate == null
                        ? 'No date selected!'
                        : 'Selected date: ${DateFormat.yMd().format(_selectedDate)}',
                  ),
                ),
                FlatButton(
                  child: Text(
                    'SELECT DATE',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: _presentDatePicker,
                  textColor: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
          RaisedButton(
            onPressed: _submitData,
            color: Theme.of(context).primaryColor,
            child: Text(
              'ADD TRANSACTION',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            textColor: Theme.of(context).textTheme.button.color,
          )
        ],
      ),
    );
  }
}
