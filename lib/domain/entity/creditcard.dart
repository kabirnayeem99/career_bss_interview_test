class CreditCard {
  int id;
  String holderName;
  String creditCardInt;
  String expiryDate;
  int balance;

  CreditCard({
    required this.id,
    required this.holderName,
    required this.creditCardInt,
    required this.expiryDate,
    required this.balance,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CreditCard &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          holderName == other.holderName &&
          creditCardInt == other.creditCardInt &&
          expiryDate == other.expiryDate &&
          balance == other.balance);

  @override
  int get hashCode =>
      id.hashCode ^
      holderName.hashCode ^
      creditCardInt.hashCode ^
      expiryDate.hashCode ^
      balance.hashCode;

  @override
  String toString() {
    return 'CreditCard{ id: $id, holderName: $holderName, creditCardInt: $creditCardInt, expiryDate: $expiryDate, balance: $balance,}';
  }

  CreditCard copyWith({
    int? id,
    String? holderName,
    String? creditCardInt,
    String? expiryDate,
    int? balance,
  }) {
    return CreditCard(
      id: id ?? this.id,
      holderName: holderName ?? this.holderName,
      creditCardInt: creditCardInt ?? this.creditCardInt,
      expiryDate: expiryDate ?? this.expiryDate,
      balance: balance ?? this.balance,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'holderName': holderName,
      'creditCardInt': creditCardInt,
      'expiryDate': expiryDate,
      'balance': balance,
    };
  }

  factory CreditCard.fromMap(Map<String, dynamic> map) {
    return CreditCard(
      id: map['id'] as int,
      holderName: map['holderName'] as String,
      creditCardInt: map['creditCardInt'] as String,
      expiryDate: map['expiryDate'] as String,
      balance: map['balance'] as int,
    );
  }
}
