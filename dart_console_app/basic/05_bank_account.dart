import '04_unit_convertor.dart';

Future<void> main(List<String> arguments) async {
  while (true) {
    printWelcomeMessage();

    final command = getUserInput(['1', '2', '3', '4', '5', '6']);
    switch (command) {
      case '1':
        createAccount();
        break;
      case '2':
        deposit();
        break;
      case '3':
        withdraw();
        break;
      case '4':
        checkBalance();
        break;
      case '5':
        transactionHistory();
        break;
      case '6':
        break;
      default:
    }
  }
}

void transactionHistory() {}

void checkBalance() {}

void withdraw() {}

void deposit() {}

void createAccount() {}

void printWelcomeMessage() {}
