import 'package:x_password/test.dart';
import 'package:encrypt/encrypt.dart';
// ignore: depend_on_referenced_packages
import 'package:pointycastle/asymmetric/api.dart';

class EncryptionService {
  static late Encrypter _encrypter;

  static Future<void> init() async {
    final publicKey =
        await parseKeyFromFile<RSAPublicKey>('.private/public.pem');
    final privateKey =
        await parseKeyFromFile<RSAPrivateKey>('.private/private.pem');
    _encrypter = Encrypter(
      RSA(
        publicKey: publicKey,
        privateKey: privateKey,
      ),
    );
  }

  static String encrypt(String plainText) {
    final encrypted = _encrypter.encrypt(plainText);
    return encrypted.base64;
  }

  static String decrypt(String encryptedText) {
    final decrypted = _encrypter.decrypt(Encrypted.fromBase64(encryptedText));
    return decrypted;
  }
}
