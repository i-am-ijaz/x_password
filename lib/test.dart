import 'dart:io';

import 'package:encrypt/encrypt.dart';
import 'package:flutter/services.dart';
import 'package:pointycastle/asymmetric/api.dart';

Future<void> testEncryption() async {
  final publicKey =
      await parseKeyFromFile<RSAPublicKey>('assets/private/public.pem');
  final privKey =
      await parseKeyFromFile<RSAPrivateKey>('assets/private/private.pem');

  const plainText = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit';
  final encrypter = Encrypter(RSA(publicKey: publicKey, privateKey: privKey));

  final encrypted = encrypter.encrypt(plainText);
  final decrypted = encrypter.decrypt(encrypted);

  print("ENCRYPTED ##########");
  print(decrypted); 
  // Lorem ipsum dolor sit amet, consectetur adipiscing elit
  print(encrypted); // kO9EbgbrSwiq0EYz0aBdljHSC/rci2854Qa+nugbhKjidlezNplsEqOxR+pr1RtICZGAtv0YGevJBaRaHS17eHuj7GXo1CM3PR6pjGxrorcwR5Q7/bVEePESsimMbhHWF+AkDIX4v0CwKx9lgaTBgC8/yJKiLmQkyDCj64J3JSE=
}

Future<T> parseKeyFromFile<T extends RSAAsymmetricKey>(String filename) async {
  final key = await rootBundle.loadString(filename);
  final parser = RSAKeyParser();
  return parser.parse(key) as T;
}
