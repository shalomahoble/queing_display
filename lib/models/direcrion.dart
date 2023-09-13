// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Direction {
  final int id;
  final String libelle;
  final String adresse;
  final int? paysId;
  final String? contact;
  final String? email;
  final String? password;
  final String image;
  final int? statut;
  final String? createdBy;
  final String? createdAt;
  final String? updatedAt;

  Direction({
    required this.id,
    required this.libelle,
    required this.adresse,
    this.paysId,
    this.contact,
    this.email,
    this.password,
    required this.image,
    this.statut,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
  });

  factory Direction.fromRawJson(String str) =>
      Direction.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Direction.fromJson(Map<String, dynamic> json) => Direction(
        id: json["id"],
        libelle: json["libelle"],
        adresse: json["adresse"],
        paysId: json["pays_id"],
        contact: json["contact"],
        email: json["email"],
        password: json["password"],
        image: json["image"],
        statut: json["statut"],
        createdBy: json["created_by"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "libelle": libelle,
        "adresse": adresse,
        "pays_id": paysId,
        "contact": contact,
        "email": email,
        "password": password,
        "image": image,
        "statut": statut,
        "created_by": createdBy,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };

  @override
  String toString() {
    return 'Direction(id: $id, libelle: $libelle, adresse: $adresse, paysId: $paysId, contact: $contact, email: $email, password: $password, image: $image, statut: $statut, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
