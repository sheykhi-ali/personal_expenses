import 'package:flutter/material.dart';

import '../models/transaction.dart';
import '../res/utils.dart';
import './chart_bars.dart';

class Chart extends StatelessWidget {
  const Chart({
    required this.recentTxs,
    super.key,
  });

  final List<Transaction> recentTxs;

  List<Map<String, Object>> get bars {
    double totalPrice;
    return List.generate(7, (index) {
      totalPrice = 0;
      DateTime comprableDay = DateTime.now().subtract(Duration(days: index));

      for (int i = 0; i < recentTxs.length; i++) {
        final currTxTime = recentTxs[i].date;

        if (currTxTime.day == comprableDay.day &&
            currTxTime.month == comprableDay.month &&
            currTxTime.year == comprableDay.year) {
          totalPrice += recentTxs[i].price;
        }
      }

      final dayTitle = getDayTitle(comprableDay);
      return {'bTitle': dayTitle, 'bPrice': totalPrice};
    });
  }

  double get percentOfTotalPrice {
    return bars.fold(
        0.0,
        (previousValue, element) =>
            previousValue + (element['bPrice'] as double));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: bars.map((bar) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                  bLabel: bar['bTitle'] as String,
                  bPrice: bar['bPrice'] as double,
                  bPercentOfTotal: percentOfTotalPrice == 0
                      ? 0.0
                      : (bar['bPrice'] as double) / percentOfTotalPrice,
                ),
              );
            }).toList()),
      ),
    );
  }
}
