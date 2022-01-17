class Shoes {
  int? id;
  String? image;
  String? name;
  String? description;
  double? price;
  String? color;
  int? count;
  bool? isContent;

  Shoes({
    this.id,
    this.image,
    this.name,
    this.description,
    this.price,
    this.color,
    this.isContent,
    this.count = 0,
  });

  Shoes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    color = json['color'];
    count = 0;
    isContent = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['color'] = color;
    return data;
  }
}
