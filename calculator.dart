import 'dart:io';

void main() {
  print("Welcome to the Simple Calculator!");
  print("Enter 'exit' to quit.");

  while (true) {
    stdout.write("Enter operation (+, -, *, /): ");
    String? operation = stdin.readLineSync();

    if (operation == 'exit') {
      print("Goodbye!");
      break;
    }

    if (operation != '+' && operation != '-' && operation != '*' && operation != '/') {
      print("Invalid operation. Please enter '+', '-', '*', or '/'.");
      continue;
    }

    stdout.write("Enter first number: ");
    String? num1Input = stdin.readLineSync();
    double? num1 = double.tryParse(num1Input!);
    if (num1 == null) {
      print("Invalid input. Please enter a valid number.");
      continue;
    }

    stdout.write("Enter second number: ");
    String? num2Input = stdin.readLineSync();
    double? num2 = double.tryParse(num2Input!);
    if (num2 == null) {
      print("Invalid input. Please enter a valid number.");
      continue;
    }

    double result;
    switch (operation) {
      case '+':
        result = num1 + num2;
        break;
      case '-':
        result = num1 - num2;
        break;
      case '*':
        result = num1 * num2;
        break;
      case '/':
        if (num2 == 0) {
          print("Error: Division by zero is not allowed.");
          continue;
        }
        result = num1 / num2;
        break;
      default:
        print("Invalid operation.");
        continue;
    }

    print("Result: $result");
  }
}
