import 'package:flutter/material.dart';
import 'package:g_sneaker/model/shoes_model.dart';
import 'package:g_sneaker/ui/wigets/out_products/add_button.dart';
import 'package:g_sneaker/utils/my_colors.dart';
import 'package:hexcolor/hexcolor.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.shoes}) : super(key: key);
  final Shoes shoes;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _image(context: context, color: shoes.color, image: shoes.image!),
        const SizedBox(height: 15),
        _title(title: shoes.name ?? 'N/A'),
        const SizedBox(height: 15),
        if (shoes.description != null) ...[
          _description(shoes.description!),
          const SizedBox(height: 10),
        ],
        _bottom(context, price: shoes.price)
      ],
    );
  }

  Widget _bottom(BuildContext? context, {double? price}) {
    return Row(
      children: [
        Expanded(
          child: price == null
              ? const SizedBox()
              : Text(
                  "\$$price",
                  style: TextStyle(
                    color: blackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
        AddToCartButton(shoes),
      ],
    );
  }

  Widget _title({required String title}) {
    return Text(
      title,
      style: TextStyle(
          color: blackColor, fontSize: 17, fontWeight: FontWeight.bold),
    );
  }

  Widget _description(String descrip) {
    return Text(descrip);
  }

  Widget _image({BuildContext? context, String? color, String? image}) {
    Size size = MediaQuery.of(context!).size;
    return AspectRatio(
      aspectRatio: 1 / 0.95,
      child: Container(
        decoration: BoxDecoration(
          color: HexColor("$color"),
          borderRadius: BorderRadius.circular(20),
        ),
        child: RotationTransition(
          turns: const AlwaysStoppedAnimation(-22 / 360),
          child: Image.network(
            image!,
            alignment: Alignment.topCenter,
            height: size.width / 1,
            width: size.width / 1,
          ),
        ),
      ),
    );
  }
}
