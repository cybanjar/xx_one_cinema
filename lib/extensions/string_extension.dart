part of 'extensions.dart';

extension StringExtention on String {
  bool isDigit(int index) =>
      this.codeUnitAt(index) >= 48 && this.codeUnitAt(index) <= 57;
}
