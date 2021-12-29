import 'package:flutter/material.dart';
import 'package:g_sneaker/model/shoes_model.dart';
import 'package:g_sneaker/ui/wigets/your_cart/buttons_widget.dart';
import 'package:g_sneaker/utils/my_colors.dart';
import 'package:g_sneaker/utils/my_images.dart';
import 'package:hexcolor/hexcolor.dart';

class ItemCartWidget extends StatefulWidget {
  final Shoes? shoes;
  final Function()? onMinus;
  final Function()? onPlus;
  final Function()? onTrash;
  final int? quantily;

  const ItemCartWidget(
      {Key? key,
      this.quantily,
      this.shoes,
      this.onTrash,
      this.onPlus,
      this.onMinus})
      : super(key: key);

  @override
  _ItemCartWidgetState createState() => _ItemCartWidgetState();
}

class _ItemCartWidgetState extends State<ItemCartWidget> {
  Shoes? data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = widget.shoes;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(bottom: size.width / 6),
      child: SizedBox(
        width: size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _image(context: context, color: data!.color, image: data!.image!),
            _info(
              context: context,
              title: data!.name,
              price: data!.price,
              quantily: widget.quantily,
              onTrash: widget.onTrash,
              onPlus: widget.onPlus,
              onMinus: widget.onMinus,
            )
          ],
        ),
      ),
    );
  }
}

Widget _info(
    {BuildContext? context,
    String? title,
    double? price,
    int? quantily,
    Function()? onMinus,
    Function()? onPlus,
    Function()? onTrash}) {
  Size size = MediaQuery.of(context!).size;
  return SizedBox(
    height: size.width / 3,
    width: size.width - size.width / 2,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title!,
          style: TextStyle(
              fontFamily: "Rubik",
              color: blackColor,
              fontSize: size.width / 25,
              fontWeight: FontWeight.bold),
        ),
        Text(
          "\$$price",
          style: TextStyle(
              fontFamily: "Rubik",
              color: blackColor,
              fontSize: size.width / 17,
              fontWeight: FontWeight.bold),
        ),
        _bottom(
            context: context,
            quantily: quantily,
            onMinus: onMinus,
            onPlus: onPlus,
            onTrash: onTrash),
      ],
    ),
  );
}

Widget _bottom(
    {BuildContext? context,
    int? quantily,
    Function()? onMinus,
    Function()? onPlus,
    Function()? onTrash}) {
  Size size = MediaQuery.of(context!).size;
  return SizedBox(
    height: size.width / 10,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: size.width / 3.3,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              iconButton(
                  context: context,
                  icon: minusIcon,
                  color: Colors.grey.shade300,
                  onPressed: onMinus),
              Text(
                "$quantily",
                style: TextStyle(
                    color: blackColor,
                    fontSize: size.width / 20,
                    fontWeight: FontWeight.normal),
              ),
              iconButton(
                  context: context,
                  icon: plusIcon,
                  color: Colors.grey.shade300,
                  onPressed: onPlus)
            ],
          ),
        ),
        iconButton(
            context: context,
            icon: trashIcon,
            color: yellowColor,
            onPressed: onTrash)
      ],
    ),
  );
}

Widget _image({BuildContext? context, String? color, String? image}) {
  Size size = MediaQuery.of(context!).size;
  return SizedBox(
    width: size.width / 3,
    height: size.width / 3,
    child: Stack(
      children: [
        Positioned(
          top: 10,
          child: Container(
            width: size.width / 4,
            height: size.width / 4,
            decoration: BoxDecoration(
              color: HexColor("$color"),
              borderRadius: BorderRadius.all(Radius.circular(size.width)),
            ),
          ),
        ),
        Positioned(
          top: -20,
          left: -18,
          child: SizedBox(
            width: size.width / 3,
            height: size.width / 3,
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(-28 / 360),
              child: Image.network(
                image!,
                fit: BoxFit.cover,
                height: size.width / 1,
                width: size.width / 1,
              ),
            ),
          ),
        )
      ],
    ),
  );
}
