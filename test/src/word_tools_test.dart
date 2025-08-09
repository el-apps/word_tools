// Not required for test files
// ignore_for_file: prefer_const_constructors
import 'package:test/test.dart';
import 'package:word_tools/word_tools.dart';

void main() {
  group('doParagraphsMatch', () {
    test('correctly handles identical sequences', () {
      expect(
        doWordSequencesMatch(
          'Hello world, this is a word sequence.',
          'Hello world, this is a word sequence.',
        ),
        equals(true),
      );
    });
  });

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

    test('allows one missing letter', () {
      expect(doWordsMatch('hello', 'helo'), equals(true));
    });

    test('does not allow two missing letters', () {
      expect(doWordsMatch('hello', 'hlo'), equals(false));
    });

    test('allows one changed letter', () {
      expect(doWordsMatch('hello', 'hillo'), equals(true));
    });

    test('does not allow two changed letters', () {
      expect(doWordsMatch('hello', 'hiloo'), equals(false));
    });
  });
}
