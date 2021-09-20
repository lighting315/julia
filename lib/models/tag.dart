class Tag {
  /// Identifiant de l'étiquette
  final String id;

  /// Label de l'étiquette
  final String label;

  /// Si l'etiquette est activée ou non
  bool isVisible;

  Tag({this.id, this.label, this.isVisible = false});

  Map<String, dynamic> toJson() => {
    'label':this.label,
  };
}
