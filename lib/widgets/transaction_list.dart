import 'package:flutter/material.dart';
import 'package:personal_expenses_app/models/transaction.dart';

import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    print('build() for Transaction List');
    final mediaQuery = MediaQuery.of(context);
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: <Widget>[
                  Text(
                    'No transactions added yet!',
                    style: Theme.of(context).textTheme.title,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )
        : ListView(
            children: transactions
                .map(
                  (tx) => TransactionItem(
                    key: ValueKey(tx.id),
                    transaction: tx,
                    deleteTx: deleteTx,
                  ),
                )
                .toList(),
          );
    // ListView.builder(
    //     itemBuilder: (ctx, index) {
    //       return TransactionItem(
    //         transaction: transactions[index],
    //         deleteTx: deleteTx,
    //       );
    //     },
    //     itemCount:
    //         transactions.length, // Use the number of items in the list
    //   );
  }
}
