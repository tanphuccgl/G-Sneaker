class ShoesModel {
  List<Shoes>? shoes;

  ShoesModel({this.shoes});

  ShoesModel.fromJson(Map<String, dynamic> json) {
    if (json['shoes'] != null) {
      shoes = <Shoes>[];
      json['shoes'].forEach((v) {
        shoes?.add(Shoes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (shoes != null) {
      data['shoes'] = shoes?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Shoes {
  int? id;
  String? image;
  String? name;
  String? description;
  double? price;
  String? color;

  Shoes(
      {this.id,
        this.image,
        this.name,
        this.description,
        this.price,
        this.color});

  Shoes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    color = json['color'];
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
