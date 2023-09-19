import 'dart:io';

class BankingApp {
  String? username;
  int balance = 1000;

  void menu() {
    print("Select an option:");
    print("1. Add User");
    print("2. Transaction");
    print("3. Deposit");
    print("4. Exit");
    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        addUser();
        menu();
        break;
      case 2:
        if (login()) {
          transaction();
        } else {
          print("Username not found or password is incorrect.");
        }
        menu();
        break;
      case 3:
        if (login()) {
          deposit();
        } else {
          print("Username not found or password is incorrect.");
        }
        menu();
        break;
      case 4:
        bool exitConfirmed = false;
        do {
          print("Are you sure you want to exit? (Y/N)");
          String response = stdin.readLineSync()!.toLowerCase();
          if (response == 'y') {
            exitConfirmed = true;
          } else if (response == 'n') {
            exitConfirmed = false;
          } else {
            print("Invalid input. Please enter 'Y' or 'N'.");
          }
        } while (!exitConfirmed);
        print("Exited!");
        break;
      default:
        print("Invalid choice. Please try again.");
        menu();
    }
  }

  void addUser() {
    print("Enter your username:");
    username = stdin.readLineSync();
    print("Enter your PIN:");
    String pin = stdin.readLineSync()!;
    print("User $username added with a balance of $balance");
  }

  bool login() {
    print("Enter your username:");
    String enteredUsername = stdin.readLineSync()!;
    print("Enter your PIN:");
    String enteredPIN = stdin.readLineSync()!;
    if (username == enteredUsername && enteredPIN == '') {
      return true;
    } else {
      return false;
    }
  }

  void transaction() {
    print("Enter the amount to transfer:");
    int amount = int.parse(stdin.readLineSync()!);
    if (amount > balance) {
      print("You don't have enough balance in your account.");
    } else {
      balance -= amount;
      print("Transaction successful. Your current balance is $balance");
    }
  }

  void deposit() {
    print("Enter the amount to deposit:");
    int depositAmount = int.parse(stdin.readLineSync()!);
    balance += depositAmount;
    print("Deposit successful. Your current balance is $balance");
  }
}

void main(List<String> args) {
  BankingApp bankingApp = BankingApp();
  bankingApp.menu();
}
