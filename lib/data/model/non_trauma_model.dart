class NonTraumaModel {
  final int? koagulan;
  final int? umur;
  final int? lamaGejala;
  final int? poin;

  NonTraumaModel({
    this.koagulan,
    this.umur,
    this.lamaGejala,
    this.poin,
  });

  NonTraumaModel copyWith({
    int? koagulan,
    int? umur,
    int? lamaGejala,
    int? poin,
  }) =>
      NonTraumaModel(
        koagulan: koagulan ?? this.koagulan,
        umur: umur ?? this.umur,
        lamaGejala: lamaGejala ?? this.lamaGejala,
        poin: poin ?? this.poin,
      );

  factory NonTraumaModel.fromJson(Map<String, dynamic> json) => NonTraumaModel(
        koagulan: json["koagulan"],
        umur: json["umur"],
        lamaGejala: json["lama_gejala"],
        poin: json["poin"],
      );

  Map<String, dynamic> toJson() => {
        "koagulan": koagulan,
        "umur": umur,
        "lama_gejala": lamaGejala,
        "poin": poin,
      };
}
