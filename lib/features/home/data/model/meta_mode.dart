import 'package:ahmed_mahmoud_flutter_task/features/home/domain/entities/meta_entity.dart';

class MetaModel {
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? barcode;
  final String? qrCode;

  MetaModel({
    this.createdAt,
    this.updatedAt,
    this.barcode,
    this.qrCode,
  });

  factory MetaModel.fromJson(Map<String, dynamic> json) {
    return MetaModel(
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
      barcode: json['barcode'],
      qrCode: json['qrCode'],
    );
  }

  MetaEntity toEntity() => MetaEntity(
        createdAt: createdAt ?? DateTime(2025, 1, 1),
        updatedAt: updatedAt ?? DateTime(2025, 1, 1),
        barcode: barcode ?? '',
        qrCode: qrCode ?? '',
      );
}
