class Transaction {
  final String label;
  final String id;
  final DateTime date;
  final double price;

  Transaction({
    required this.id,
    required this.label,
    required this.price,
    required this.date,
  });
}
