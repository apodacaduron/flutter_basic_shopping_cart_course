class Food {
  final int id;
  final String title;
  final String restaurantChain;
  final String servingSize;
  final String readableServingSize;
  final String image;
  final String imageType;

  Food({
    this.id,
    this.title,
    this.restaurantChain,
    this.servingSize,
    this.readableServingSize,
    this.image,
    this.imageType,
  });

  Food.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        title = json["title"] as String,
        restaurantChain = json["restaurantChain"] as String,
        servingSize = json["servingSize"] as String,
        readableServingSize = json["readableServingSize"] as String,
        image = json["image"] as String,
        imageType = json["imageType"] as String;
}
