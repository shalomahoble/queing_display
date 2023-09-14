import 'dart:convert';

import 'package:queing_display/models/caisse.dart';

class Client {
  final int id;
  final String? numClient;
  final int? statut;
  final dynamic clotureId;
  final int? caisseId;
  final int? serviceId;
  final DateTime? createdAt;
  final String? updatedAt;
  final Caisse caisse;

  Client({
    required this.id,
    this.numClient,
    this.statut,
    this.clotureId,
    this.caisseId,
    this.serviceId,
    this.createdAt,
    this.updatedAt,
    required this.caisse,
  });

  factory Client.fromRawJson(String str) => Client.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        id: json["id"],
        numClient: json["num_client"],
        statut: json["statut"],
        clotureId: json["cloture_id"],
        caisseId: json["caisse_id"],
        serviceId: json["service_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        caisse: Caisse.fromJson(json["caisse"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "num_client": numClient,
        "statut": statut,
        "cloture_id": clotureId,
        "caisse_id": caisseId,
        "service_id": serviceId,
        "created_at":
            "${createdAt!.year.toString().padLeft(4, '0')}-${createdAt!.month.toString().padLeft(2, '0')}-${createdAt!.day.toString().padLeft(2, '0')}",
        "updated_at": updatedAt,
        "caisse": caisse.toJson(),
      };
}
