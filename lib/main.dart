import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_sneaker/cubit/cart/cart_cubit.dart';
import 'package:g_sneaker/model/prefs.dart';
import 'package:g_sneaker/ui/pages/our_products_page.dart';
import 'package:g_sneaker/ui/pages/your_cart_page.dart';
import 'package:g_sneaker/utils/my_colors.dart';
import 'package:g_sneaker/utils/page_routers.dart';
import 'package:g_sneaker/cubit/product/product_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ProductCubit()),
        BlocProvider(create: (_) => CartCubit())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Rubik",
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
            button: TextStyle(
              color: MyColors.blackColor,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          buttonTheme: const ButtonThemeData(height: 50),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                primary: MyColors.yellowColor,
                onPrimary: Colors.black,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                )),
          ),
        ),
        routes: {
          PageRoutes.ourProductsPage: (context) => const OurProductsPage(),
          PageRoutes.yourCartPage: (context) => const YourCartPage(),
        },
        home: const OurProductsPage(),
      ),
    );
  }
}
