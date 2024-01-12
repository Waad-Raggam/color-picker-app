class ColorModel {
  final String name;
  final String hexCode;
  final int value;

  ColorModel({required this.name, required this.hexCode, required this.value});

  factory ColorModel.fromJson(Map<String, dynamic> json) {
    return ColorModel(
      name: json['name'] ?? '',
      hexCode: json['hex'] ?? '',
      value: int.parse(json['value'].substring(1), radix: 16),
    );
  }
}
