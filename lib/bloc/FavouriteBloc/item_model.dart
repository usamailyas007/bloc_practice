class Item {
  final String title;
  bool isFavorite;
  bool isSelected;

  Item({
    required this.title,
    this.isFavorite = false,
    this.isSelected = false,
  });

  // Method to copy the instance with updated fields
  Item copyWith({String? title, bool? isFavorite, bool? isSelected}) {
    return Item(
      title: title ?? this.title,
      isFavorite: isFavorite ?? this.isFavorite,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
