import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  //Obtenir l'utilisateur actuellement connecté
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }
  //Inscription avec Email et Mot de passe
  Future<UserCredential>signUpWithEmail(String email,String password)async{
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return credential;
    } on FirebaseAuthException catch (e) {
      print("Erreur lors de l'inscription : ${e.message}");
      rethrow;
    }
  }

  //Connexion avec Email et Mot de passe
  Future<UserCredential> signInWithEmail(String email, String password) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return credential;
    } on FirebaseAuthException catch (e) {
      print("Erreur lors de la connexion : ${e.message}");
      rethrow;
    }
  }
  //Connexion avec Google
  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        throw Exception("Connexion annulée par l'utilisateur");
      }
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      return await _firebaseAuth.signInWithCredential(credential);
    } catch (e) {
      print("Erreur lors de la connexion avec Google : $e");
      rethrow;
    }
  }
  //Déconnexion
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
      await _googleSignIn.signOut();
    } catch (e) {
      print("Erreur lors de la déconnexion : $e");
      rethrow;
    }
  }
  //Vérifier si l'utilisateur est connecté
  Future<bool> isUserLoggedIn() async {
    final user = _firebaseAuth.currentUser;
    return user != null;
  }
  //Réinitialiser le mot de passe
  Future<void> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      print("Erreur lors de la réinitialisation du mot de passe : ${e.message}");
      rethrow;
    }
  }
  //Obtenir les informations de l'utilisateur
  Future<User?> getUserInfo() async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      return user;
    } else {
      return null;
    }
  }

}
