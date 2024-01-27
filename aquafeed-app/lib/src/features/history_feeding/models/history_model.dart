import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryModel {
  String? id;
  String dateFeed;
  String timeFeed;

  // Constructor
  HistoryModel({this.id, required this.dateFeed, required this.timeFeed});

  // Static function to create an empty history model
  static HistoryModel empty() => HistoryModel(
      dateFeed: '',
      timeFeed: '',
  );

  // Convert model to JSON structure for storing data in Firebase
  Map<String, dynamic> toJson() {
    return{
      'dateFeed': dateFeed,
      'timeFeed': timeFeed,
    };
  }

  factory HistoryModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if(document.data() != null) {
      final data = document.data()!;
      return HistoryModel(
          id: document.id,
          dateFeed: data['dateFeed'],
          timeFeed: data['timeFeed'],
      );
    } else {
      return HistoryModel.empty();
    }
  }
}