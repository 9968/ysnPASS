import 'dart:convert';
import 'dart:typed_data';

import 'package:encrypt/encrypt.dart';
import 'package:ysnpass/store/models/database.dart';

class Encryption {
  static Uint8List encryptDB(Database db, String masterPassword) {
    final dbJson = jsonEncode(db);
    final salt = SecureRandom(32).bytes;
    final key = Key.fromUtf8(masterPassword).stretch(32, salt: salt);
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));

    return Uint8List.fromList(
      [...salt, ...iv.bytes, ...encrypter.encrypt(dbJson, iv: iv).bytes],
    );
  }

  static Database decryptDB(Uint8List databaseBytes, String masterPassword) {
    final salt = databaseBytes.sublist(0, 32);
    final iv = IV(databaseBytes.sublist(32, 48));
    final key = Key.fromUtf8(masterPassword).stretch(32, salt: salt);
    final encrypter = Encrypter(AES(key));

    return Database.fromJson(
      jsonDecode(
        encrypter.decrypt(
          Encrypted(
            databaseBytes.sublist(48),
          ),
          iv: iv,
        ),
      ),
    );
  }
}
