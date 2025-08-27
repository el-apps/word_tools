// Not required for test files
// ignore_for_file: prefer_const_constructors, lines_longer_than_80_chars
import 'package:test/test.dart';
import 'package:word_tools/word_tools.dart';

void main() {
  group('compareWordSequences', () {
    test('correctly handles identical sequences', () {
      expect(
        compareWordSequences(
          'Hello world, this is a word sequence.',
          'Hello world, this is a word sequence.',
        ),
        equals(1),
      );
    });

    test('correctly handles entirely different word sequences', () {
      expect(
        compareWordSequences(
          'Hello world, this is a word sequence.',
          'hello world',
        ),
        lessThan(0.4),
      );
    });

    test('ignores extra whitespace between words', () {
      expect(
        compareWordSequences(
          'Hello world, this is a word sequence.',
          'Hello    world, \tthis\t is  a     word    sequence.',
        ),
        equals(1.0),
      );
    });

    test('ignores extra whitespace at the beginning', () {
      expect(
        compareWordSequences(
          'Hello world, this is a word sequence.',
          ' Hello world, this is a word sequence.',
        ),
        equals(1.0),
      );
    });

    test('ignores extra whitespace at the end', () {
      expect(
        compareWordSequences(
          'Hello world, this is a word sequence.',
          'Hello world, this is a word sequence. ',
        ),
        equals(1.0),
      );
    });
  });

  group('real-world tests', () {
    test('Matthew 5:3', () {
      expect(
        compareWordSequences(
          "Blessed are the poor in spirit: for their's is the kingdom of heaven.",
          'Blessed are the born spirit for their sins the kingdom of heaven',
        ),
        greaterThan(0.6),
      );
    });

    test('Matthew 5:5', () {
      // Example of very garbled input from user's microphone
      expect(
        compareWordSequences(
          'Blessed are the meek: for they shall inherit the earth.',
          'blessed are the meat so they showing her up here',
        ),
        greaterThan(0.5),
      );
    });

    test('John 1:1', () {
      expect(
        compareWordSequences(
          'In the beginning was the Word, and the Word was with God, and the Word was God.',
          'In the beginning was the word, and the word was with God, and the word was God.',
        ),
        greaterThan(0.9),
      );
    });

    test('John 1:3', () {
      expect(
        compareWordSequences(
          'All things were made by him; and without him was not any thing made that was made.',
          'All things were made by him, and without him was not anything made that was made.',
        ),
        greaterThan(0.9),
      );
    });

    test('John 1:4', () {
      expect(
        compareWordSequences(
          'In him was life; and the life was the light of men.',
          'in him was life, and the life was the light of man.',
        ),
        greaterThan(0.9),
      );
    });
  });
}
