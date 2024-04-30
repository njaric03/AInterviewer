class Question {
  final String category;
  final String question;

  Question({required this.category, required this.question});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      category: json['category'],
      question: json['question'],
    );
  }

  @override
  String toString() {
    return 'Question(category: $category, question: $question)';
  }
}

class QuestionList {
  final List<Question> questions;

  QuestionList({required this.questions});

  factory QuestionList.fromJson(List<dynamic> json) {
    List<Question> questions = json.map((i) => Question.fromJson(i)).toList();
    return QuestionList(questions: questions);
  }

  @override
  String toString() {
    return 'QuestionList(questions: $questions)';
  }
}
