import 'package:tut2_14052025/src/data/database_repository.dart';
import 'package:tut2_14052025/src/features/home/domain/transactions.dart';

class MockDatabase implements DatabaseRepository {
  final List<Transaction> transactions = [
    Transaction(amount: 15000, description: "Einzahlung Bank"),
    Transaction(amount: -39.99, description: "Telekom"),
    Transaction(amount: -8.39, description: "Starbucks"),
  ];

  @override
  void addTransaction(Transaction transaction) {
    transactions.add(transaction);
  }

  @override
  void deleteTransaction(Transaction transaction) {
    transactions.remove(transaction);
  }

  @override
  List<Transaction> getAllTransactions() {
    return transactions;
  }

  @override
  double getCurrentBalance() {
    return getTotalAmount();
  }

  @override
  double getTotalAmount() {
    double sum = 0;
    for (Transaction transaction in transactions) {
      sum += transaction.amount;
    }
    return sum;
  }
}
