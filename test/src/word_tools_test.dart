// Not required for test files
// ignore_for_file: prefer_const_constructors
import 'package:test/test.dart';
import 'package:word_tools/word_tools.dart';

void main() {
  group('doWordsMatch', () {
    test('correctly handles identical words', () {
      expect(doWordsMatch('hello', 'hello'), equals(true));
    });
  });
}
