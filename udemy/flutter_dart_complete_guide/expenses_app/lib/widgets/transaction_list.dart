import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;

  TransactionList(this._transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: _transactions.isEmpty
          ? Column(children: [
              Text(
                'No Transactions added yet',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 20),
              Container(
                height: 200,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              ),
            ])
          : ListView.builder(
              itemBuilder: (ctx, idx) => Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 26.0,
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: FittedBox(
                        child: Text(
                          _transactions[idx].getFormattedAmount(''),
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    _transactions[idx].title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    _transactions[idx].formattedDate,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 16,
                    ),
                  ),
                  visualDensity: VisualDensity.comfortable,
                ),
              ),
              // Card(
              //   child: Row(
              //     children: [
              //       Container(
              //         margin: EdgeInsets.symmetric(
              //           vertical: 10,
              //           horizontal: 15,
              //         ),
              //         decoration: BoxDecoration(
              //           border: Border.all(
              //             color: Theme.of(context).primaryColor,
              //             width: 1,
              //           ),
              //         ),
              //         padding: EdgeInsets.all(10),
              //         child: Text(
              //           _transactions[idx].formattedAmount,
              //           style: TextStyle(
              //             fontWeight: FontWeight.bold,
              //             fontSize: 20,
              //             color: Theme.of(context).primaryColor,
              //           ),
              //         ),
              //       ),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             _transactions[idx].title,
              //             style: Theme.of(context).textTheme.headline6,
              //           ),
              //           Text(
              //             _transactions[idx].formattedDate,
              //             style: TextStyle(
              //               color: Theme.of(context).primaryColor,
              //               fontSize: 16,
              //             ),
              //           ),
              //         ],
              //       )
              //     ],
              //   ),
              // ),
              itemCount: _transactions.length,
            ),
    );
  }
}
