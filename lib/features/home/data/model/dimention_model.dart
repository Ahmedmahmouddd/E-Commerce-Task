import 'package:ahmed_mahmoud_flutter_task/features/home/domain/entities/dimention_entity.dart';

class DimensionsModel {
  final double? width;
  final double? height;
  final double? depth;

  DimensionsModel({this.width, this.height, this.depth});

  factory DimensionsModel.fromJson(Map<String, dynamic> json) {
    return DimensionsModel(
      width: (json['width'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      depth: (json['depth'] as num?)?.toDouble(),
    );
  }

  DimensionsEntity toEntity() => DimensionsEntity(
    width: width ?? 0.0,
    height: height ?? 0.0,
    depth: depth ?? 0.0,
  );
}
