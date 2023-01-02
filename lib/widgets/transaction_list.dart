import 'package:flutter/material.dart';

import '../models/transaction.dart';
import '../res/string.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({
    required this.transactions,
    required this.deleteTxElement,
    super.key,
  });

  final List<Transaction> transactions;
  final Function deleteTxElement;
  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? const Center(
            child: Text(Strings.emptyListError),
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              return TransactionListItem(
                txItem: transactions[index],
                deleteElement: deleteTxElement,
              );
            });
  }
}
