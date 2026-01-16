import 'package:word_tools/src/string_utils.dart';

/// Grades the similarity between two word sequences on a scale of 0.00 to 1.00.
double compareWordSequences(String expectedInput, String actualInput) {
  final expectedLetters = normalizeToLetters(expectedInput);
  final actualLetters = normalizeToLetters(actualInput);

  if (expectedLetters.isEmpty) {
    return actualLetters.isEmpty ? 1 : 0;
  }

  final distance = levenshteinDistance(expectedLetters, actualLetters);
  return (expectedLetters.length - distance) / expectedLetters.length;
}
