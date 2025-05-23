import 'package:ahmed_mahmoud_flutter_task/features/home/domain/entities/meta_entity.dart';

class MetaModel {
  static const String createdAtKey = 'createdAt';
  static const String updatedAtKey = 'updatedAt';
  static const String barcodeKey = 'barcode';
  static const String qrCodeKey = 'qrCode';

  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? barcode;
  final String? qrCode;

  MetaModel({this.createdAt, this.updatedAt, this.barcode, this.qrCode});

  factory MetaModel.fromJson(Map<String, dynamic> json) {
    return MetaModel(
      createdAt:
          json[createdAtKey] != null
              ? DateTime.parse(json[createdAtKey])
              : null,
      updatedAt:
          json[updatedAtKey] != null
              ? DateTime.parse(json[updatedAtKey])
              : null,
      barcode: json[barcodeKey],
      qrCode: json[qrCodeKey],
    );
  }

  MetaEntity toEntity() => MetaEntity(
    createdAt: createdAt ?? DateTime(2025, 1, 1),
    updatedAt: updatedAt ?? DateTime(2025, 1, 1),
    barcode: barcode ?? '',
    qrCode: qrCode ?? '',
  );
}
