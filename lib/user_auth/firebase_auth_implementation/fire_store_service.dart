import 'package:cloud_firestore/cloud_firestore.dart'; //Importing the cloud_firestore package to interact with Firestore database.

class FirestoreService {
  // Creating an instance of FirebaseFirestore for database interaction.
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// Method to write user data to Firestore.
  Future<void> writeUserDataToFirestore(String userId, String email, String userName) async {
    try {
      // Using Firestore instance to set user data in the 'users' collection.
      await _firestore.collection('users').doc(userId).set({
        'userName': userName,
        'email': email,

      });
    } catch (e) {
      // Handling any errors that may occur during the write operation.
      print('Error writing user data to Firestore: $e');
    }
  }

  // Method to retrieve user data from Firestore.
  Future<Map<String, dynamic>?> getUserData(String userId) async {
    try {
      // Using Firestore instance to get a document snapshot from the 'users' collection.
      DocumentSnapshot<Map<String, dynamic>> snapshot = await _firestore.collection('users').doc(userId).get();
      // Checking if the document exists in the database.
      if (snapshot.exists) {
        // Returning the user data if the document exists.
        return snapshot.data();
      } else {
        print('User not found in Firestore.');
        return null;
      }
    } catch (e) {
      // Handling any errors that may occur during the retrieval operation.
      print('Error retrieving user data from Firestore: $e');
      return null;
    }
  }
}
