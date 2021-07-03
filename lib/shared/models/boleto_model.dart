import 'dart:convert';

class BoletoModel {
  final String? name;
  final String? dueDate;
  final double? value;
  final String? barcode;

  BoletoModel({
    this.name,
    this.dueDate,
    this.value,
    this.barcode,
  });

  BoletoModel copyWith({
    String? name,
    String? dueDate,
    double? value,
    String? barcode,
  }) {
    if ((name == null || identical(name, this.name)) &&
        (dueDate == null || identical(dueDate, this.dueDate)) &&
        (value == null || identical(value, this.value)) &&
        (barcode == null || identical(barcode, this.barcode))) {
      return this;
    }

    return new BoletoModel(
      name: name ?? this.name,
      dueDate: dueDate ?? this.dueDate,
      value: value ?? this.value,
      barcode: barcode ?? this.barcode,
    );
  }

  @override
  String toString() {
    return 'BoletoModel{name: $name, dueDate: $dueDate, value: $value, barcode: $barcode}';
  }

  factory BoletoModel.fromJson(String json) =>
      BoletoModel.fromMap(jsonDecode(json));

  String toJson() => jsonEncode(toMap());

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BoletoModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          dueDate == other.dueDate &&
          value == other.value &&
          barcode == other.barcode);

  @override
  int get hashCode =>
      name.hashCode ^ dueDate.hashCode ^ value.hashCode ^ barcode.hashCode;

  factory BoletoModel.fromMap(Map<String, dynamic> map) {
    return new BoletoModel(
      name: map['name'] as String?,
      dueDate: map['dueDate'] as String?,
      value: map['value'] as double,
      barcode: map['barcode'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'name': this.name,
      'dueDate': this.dueDate,
      'value': this.value,
      'barcode': this.barcode,
    } as Map<String, dynamic>;
  }
}
