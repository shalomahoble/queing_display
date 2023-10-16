// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Alerte {
  final int? id;
  final String? libelle;

  Alerte({
    this.id,
    this.libelle,
  });

  Alerte copyWith({
    int? id,
    String? libelle,
  }) =>
      Alerte(
        id: id ?? this.id,
        libelle: libelle ?? this.libelle,
      );

  factory Alerte.fromJson(Map<String, dynamic> json) => Alerte(
        id: json["id"],
        libelle: json["libelle"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "libelle": libelle,
      };

  @override
  String toString() => 'Alerte(id: $id, libelle: $libelle)';
}
