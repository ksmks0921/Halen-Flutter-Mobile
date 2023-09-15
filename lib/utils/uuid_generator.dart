import 'dart:math';

Random _random = Random();

String randomHexString(int length) {
  StringBuffer sb = StringBuffer();
  for (var i = 0; i < length; i++) {
    sb.write(_random.nextInt(16).toRadixString(16));
  }
  return sb.toString();
}

gUID() {
  return randomHexString(32);
}
