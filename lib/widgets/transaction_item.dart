import 'package:flutter/material.dart';

import '../models/transaction.dart';
import '../res/utils.dart';

class TransactionListItem extends StatelessWidget {
  const TransactionListItem({
    required this.txItem,
    required this.deleteElement,
    super.key,
  });
  final Function deleteElement;
  final Transaction txItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
              width: 70,
              height: 70,
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    border: Border.all(
                      color: Theme.of(context).primaryColorDark,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(child: Text('\$${txItem.price}')),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    txItem.label,
                    style: const TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Consolas'),
                  ),
                  const SizedBox(height: 5),
                  Text(getDateFormat(txItem.date)),
                ],
              ),
            ),
            IconButton(
              onPressed: () => deleteElement(txItem),
              icon: const Icon(Icons.delete),
              color: Colors.blueGrey,
              iconSize: 30,
            )
          ],
        ),
      ),
    );
  }
}
