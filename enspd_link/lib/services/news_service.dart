import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enspd_link/models/news_model.dart';

class NewsService {
  final _db = FirebaseFirestore.instance;
  final collectionPath = 'publications';
  
  Future<void> addPublication(NewsModel instanceNews) async {
    await _db.collection(collectionPath).add(instanceNews.toMap());
  }

  Future<List<NewsModel>> getValidatePublication() async {
    final querySnapshot =
        await _db
            .collection(collectionPath)
            .where('isValidated', isEqualTo: true)
            .orderBy('createdAt', descending: true)
            .get();

    return querySnapshot.docs
        .map((doc) => NewsModel.fromMap(doc.data(), doc.id))
        .toList();
  }

  Future<void> validatePublication(String newId) async {
    await _db.collection(collectionPath).doc(newId).update({
      'isValidated': true,
    });
  }
}
