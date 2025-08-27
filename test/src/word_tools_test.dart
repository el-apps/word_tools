// Not required for test files
// ignore_for_file: prefer_const_constructors
import 'package:test/test.dart';
import 'package:word_tools/word_tools.dart';

void main() {
  group('doWordSequencesMatch', () {
    test('correctly handles identical sequences', () {
      expect(
        doWordSequencesMatch(
          'Hello world, this is a word sequence.',
          'Hello world, this is a word sequence.',
        ),
        equals(true),
      );
    });

    test('correctly handles entirely different word sequences', () {
      expect(
        doWordSequencesMatch(
          'Hello world, this is a word sequence.',
          'hello world',
        ),
        equals(false),
      );
    });

    test('ignores extra whitespace between words', () {
      expect(
        doWordSequencesMatch(
          'Hello world, this is a word sequence.',
          'Hello    world, \tthis\t is  a     word    sequence.',
        ),
        equals(true),
      );
    });

    test('ignores extra whitespace at the beginning', () {
      expect(
        doWordSequencesMatch(
          'Hello world, this is a word sequence.',
          ' Hello world, this is a word sequence.',
        ),
        equals(true),
      );
    });

    test('ignores extra whitespace at the end', () {
      expect(
        doWordSequencesMatch(
          'Hello world, this is a word sequence.',
          'Hello world, this is a word sequence. ',
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

  group('real-world tests', () {
    test('Matthew 5:3', () {
      expect(
        doWordSequencesMatch(
          "Blessed are the poor in spirit: for their's is the kingdom of heaven.",
          'Blessed are the born spirit for their sins the kingdom of heaven',
        ),
        equals(true),
      );
    });

    test('Matthew 5:3', () {
      // NOTE: this one is a pretty extreme example of the user's microphone
      //       garbling the input. We don't need it to match, but it should
      //       at least get a decent score
      expect(
        doWordSequencesMatch(
          'Blessed are the meek: for they shall inherit the earth.',
          'blessed are the meat so they showing her up here',
        ),
        equals(true),
      );
    });

    test('John 1:1', () {
      expect(
        doWordSequencesMatch(
          'In the beginning was the Word, and the Word was with God, and the Word was God.',
          'In the beginning was the word, and the word was with God, and the word was God.',
        ),
        equals(true),
      );
    });

    test('John 1:3', () {
      expect(
        doWordSequencesMatch(
          'All things were made by him; and without him was not any thing made that was made.',
          'All things were made by him, and without him was not anything made that was made.',
        ),
        equals(true),
      );
    });

    test('John 1:4', () {
      expect(
        doWordSequencesMatch(
          'In him was life; and the life was the light of men.',
          'in him was life, and the life was the light of man.',
        ),
        equals(true),
      );
    });
  });
}
