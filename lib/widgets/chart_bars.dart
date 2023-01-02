import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String bLabel;
  final double bPrice;
  final double bPercentOfTotal;

  const ChartBar({
    required this.bLabel,
    required this.bPrice,
    required this.bPercentOfTotal,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(bLabel),
        const SizedBox(height: 4),
        SizedBox(
          width: 12,
          height: 60,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                  border: Border.all(
                    color: Theme.of(context).primaryColorDark,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: bPercentOfTotal,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColorDark,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(185, 43, 59, 99),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 4),
        FittedBox(
          child: Text(
            '\$$bPrice',
            style: Theme.of(context).textTheme.overline,
          ),
        )
      ]),
    );
  }
}
