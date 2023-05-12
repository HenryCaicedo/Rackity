import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn();
  static final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('usuarios');
  static final CollectionReference _prendasCollection =
      FirebaseFirestore.instance.collection('prendas');

  static Future<UserCredential?> signUp(
      String email, String password, String username) async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _usersCollection.doc(userCredential.user!.uid).set({
        'email': email,
        "username": username,
      });
      return userCredential;
    } catch (e) {
      print('Error signing up: $e');
      return null;
    }
  }

  static String getidUser() {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      print("user.uid");
      return user.uid;
    } else {
      // El usuario no está autenticado
      return '';
    }
  }

  static Future<void> createPrendaDocument(String idUsuario, String tokenImagen,
      String tipo, List<String> lTipos, DateTime fecha, int usos) async {
    try {
      await _prendasCollection.add({
        'idUsuario': idUsuario,
        'tokenImagen': tokenImagen,
        'tipo': tipo,
        'lTipos': lTipos,
        'fecha': fecha,
        'usos': usos,
      });
    } catch (e) {
      print('Error creating prenda document: $e');
    }
  }

  static Future<List<ImageProvider<Object>>> getImagesForUser() async {
    var idUsuario = getidUser();
    List<ImageProvider<Object>> imageProviders = [];

    try {
      final QuerySnapshot prendasSnapshot = await FirebaseFirestore.instance
          .collection('prendas')
          .where(
            'idUsuario',
            isEqualTo: idUsuario,
          )
          .get();

      for (final DocumentSnapshot prendaSnapshot in prendasSnapshot.docs) {
        for (final DocumentSnapshot prendaSnapshot in prendasSnapshot.docs) {}
        final Map<String, dynamic>? data =
            prendaSnapshot.data() as Map<String, dynamic>?;

        if (data != null && data.containsKey('tokenImagen')) {
          final String tokenImagen = data['tokenImagen'] as String;

          // Obtén la referencia al archivo en Firebase Storage
          final Reference imageReference =
              FirebaseStorage.instance.ref().child(tokenImagen);
          final String imageUrl = await imageReference.getDownloadURL();

          // Añade el ImageProvider a la lista
          imageProviders.add(Image.network(imageUrl).image);
        }
      }
    } catch (e) {
      print('Error retrieving images for user: $e');
    }

    return imageProviders;
  }

  static Future<List<String>> findPrendasByUsuario() async {
    var idUsuario = getidUser();
    final CollectionReference prendasCollection =
        FirebaseFirestore.instance.collection('prendas');
    final List<String> prendasIDs = [];

    try {
      final QuerySnapshot snapshot = await prendasCollection
          .where('idUsuario', isEqualTo: idUsuario)
          .get();

      for (final DocumentSnapshot doc in snapshot.docs) {
        final String prendaID = doc.id;
        prendasIDs.add(prendaID);
      }
    } catch (e) {
      print('Error finding prendas by usuario: $e');
    }

    return prendasIDs;
  }

  static Future<List<String>> filterPrendasByTipo(
      List<String> prendasIDs, List<String> filtro) async {
    final CollectionReference prendasCollection =
        FirebaseFirestore.instance.collection('prendas');
    final List<String> prendasFiltradas = [];

    try {
      for (final String prendaID in prendasIDs) {
        final DocumentSnapshot snapshot =
            await prendasCollection.doc(prendaID).get();
        final Map<String, dynamic>? data =
            snapshot.data() as Map<String, dynamic>?;

        if (data != null &&
            data.containsKey('lTipos') &&
            data.containsKey('tipo')) {
          final List<dynamic> lTipos = data['lTipos'] as List<dynamic>;
          final String tipo = data['tipo'] as String;

          if (lTipos.any((element) => filtro.contains(element)) ||
              filtro.contains(tipo)) {
            prendasFiltradas.add(prendaID);
          }
        }
      }
    } catch (e) {
      print('Error filtering prendas by tipo: $e');
    }

    return prendasFiltradas;
  }

  static Future<List<ImageProvider<Object>>> getImagesForPrendas(
      List<String> prendasIDs) async {
    List<ImageProvider<Object>> imageProviders = [];

    try {
      for (final String prendaID in prendasIDs) {
        final DocumentSnapshot snapshot = await FirebaseFirestore.instance
            .collection('prendas')
            .doc(prendaID)
            .get();
        final Map<String, dynamic>? data =
            snapshot.data() as Map<String, dynamic>?;

        if (data != null && data.containsKey('tokenImagen')) {
          final String tokenImagen = data['tokenImagen'] as String;

          // Obtén la referencia al archivo en Firebase Storage
          final Reference imageReference =
              FirebaseStorage.instance.ref().child(tokenImagen);
          final String imageUrl = await imageReference.getDownloadURL();

          // Añade el ImageProvider a la lista
          imageProviders.add(Image.network(imageUrl).image);
        }
      }
    } catch (e) {
      print('Error retrieving images for prendas: $e');
    }

    return imageProviders;
  }

  static Future<UserCredential?> signIn(
      String email, String password, context) async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.pushNamed(context, '/tabs');
      return userCredential;
    } catch (e) {
      print('Error signing in: $e');
      return null;
    }
  }

  static Future<UserCredential?> signInWithGoogle(context) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      Navigator.pushNamed(context, '/tabs');
      return userCredential;
    } catch (e) {
      print('Error signing in with Google: $e');
      return null;
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
}
