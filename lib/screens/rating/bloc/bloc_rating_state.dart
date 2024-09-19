class RatingState {
  final double ideaRating;
  final double designRating;
  final double toolsRating;
  final double practicesRating;
  final double presentationRating;
  final double investmentRating;

  RatingState({
    required this.ideaRating,
    required this.designRating,
    required this.toolsRating,
    required this.practicesRating,
    required this.presentationRating,
    required this.investmentRating,
  });

  RatingState copyWith({
    double? ideaRating,
    double? designRating,
    double? toolsRating,
    double? practicesRating,
    double? presentationRating,
    double? investmentRating,
  }) {
    return RatingState(
      ideaRating: ideaRating ?? this.ideaRating,
      designRating: designRating ?? this.designRating,
      toolsRating: toolsRating ?? this.toolsRating,
      practicesRating: practicesRating ?? this.practicesRating,
      presentationRating: presentationRating ?? this.presentationRating,
      investmentRating: investmentRating ?? this.investmentRating,
    );
  }
}