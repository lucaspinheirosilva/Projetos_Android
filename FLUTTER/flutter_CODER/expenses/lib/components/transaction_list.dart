import 'package:expenses/models/Transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final ScrollController _scrollController = ScrollController();

  TransactionList(this.transaction, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: transaction.isEmpty
          ? Column(
              children: [
               const Padding(
                  padding: EdgeInsets.only(bottom: 20,top: 20),
                  child: Text(
                    "Nenhuma Transação Cadastrada!",
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Caveat',
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        color: Colors.black54),
                  ),
                ),

                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : Scrollbar(
              thumbVisibility: true,
              thickness: 10,
              trackVisibility: true,
              controller: _scrollController,
              radius: const Radius.circular(10),
              child: ListView.builder(
                  itemCount: transaction.length,
                  controller: _scrollController,
                  itemBuilder: (ctx, index) {
                    final tr = transaction[index];
                    return Card(
                      child: Row(
                        children: [
                          //PREÇO
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            decoration: BoxDecoration(
                                border: Border.all(
                              width: 2,
                              color: Theme.of(context).colorScheme.primary,
                            )),
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              'R\$${tr.value.toStringAsFixed(2)}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple,
                                  fontSize: 16,
                                  fontFamily: 'Noto'),
                            ),
                          ),
                          //TITULO
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tr.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(color: Colors.black)
                                    .copyWith(fontSize: 20),
                              ),
                              //DATA
                              Text(
                                DateFormat('dd/MM/yyyy HH:mm:ss')
                                    .format(tr.date),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Noto',
                                    color: Colors.black38,
                                    fontSize: 12,
                                    letterSpacing: 1),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  }),
            ),
    );
  }
}
