# Agent Guidelines for word_tools

## Versioning

- Version format: `MAJOR.MINOR.PATCH+BUILD`
- Always include the build number (e.g., `0.3.0+4`, not `0.3.0`)
- Increment build number for each release

## Code Style

- Run `dart analyze` before committing - must have no issues
- Run `dart test` before committing - all tests must pass
- Use `package:` imports for files in `lib/` directory
- Keep lines under 80 characters
- End files with a single newline

## Project Structure

```
lib/
  word_tools.dart           # Public exports
  src/
    string_utils.dart       # Shared utilities (levenshtein, normalize, splitWords)
    sequence_compare.dart   # compareWordSequences
    word_diff.dart          # computeWordDiff, DiffWord, DiffStatus
test/
  src/
    sequence_compare_test.dart
    word_diff_test.dart
```

## Refactoring Guidelines

- Avoid duplicate code - extract shared utilities to `string_utils.dart`
- Keep public API in `string_utils.dart` generic and reusable
- Preserve function signatures when refactoring (e.g., keep cost parameters)
