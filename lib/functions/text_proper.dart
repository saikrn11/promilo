extension StringExtension on String {
  String proper() {
    List strings = split(' ');
    for (int i = 0; i < strings.length; i++) {
      strings[i] = strings[i].toString().substring(0, 1).toUpperCase() +
          strings[i].toString().substring(1);
    }

    return strings.join(' ');
  }

  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
