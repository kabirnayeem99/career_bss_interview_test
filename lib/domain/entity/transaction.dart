class Transaction {
  int id;
  String organisation;
  int amount;
  String time;
  String date;

  Transaction({
    required this.id,
    required this.organisation,
    required this.amount,
    required this.time,
    required this.date,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Transaction &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          organisation == other.organisation &&
          amount == other.amount &&
          time == other.time &&
          date == other.date);

  @override
  int get hashCode =>
      id.hashCode ^
      organisation.hashCode ^
      amount.hashCode ^
      time.hashCode ^
      date.hashCode;

  @override
  String toString() {
    return 'Transaction{ id: $id, organisation: $organisation, amount: $amount, time: $time, date: $date,}';
  }

  Transaction copyWith({
    int? id,
    String? organisation,
    int? amount,
    String? time,
    String? date,
  }) {
    return Transaction(
      id: id ?? this.id,
      organisation: organisation ?? this.organisation,
      amount: amount ?? this.amount,
      time: time ?? this.time,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'organisation': organisation,
      'amount': amount,
      'time': time,
      'date': date,
    };
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map['id'] as int,
      organisation: map['organisation'] as String,
      amount: map['amount'] as int,
      time: map['time'] as String,
      date: map['date'] as String,
    );
  }
}
