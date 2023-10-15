import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nikestore/cubit/CartCubit/AddToCartCubit/Add_to_cart_cubit.dart';
import 'package:nikestore/views/ProductView/widgets/CustomAppbar.dart';
import 'package:nikestore/views/ProductView/widgets/ProdctMainWidget.dart';
import 'package:nikestore/views/ProductView/widgets/ScrollNavigator.dart';
class ProductView extends StatelessWidget {
   const ProductView({Key? key, required this.id,}) : super(key: key);
  final String id;
  @override
  Widget build(BuildContext context) {
    final currentProduct = BlocProvider.of<CartCubit>(context).findByID(id);
    return SafeArea(
      child: Scaffold(
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    CustomAppbar(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      IsCenter: true,
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 24,
                      ),
                      showIcon: true,
                      child: Text(
                        textAlign: TextAlign.center,
                        currentProduct.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .09,
                    ),
                     ProductViewWidget(id: currentProduct.id,),
                  ],
                ),
              ),

            ],
          ),
        )
    );
  }
}
