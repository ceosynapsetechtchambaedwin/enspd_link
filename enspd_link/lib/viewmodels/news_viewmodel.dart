import 'package:enspd_link/models/news_model.dart';
import 'package:enspd_link/services/news_service.dart';
import 'package:flutter/material.dart';

class NewsViewmodel with ChangeNotifier {
  final _service = NewsService();
  List<NewsModel> publications = [];
  bool isLoading = false;
  Future<void> fetchValidatedPublication() async {
    isLoading = true;
    notifyListeners();
    publications = await _service.getValidatePublication();
    isLoading = false;
    notifyListeners();
  }

  Future<void> addPublication(NewsModel publication) async {
    await _service.addPublication(publication);
  }

  Future<void> validatePublication(String publicationId) async {
    await _service.validatePublication(publicationId);
    await fetchValidatedPublication();
  }
}
