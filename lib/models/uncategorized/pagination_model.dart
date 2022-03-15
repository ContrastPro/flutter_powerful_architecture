class PaginationModel {
  const PaginationModel({
    this.number = 0,
    this.size = 0,
    this.totalElements = 0,
    this.totalPages = 0,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) {
    return PaginationModel(
      number: json['number'],
      size: json['size'],
      totalElements: json['totalElements'],
      totalPages: json['totalPages'],
    );
  }

  final int number;
  final int size;
  final int totalElements;
  final int totalPages;

  PaginationModel copyWith({
    int? number,
    int? size,
    int? totalElements,
    int? totalPages,
  }) {
    return PaginationModel(
      number: number ?? this.number,
      size: size ?? this.size,
      totalElements: totalElements ?? this.totalElements,
      totalPages: totalPages ?? this.totalPages,
    );
  }
}
