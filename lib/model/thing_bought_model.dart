import 'package:cloud_firestore/cloud_firestore.dart';

class ThingBoughtModel {
  String? id;
  String? cost;
  String? title;

  ThingBoughtModel(this.id, this.cost, this.title);

  factory ThingBoughtModel.fromDocument(DocumentSnapshot doc) {
    return ThingBoughtModel(
      doc.id,
      doc.get('cost'),
      doc.get('thingName'),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cost': cost,
      'thingName': title,
    };
  }
}
