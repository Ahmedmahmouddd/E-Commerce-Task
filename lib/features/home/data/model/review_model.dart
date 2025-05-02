import 'package:ahmed_mahmoud_flutter_task/features/home/domain/entities/review_entity.dart';

class ReviewModel {
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
      rating: json['rating'],
      comment: json['comment'],
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
      reviewerName: json['reviewerName'],
      reviewerEmail: json['reviewerEmail'],
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
