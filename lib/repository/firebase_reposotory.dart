import 'package:firebase_auth/firebase_auth.dart';

class FirebaseRepo {
  static User getUser() {
    return FirebaseAuth.instance.currentUser!;
  }
}
