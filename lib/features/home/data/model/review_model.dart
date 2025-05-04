import 'package:ahmed_mahmoud_flutter_task/features/home/domain/entities/review_entity.dart';

class ReviewModel {
  static const String keyRating = 'rating';
  static const String keyComment = 'comment';
  static const String keyDate = 'date';
  static const String keyReviewerName = 'reviewerName';
  static const String keyReviewerEmail = 'reviewerEmail';

  final int? rating;
  final String? comment;
  final DateTime? date;
  final String? reviewerName;
  final String? reviewerEmail;

  ReviewModel({
    this.rating,
    this.comment,
    this.date,
    this.reviewerName,
    this.reviewerEmail,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      rating: json[keyRating],
      comment: json[keyComment],
      date: json[keyDate] != null ? DateTime.parse(json[keyDate]) : null,
      reviewerName: json[keyReviewerName],
      reviewerEmail: json[keyReviewerEmail],
    );
  }

  ReviewEntity toEntity() => ReviewEntity(
        rating: rating ?? 0,
        comment: comment ?? '',
        date: date ?? DateTime(2025, 1, 1),
        reviewerName: reviewerName ?? 'Unknown',
        reviewerEmail: reviewerEmail ?? 'unknown@example.com',
      );
}
