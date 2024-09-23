abstract class RatingEvent {}

class UpdateRating extends RatingEvent {
  final String category;
  final double value;

  UpdateRating({required this.category, required this.value});
}