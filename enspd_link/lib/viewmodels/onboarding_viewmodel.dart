import 'package:enspd_link/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingViewmodel extends ChangeNotifier {
  static const String onboardingCompletedKey = "onboardingCompleted";
  final List<OnboardingPageModel> pages = [
    OnboardingPageModel(
      title: "Bienvenue sur ENSPD Link",
      body: "Connectez vous avec votre communauté académique",
      imageAsset: "assets/images/onboarding1.png",
    ),
    OnboardingPageModel(
      title: "Partage et Collaboration",
      body: "Publiez ,Commentez et collaborez avec vos camarades ",
      imageAsset: "assets/images/onboarding2.png",
    ),
    OnboardingPageModel(
      title: "Soyez informé",
      body: "Recevez les notifications sur les évènements",
      imageAsset: "assets/images/onboarding3.png",
    ),
  ];
  //Methode appelée à la fin de l'onbroarding
  Future<void> completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(onboardingCompletedKey, true);
  }

  //Vérifie si l'onboarding a déjà été fait
  Future<bool> isOnboardingCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(onboardingCompletedKey) ?? false;
  }
}
