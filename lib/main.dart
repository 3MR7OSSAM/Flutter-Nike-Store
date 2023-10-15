import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nikestore/cubit/CartCubit/AddToCartCubit/Add_to_cart_cubit.dart';
import 'package:nikestore/views/HomeView/widgets/HomeTab.dart';
void main()async {
    runApp( const NikeStore());
  }

class NikeStore extends StatelessWidget {
  const NikeStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>CartCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          scrollbarTheme: const ScrollbarThemeData(
          ), // Set the scrollbar color here
        ),
        debugShowCheckedModeBanner: false,
      home:  const SafeArea(child: HomeTab()),
      ),
    );
  }
}
