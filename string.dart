import 'dart:io';

void main() {
  stdout.write("Enter a string: ");
  String? text = stdin.readLineSync();

  if (text != null) {
    print("Original String: $text");
    print("Character Count: ${getCharacterCount(text)}");
    print("Word Count: ${getWordCount(text)}");
    print("Reversed String: ${reverseString(text)}");
  } else {
    print("Invalid input.");
  }
}

int getCharacterCount(String text) {
  return text.length;
}

int getWordCount(String text) {
  List<String> words = text.split(" ");
  return words.length;
}

String reverseString(String text) {
  return text.split('').reversed.join();
}
