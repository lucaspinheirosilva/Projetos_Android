import 'package:expenses/models/Transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final ScrollController _scrollController = ScrollController();
  final void Function(String) onRemove;

  TransactionList(this.transaction, this.onRemove, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 690,
      child: transaction.isEmpty
          ? Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 20, top: 20),
                  Rchild: Text(
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
                      elevation: 5,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 5),
                      child: ListTile(
                        trailing: IconButton(
                          onPressed: () => onRemove(tr.id),
                          icon: const Icon(Icons.delete_forever_outlined,
                              color: Colors.red),
                        ),
                        leading: CircleAvatar(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          radius: 30,
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: FittedBox(
                              child: Text(
                                'R\$${tr.value.toStringAsFixed(2)}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Noto'),
                              ),
                            ),
                          ),
                        ),
                        title: Text(
                          tr.title,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(color: Colors.black)
                              .copyWith(fontSize: 20),
                        ),
                        subtitle: Text(
                          DateFormat('dd/MM/yyyy HH:mm:ss').format(tr.date),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Noto',
                              color: Colors.black38,
                              fontSize: 12,
                              letterSpacing: 1),
                        ),
                      ),
                    );
                  }),
            ),
    );
  }
}
