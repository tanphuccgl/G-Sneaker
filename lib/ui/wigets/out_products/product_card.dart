import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:g_sneaker/model/shoes_model.dart';
import 'package:g_sneaker/ui/wigets/out_products/add_button.dart';
import 'package:g_sneaker/utils/my_colors.dart';
import 'package:hexcolor/hexcolor.dart';

class ProductCard extends StatelessWidget {
  final Shoes? shoes;
  final Function()? onPressed;
  final bool? isAddProduct;

  const ProductCard({Key? key, this.shoes, this.onPressed, this.isAddProduct})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(bottom: size.width / 6),
      child: SizedBox(
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _image(context: context, color: shoes!.color, image: shoes!.image!),
            SizedBox(height: size.width / 15),
            _title(context: context, title: shoes!.name),
            SizedBox(height: size.width / 15),
            _description(context: context, descrip: shoes!.description),
            SizedBox(height: size.width / 20),
            _bottom(context: context,
                price: shoes!.price, onPressed: onPressed,isAddProduct: isAddProduct)
          ],
        ),
      ),
    );
  }
}

Widget _bottom(
    {BuildContext? context,
    double? price,
    Function()? onPressed,
    bool? isAddProduct}) {
  Size size = MediaQuery.of(context!).size;
  return SizedBox(
    height: size.width / 5,
    width: size.width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            "\$$price",
            style: TextStyle(
                fontFamily: "Rubik",
                color: blackColor,
                fontSize: size.width / 17,
                fontWeight: FontWeight.bold),
          ),
        ),
        isAddProduct == false
            ? addButton(context: context, onPressed: onPressed)
            : checkMarkIcon(
                context: context,
              )
      ],
    ),
  );
}

Widget _title({BuildContext? context, String? title}) {
  Size size = MediaQuery.of(context!).size;
  return Text(
    title!,
    style: TextStyle(
        fontFamily: "Rubik",
        color: blackColor,
        fontSize: size.width / 17,
        fontWeight: FontWeight.bold),
  );
}

Widget _description({BuildContext? context, String? descrip}) {
  Size size = MediaQuery.of(context!).size;
  return AutoSizeText(
    descrip!,
    group: AutoSizeGroup(),
    style: TextStyle(
        color: greyColor,
        fontSize: size.width / 25,
        height: 1.8,
        fontWeight: FontWeight.normal),
  );
}

Widget _image({BuildContext? context, String? color, String? image}) {
  Size size = MediaQuery.of(context!).size;
  return Container(
    width: size.width,
    height: size.width / 0.95,
    decoration: BoxDecoration(
      color: HexColor("$color"),
      borderRadius: BorderRadius.all(Radius.circular(size.width / 10)),
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
  );
}
