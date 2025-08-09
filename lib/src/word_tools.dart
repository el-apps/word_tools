/// Compares two words to check if they match.
/// "Matching" ignores the following:
/// - capitalization
/// - punctuation
/// - missing letters (a single letter can be missing or incorrect)
bool doWordsMatch(String firstWord, String secondWord) {
  final firstWordNormalized = _removePunctuation(firstWord.toLowerCase());
  final secondWordNormalized = _removePunctuation(secondWord.toLowerCase());
  return firstWordNormalized == secondWordNormalized;
}

String _removePunctuation(String word) => word.replaceAll(RegExp(r'[^\w]'), '');

List<String> _getVariations(String word) {
  final variations = <String>[word];
  for (var i = 0; i < word.length; i++) {
    variations.add(word.substring(0, i) + word.substring(i + 1));
  }
  return variations;
}
