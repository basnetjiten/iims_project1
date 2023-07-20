import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseService {
  Future<String?> addStudent(
      {required String username,
      required String firstName,
      required String lastName,
      required String password}) async {
    try {
      // Creates map data structure to store registration data
      Map<String, String> userData = {
        'username': username,
        'firstName': firstName,
        'lastName': lastName,
        'password': password,
      };
      // Call the student's CollectionReference to add a new students
      CollectionReference students =
          FirebaseFirestore.instance.collection('students');

      /// stores data in a documents with id [username]
      await students.doc(username).set(userData);
      return 'success';
    } catch (e) {
      return 'Error adding user';
    }
  }

  Future<String?> getStudent({required String username}) async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('students');
      final snapshot = await users.doc(username).get();
      final data = snapshot.data() as Map<String, dynamic>;
      return data['full_name'];
    } catch (e) {
      return 'Error fetching user';
    }
  }

  /// Returns [username] from the doc based on the provided [userEnteredUserName]
  static Future<String?> getUsername(
      {required String userEnteredUserName}) async {
    String? username;

    try {
      CollectionReference studentsCollection =
          FirebaseFirestore.instance.collection('students');

      final snapshot = await studentsCollection.doc(userEnteredUserName).get();

      final data = snapshot.data() as Map<String, dynamic>;

      username = data['username'];

      return username;
    } catch (e) {
      return username;
    }
  }

  /// Returns [password] from the doc based on the provided [userEnteredUserName]
  static Future<String?> getPassword(
      {required String userEnteredUserName}) async {
    String? password;
    try {
      CollectionReference students =
          FirebaseFirestore.instance.collection('students');

      final studentSnapshot = await students.doc(userEnteredUserName).get();

      final docs = studentSnapshot.data() as Map<String, dynamic>;

      password = docs['password'];
      return password;
    } catch (_) {
      return password;
    }
  }
}
