import 'package:cloud_firestore/cloud_firestore.dart';

class NewsModel {
  final String? id;
  final String title;
  final String description;
  final String type;
  final String contentUrl;
  final String authorId;
  final Timestamp createdAt;
  final bool isValidated;

  NewsModel({
     this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.contentUrl,
    required this.authorId,
    required this.createdAt,
    required this.isValidated,
  });

  factory NewsModel.fromMap(Map<String, dynamic> map, String docId) {
    return NewsModel(
      id: docId,
      title: map["title"],
      description: map["description"],
      type: map["type"],
      contentUrl: map["contentUrl"],
      authorId: map["authorId"],
      createdAt: map["createdAt"],
      isValidated: map["isValidated"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'type': type,
      'contentUrl': contentUrl,
      'authorId': authorId,
      'createdAt': createdAt,
      'isValidated': isValidated,
    };
  }
}
