// Grade.dart

class Grade {

  static final int MaxGrade = 15;

  static final int MinGrade = 1;

  static String getGrade4Japan(int grade) {
    if (grade < 11) {
      return "${11 - grade}級";
    }

    switch (grade) {
      case 11: return "初段";
      case 12: return "二段";
      case 13: return "三段";
      case 14: return "四段";
      case 15: return "五段";
      default: return "不明";
    }
  }
}