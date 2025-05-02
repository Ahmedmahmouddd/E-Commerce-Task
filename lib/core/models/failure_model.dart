class FailureModel {
  final String message;
  FailureModel({required this.message});

  factory FailureModel.fromJson(Map<String, dynamic> json) {
    return FailureModel(message: json['message'] ?? 'Unknown error');
  }
}
