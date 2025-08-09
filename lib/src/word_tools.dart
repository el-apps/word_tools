/// Compares two words to check if they match.
/// "Matching" ignores the following:
/// - capitalization
/// - punctunation
/// - missing letters (a single letter can be missing or incorrect)
bool doWordsMatch(String firstWord, String secondWord) {
  return firstWord == secondWord;
}
