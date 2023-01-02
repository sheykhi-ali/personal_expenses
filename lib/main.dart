import 'package:flutter/material.dart';

import '../widgets/chart.dart';
import '../widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';

void main() => runApp(MaterialApp(
      title: 'Personal Expenses',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        fontFamily: 'Hack',
      ),
      home: const HomePage(),
    ));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _transactions = [
    Transaction(
      id: 'tx1',
      label: 'New Shoes',
      price: 12.98,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'tx2',
      label: 'New Pen',
      price: 11.98,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'tx3',
      label: 'CarWash service',
      price: 52.88,
      date: DateTime.now(),
    ),
  ];

  void _showButtomSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        context: context,
        builder: (bCt) {
          return NewTransaction(_addTxElement);
        });
  }

  void _deleteTxElement(Transaction tx) {
    setState(() {
      _transactions.remove(tx);
    });
  }

  void _addTxElement(Transaction tx) {
    setState(() {
      _transactions.add(tx);
    });
  }

  List<Transaction> get recentTxs {
    return _transactions.where((trElement) {
      return trElement.date
          .isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Expenses'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => _showButtomSheet(),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Chart(recentTxs: recentTxs),
              SizedBox(
                height: 300,
                child: TransactionList(
                  transactions: _transactions,
                  deleteTxElement: _deleteTxElement,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showButtomSheet(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
