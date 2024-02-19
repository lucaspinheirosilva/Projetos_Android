import 'package:expenses/components/charBar.dart';
import 'package:expenses/models/Transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentsTransaction;

  List<Map<String, Object>> get groupedTransaction {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double totalSum = 0.0;

      for (int i = 0; i < recentsTransaction.length; i++) {
        bool sameDay = recentsTransaction[i].date.day == weekDay.day;
        bool sameMonth = recentsTransaction[i].date.month == weekDay.month;
        bool sameYear = recentsTransaction[i].date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += recentsTransaction[i].value;
        }
      }

      return {
        'day':
            DateFormat.E('pt_BR').format(weekDay).substring(0, 3).toUpperCase(),
        'value': totalSum
      };
    }).reversed.toList();
  }

  double get _weekTotalValue {
    return groupedTransaction.fold(0, (sum, tr) {
      return sum + (tr['value'] as double);
    });
  }

  Chart(this.recentsTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: groupedTransaction.map((tr) {
            // return Text('${tr['day']}:${tr['value']}');
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  label: tr['day'].toString(),
                  value: double.parse(tr['value'].toString()),
                  percentage: _weekTotalValue == 0 ? 0: (tr['value'] as double) / _weekTotalValue),
            );
          }).toList(),
        ),
      ),
    );
  }
}
