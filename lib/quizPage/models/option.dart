class Option {
  const Option({
    required this.text,
    required this.code,
    required this.isCorrect,
  });

  Option.k(this.code, this.text, this.isCorrect);

  final String code;
  final bool isCorrect;
  final String text;
}
