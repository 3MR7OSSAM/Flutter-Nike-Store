import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nikestore/Models/ShoseModel.dart';

import '../../../cubit/PrductViewCubit/ProductViewCubit.dart';

class ShoesImage extends StatelessWidget {
  const ShoesImage({Key? key, required this.Image, }) : super(key: key);
  final String Image;
  @override
  Widget build(BuildContext context) {


     return Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .6,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage(
                      'assets/NIKE.png',

                    ))),
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * .70,
              height: MediaQuery.of(context).size.height * .67,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AssetImage(
                        Image
                      ))),
            ),
          ),

        ],
      );

  }
}
