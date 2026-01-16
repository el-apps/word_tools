import 'package:test/test.dart';
import 'package:word_tools/src/string_utils.dart';

void main() {
  group('normalizeText', () {
    test('removes punctuation but keeps spaces', () {
      expect(normalizeText('Hello, World!'), 'hello world');
    });

    test('converts to lowercase', () {
      expect(normalizeText('HELLO'), 'hello');
    });
  });
}
