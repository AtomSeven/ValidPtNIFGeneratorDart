import 'dart:math';

// Function to calculate the check digit
int calculateCheckDigit(List<int> digits) {
  int sum = 0;
  for (int i = 0; i < digits.length; i++) {
    sum += digits[i] * (9 - i);
  }
  int remainder = sum % 11;
  if (remainder == 0 || remainder == 1) {
    return 0;
  } else {
    return 11 - remainder;
  }
}

// Function to generate a random 7-digit number with a valid first digit
List<int> generateRandomNumber() {
  Random random = Random();
  List<int> digits = [random.nextInt(3) + 1]; // First digit is 1, 2, or 3

  for (int i = 1; i < 8; i++) {
    digits.add(random.nextInt(10));
  }
  return digits;
}

// Function to generate 10 valid NIFs
List<String> generateNIFs() {
  List<String> nifs = [];
  for (int i = 0; i < 10; i++) {
    List<int> randomNumber = generateRandomNumber();
    int checkDigit = calculateCheckDigit(randomNumber);
    randomNumber.add(checkDigit);
    nifs.add(randomNumber.join(''));
  }
  return nifs;
}

// Print the generated NIFs
void main() {
  List<String> nifs = generateNIFs();
  nifs.forEach((nif) => print(nif));
}
