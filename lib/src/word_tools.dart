/// Compares two words to check if they match.
/// "Matching" ignores the following:
/// - capitalization
/// - punctunation
/// - missing letters (a single letter can be missing or incorrect)
bool doWordsMatch(String firstWord, String secondWord) {
  final firstWordNormalized = _removePunctuation(firstWord.toLowerCase());
  final secondWordNormalized = _removePunctuation(secondWord.toLowerCase());
  return firstWordNormalized == secondWordNormalized;
}

String _removePunctuation(String word) => word.replaceAll(RegExp(r'[^\w]'), '');
