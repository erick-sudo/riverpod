import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpodtutorial/models/app_user_model.dart';

part 'firebase_auth_repository.g.dart';

class FirebaseAuthenticationRepository {
  FirebaseAuthenticationRepository(this._firebaseAuth);

  final FirebaseAuth _firebaseAuth;

  AppUser? get currentUser => _convertUser(_firebaseAuth.currentUser);

// converts the nullable FirebaseUser to our AppUser
  AppUser? _convertUser(User? user) =>
      user == null ? null : AppUser.fromUser(user);

  Stream<AppUser?> authStateChanges() {
    return _firebaseAuth.authStateChanges().map(_convertUser);
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }
}

@Riverpod(keepAlive: true)
Stream<AppUser?> authStateChange(AuthStateChangeRef ref) {
  final auth = ref.watch(authRepositoryProvider);
  return auth.authStateChanges();
}

@Riverpod(keepAlive: true)
FirebaseAuthenticationRepository authRepository(AuthRepositoryRef ref) {
  final auth = ref.watch(firebaseAuthProvider);
  return FirebaseAuthenticationRepository(auth);
}

@Riverpod(keepAlive: true)
FirebaseAuth firebaseAuth(FirebaseAuthRef ref) {
  return FirebaseAuth.instance;
}
