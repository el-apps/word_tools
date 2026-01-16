import 'dart:math';

/// Calculates Levenshtein (edit) distance between two strings.
///
/// Returns the minimum number of single-character edits (insertions,
/// deletions, or substitutions) required to transform [s1] into [s2].
///
/// Supports configurable costs for each operation type via [insertionCost],
/// [deletionCost], and [substitutionCost].
double levenshteinDistance(
  String s1,
  String s2, {
  double insertionCost = 1,
  double deletionCost = 1,
  double substitutionCost = 1,
}) {
  if (s1 == s2) return 0;
  if (s1.isEmpty) return s2.length * insertionCost;
  if (s2.isEmpty) return s1.length * deletionCost;

  final v0 = List<double>.generate(s2.length + 1, (i) => i * insertionCost);
  final v1 = List<double>.filled(s2.length + 1, 0);

  for (var i = 0; i < s1.length; i++) {
    v1[0] = (i + 1) * deletionCost;

    for (var j = 0; j < s2.length; j++) {
      final cost = (s1[i] == s2[j]) ? 0 : substitutionCost;
      v1[j + 1] = min(
        v1[j] + insertionCost,
        min(
          v0[j + 1] + deletionCost,
          v0[j] + cost,
        ),
      );
    }
    // Copy v1 to v0 for next iteration
    for (var j = 0; j <= s2.length; j++) {
      v0[j] = v1[j];
    }
  }
  return v1[s2.length];
}

/// Normalizes text by removing punctuation and converting to lowercase.
///
/// Useful for fuzzy text comparison where punctuation and case should be
/// ignored.
String normalizeText(String text) {
  return text.toLowerCase().replaceAll(RegExp(r'[^\w\s]'), '');
}

/// Removes all non-word characters (punctuation) and converts to lowercase.
///
/// Unlike [normalizeText], this also removes whitespace, returning only
/// alphanumeric characters.
String normalizeToLetters(String text) {
  return text.toLowerCase().replaceAll(RegExp(r'[^\w]'), '');
}
