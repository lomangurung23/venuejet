import 'package:firebase_auth/firebase_auth.dart'; // Importing the firebase_auth package for authentication.
import 'fire_store_service.dart'; // Importing the Firestore service for database interactions.


class FirebaseAuthService {
  // Creating an instance of FirebaseAuth for authentication.
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // Creating an instance of FirestoreService for interacting with Firestore.
  final FirestoreService _firestoreService = FirestoreService();


  // Method to sign up a user with email and password.
  Future<User?> signupWithEmailAndPassword(String email, String password, String userName) async {
    try {
      // Using FirebaseAuth instance to create a new user with email and password.
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Extracting the User object from the UserCredential.
      User? user = userCredential.user;

      // If the user is successfully created, write their data to Firestore.
      if (user != null) {
        await _firestoreService.writeUserDataToFirestore(user.uid, email, userName);
      }
      // returning the user
      return user;
    } catch (e) {
      print("Error during signup: $e");
      return null;
    }
  }

  // Method to sign in a user with email and password.
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      // Using FirebaseAuth instance to sign in a user with email and password.
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Extracting the User object from the UserCredential and returning it.
      User? user = userCredential.user;
      return user;
    } catch (e) {
      print("Error during login: $e");
      return null;
    }
  }
  // Method to sign out the current user.
  Future<void> signOut() async {
    await _auth.signOut();
  }
}

