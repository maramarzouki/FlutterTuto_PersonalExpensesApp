import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/widgets/transaction_item.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   height: MediaQuery.of(context).size.height * 0.72,
    return transactions.isEmpty
        ? LayoutBuilder(builder: ((context, constraints) {
            return Column(
              children: [
                Text(
                  'No Transactions added yet!',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          }))
        : ListView(
            children: transactions
                .map((tx) => TransactionItem(
                    key: ValueKey(tx.id), transaction: tx, deleteTx: deleteTx))
                .toList());

    // ListView.builder(
    //     itemBuilder: (context, index) {
    //       return TransactionItem(
    //           transaction: transactions[index], deleteTx: deleteTx);

    //     },
    //     itemCount: transactions.length,
    //   );
  }
}
