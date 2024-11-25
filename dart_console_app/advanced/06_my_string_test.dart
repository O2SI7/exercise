import 'package:test/test.dart';
import '05_my_string.dart';

void main() {
  group('MyString 클래스 테스트', () {
    // Assign 테스트
    test('assign: 문자열 할당', () {
      final myStr = MyString();
      myStr.assign("Hello");
      expect(myStr.toString(), equals("Hello"));

      myStr.assign("Dart");
      expect(myStr.toString(), equals("Dart"));

      myStr.assign(""); // 빈 문자열
      expect(myStr.toString(), equals(""));

      myStr.assign("12345");
      expect(myStr.toString(), equals("12345"));

      myStr.assign("Special!@#%^&*()");
      expect(myStr.toString(), equals("Special!@#%^&*()"));
    });

    // at 테스트
    test('at: 특정 위치의 문자 가져오기', () {
      final myStr = MyString("Hello");
      expect(myStr.at(0), equals("H"));
      expect(myStr.at(4), equals("o"));
      expect(() => myStr.at(-1), throwsRangeError);
      expect(() => myStr.at(5), throwsRangeError);
      expect(() => myStr.at(100), throwsRangeError);
    });

    // operator [] 테스트
    test('operator []: 인덱스 접근', () {
      final myStr = MyString("Hello");
      expect(myStr[0], equals("H"));
      expect(myStr[4], equals("o"));
      expect(() => myStr[-1], throwsRangeError);
      expect(() => myStr[5], throwsRangeError);
      expect(() => myStr[100], throwsRangeError);
    });

    // front 테스트
    test('front: 첫 문자 반환', () {
      final myStr = MyString("Hello");
      expect(myStr.front(), equals("H"));

      final emptyStr = MyString("");
      expect(() => emptyStr.front(), throwsStateError);

      final singleCharStr = MyString("A");
      expect(singleCharStr.front(), equals("A"));

      final specialCharStr = MyString("!Hello");
      expect(specialCharStr.front(), equals("!"));

      final numberStr = MyString("12345");
      expect(numberStr.front(), equals("1"));
    });

    // back 테스트
    test('back: 마지막 문자 반환', () {
      final myStr = MyString("Hello");
      expect(myStr.back(), equals("o"));

      final emptyStr = MyString("");
      expect(() => emptyStr.back(), throwsStateError);

      final singleCharStr = MyString("A");
      expect(singleCharStr.back(), equals("A"));

      final specialCharStr = MyString("Hello!");
      expect(specialCharStr.back(), equals("!"));

      final numberStr = MyString("12345");
      expect(numberStr.back(), equals("5"));
    });

    // empty 테스트
    test('empty: 비어있는 문자열 확인', () {
      final myStr = MyString();
      expect(myStr.empty(), isTrue);

      myStr.assign("Not empty");
      expect(myStr.empty(), isFalse);

      myStr.clear();
      expect(myStr.empty(), isTrue);

      final nonEmptyStr = MyString("Hello");
      expect(nonEmptyStr.empty(), isFalse);

      final whiteSpaceStr = MyString(" ");
      expect(whiteSpaceStr.empty(), isFalse);
    });

    // size / length 테스트
    test('size / length: 문자열 길이 확인', () {
      final myStr = MyString("Hello");
      expect(myStr.size(), equals(5));
      expect(myStr.length(), equals(5));

      final emptyStr = MyString("");
      expect(emptyStr.size(), equals(0));
      expect(emptyStr.length(), equals(0));

      final specialStr = MyString("Special!@#%^&*()");
      expect(specialStr.size(), equals(17));
      expect(specialStr.length(), equals(17));

      final singleCharStr = MyString("A");
      expect(singleCharStr.size(), equals(1));
      expect(singleCharStr.length(), equals(1));

      final numberStr = MyString("12345");
      expect(numberStr.size(), equals(5));
      expect(numberStr.length(), equals(5));
    });

    // clear 테스트
    test('clear: 문자열 초기화', () {
      final myStr = MyString("Hello");
      myStr.clear();
      expect(myStr.toString(), equals(""));

      myStr.assign("New String");
      myStr.clear();
      expect(myStr.toString(), equals(""));

      final emptyStr = MyString();
      emptyStr.clear();
      expect(emptyStr.toString(), equals(""));

      final specialStr = MyString("!@#\$%");
      specialStr.clear();
      expect(specialStr.toString(), equals(""));

      final whiteSpaceStr = MyString(" ");
      whiteSpaceStr.clear();
      expect(whiteSpaceStr.toString(), equals(""));
    });

    // starts_with 테스트
    test('starts_with: 문자열 시작 확인', () {
      final myStr = MyString("Hello World");
      expect(myStr.starts_with("Hello"), isTrue);
      expect(myStr.starts_with("World"), isFalse);
      expect(myStr.starts_with(""), isTrue);
      expect(myStr.starts_with("H"), isTrue);
      expect(myStr.starts_with("Hello World!"), isFalse);
    });

    // ends_with 테스트
    test('ends_with: 문자열 끝 확인', () {
      final myStr = MyString("Hello World");
      expect(myStr.ends_with("World"), isTrue);
      expect(myStr.ends_with("Hello"), isFalse);
      expect(myStr.ends_with(""), isTrue);
      expect(myStr.ends_with("d"), isTrue);
      expect(myStr.ends_with("Hello World!"), isFalse);
    });

    // stoi 테스트
    test('stoi: 문자열을 정수로 변환', () {
      final myStr = MyString("12345");
      expect(myStr.stoi(), equals(12345));

      final negativeStr = MyString("-123");
      expect(negativeStr.stoi(), equals(-123));

      final leadingZerosStr = MyString("00123");
      expect(leadingZerosStr.stoi(), equals(123));

      final invalidStr = MyString("Hello123");
      expect(() => invalidStr.stoi(), throwsFormatException);

      final emptyStr = MyString("");
      expect(() => emptyStr.stoi(), throwsFormatException);
    });
  });
}
