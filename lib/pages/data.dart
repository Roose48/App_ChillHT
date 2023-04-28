import 'package:flutter/material.dart';


class data {
  int? iD;
  int? departementID;
  String? type;
  String? nom;
  String? adress;
  Null? images;
  String? description;

  data(
      {this.iD,
      this.departementID,
      this.type,
      this.nom,
      this.adress,
      this.images,
      this.description});

  data.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    departementID = json['Departement_ID'];
    type = json['type'];
    nom = json['Nom'];
    adress = json['Adress'];
    images = json['Images'];
    description = json['Description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Departement_ID'] = this.departementID;
    data['type'] = this.type;
    data['Nom'] = this.nom;
    data['Adress'] = this.adress;
    data['Images'] = this.images;
    data['Description'] = this.description;
    return data;
  }
}
