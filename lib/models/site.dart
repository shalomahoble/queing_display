// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Site {
  final int id;
  final String libelle;
  final String? adresse;
  final String? ville;
  final dynamic commune;
  final String? contact;
  final String? email;
  final int? statut;
  final String image;
  final int? directionId;
  final String? timezone;
  final String? createdBy;
  final String? createdAt;
  final String? updatedAt;

  Site({
    required this.id,
    required this.libelle,
    this.adresse,
    this.ville,
    this.commune,
    this.contact,
    this.email,
    this.statut,
    required this.image,
    this.directionId,
    this.timezone,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
  });

  factory Site.fromRawJson(String str) => Site.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Site.fromJson(Map<String, dynamic> json) => Site(
        id: json["id"],
        libelle: json["libelle"],
        adresse: json["adresse"],
        ville: json["ville"],
        commune: json["commune"],
        contact: json["contact"],
        email: json["email"],
        statut: json["statut"],
        image: json["image"],
        directionId: json["direction_id"],
        timezone: json["timezone"],
        createdBy: json["created_by"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "libelle": libelle,
        "adresse": adresse,
        "ville": ville,
        "commune": commune,
        "contact": contact,
        "email": email,
        "statut": statut,
        "image": image,
        "direction_id": directionId,
        "timezone": timezone,
        "created_by": createdBy,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };

  @override
  String toString() {
    return 'Site(id: $id, libelle: $libelle, adresse: $adresse, ville: $ville, commune: $commune, contact: $contact, email: $email, statut: $statut, image: $image, directionId: $directionId, timezone: $timezone, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
