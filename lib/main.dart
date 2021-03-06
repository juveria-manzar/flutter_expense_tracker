import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

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
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Grocery',
      amount: 69.99,
      date: DateTime.now(),
    ),
  ];
  // String titleInput;
  // String amountInput;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('Chart'),
              elevation: 5,
            ),
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: transactions.map((transaction) {
                return Card(
                    child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.purple,
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '\$${transaction.amount}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            TextField(
                              decoration: InputDecoration(labelText: 'Title'),
                              // onChanged: (value) {
                              //   titleInput = value;
                              // },
                              controller: titleController,
                            ),
                            TextField(
                              decoration: InputDecoration(labelText: 'Amount'),
                              // onChanged: (value) => amountInput = value,
                              controller: amountController,
                            ),
                            FlatButton(
                              onPressed: () {
                                print(titleController.text);
                                print(amountController.text);
                              },
                              child: Text('Add Transaction'),
                              textColor: Colors.purple,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          transaction.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          DateFormat.yMMMd().format(transaction.date),
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    )
                  ],
                ));
              }).toList())
        ],
      ),
    );
  }
}
