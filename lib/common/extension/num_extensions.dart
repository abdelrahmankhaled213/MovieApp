extension NumExtension on num {
String convertToPercentageToString() {
  return '${(this * 10).toStringAsFixed(0)}%';
}
}