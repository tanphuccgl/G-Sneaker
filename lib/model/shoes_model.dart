class Shoes {
  int? id;
  String? image;
  String? name;
  String? description;
  double? price;
  String? color;
  int? count;

  Shoes({
    this.id,
    this.image,
    this.name,
    this.description,
    this.price,
    this.color,
    this.count ,
  });

  Shoes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    color = json['color'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['color'] = color;
    data['count'] = count;
    return data;
  }

  Shoes copyWith({
    int? id,
    String? image,
    String? name,
    String? description,
    double? price,
    String? color,
    int? count,
  }) {
    return Shoes(
      id: id ?? this.id,
      image: image ?? this.image,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      color: color ?? this.color,
      count: count ?? this.count,
    );
  }
}
