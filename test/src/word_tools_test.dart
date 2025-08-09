// Not required for test files
// ignore_for_file: prefer_const_constructors
import 'package:test/test.dart';
import 'package:word_tools/word_tools.dart';

void main() {
  group('doWordsMatch', () {
    test('correctly handles identical words', () {
      expect(doWordsMatch('hello', 'hello'), equals(true));
    });

    test('correctly handles entirely different words', () {
      expect(doWordsMatch('hello', 'hi'), equals(false));
    });

    test('ignores capitalization', () {
      expect(doWordsMatch('hello', 'hElLo'), equals(true));
    });

    test('ignores punctuation', () {
      expect(doWordsMatch('hello', '#h@e"l,l;o.!?'), equals(true));
    });
  });
}
