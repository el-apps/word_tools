/// Compares two word sequences to check if they match.
/// "Matching" ignores the following:
/// - capitalization
/// - punctuation
/// - missing words (up to 10% of the words can be missing or incorrect)
bool doWordSequencesMatch(String firstWordSequence, String secondWordSequence) {
  final firstWordSequenceNormalized = _removePunctuation(
    firstWordSequence.toLowerCase(),
  ).trim();
  final secondWordSequenceNormalized = _removePunctuation(
    secondWordSequence.toLowerCase(),
  ).trim();
  final firstWordList = firstWordSequenceNormalized.split(RegExp(r'\s+'));
  final secondWordList = secondWordSequenceNormalized.split(RegExp(r'\s+'));
  return _compareWordLists(firstWordList, secondWordList);
}

bool _compareWordLists(
  List<String> firstWordList,
  List<String> secondWordList,
) {
  // TODO(pertempto): handle missing words
  if (firstWordList.length != secondWordList.length) {
    return false;
  }
  return firstWordList.asMap().entries.every(
    (e) => e.value == secondWordList[e.key],
  );
}

/// Compares two words to check if they match.
/// "Matching" ignores the following:
/// - capitalization
/// - punctuation
/// - missing letters (a single letter can be missing or incorrect)
bool doWordsMatch(String firstWord, String secondWord) {
  final firstWordNormalized = _removePunctuation(firstWord.toLowerCase());
  final secondWordNormalized = _removePunctuation(secondWord.toLowerCase());
  final firstWordVariations = _getVariations(firstWordNormalized);
  final secondWordVariations = _getVariations(secondWordNormalized);
  return firstWordVariations.intersection(secondWordVariations).isNotEmpty;
}

String _removePunctuation(String word) =>
    word.replaceAll(RegExp(r'[^\w\s]'), '');

Set<String> _getVariations(String word) {
  final variations = <String>{word};
  // Add all variations of the word with one letter removed
  for (var i = 0; i < word.length; i++) {
    variations.add(word.substring(0, i) + word.substring(i + 1));
  }
  return variations;
}
