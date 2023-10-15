import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nikestore/cubit/CartCubit/AddToCartCubit/Add_to_cart_cubit.dart';
import 'package:nikestore/views/CartView/widgets/cart_widget.dart';

import '../../Models/CartModel.dart';
import '../../cubit/CartCubit/AddToCartCubit/Add_to_cart_state.dart';
import '../ProductView/widgets/CustomAppbar.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    var cartItems =  BlocProvider.of<CartCubit>(context).getCartItems.values.toList();
    double totalPrice = 0.0;

        double screenHeight = MediaQuery.of(context).size.height;
        double screenWidth = MediaQuery.of(context).size.width;
        return  BlocBuilder<CartCubit,CartState>(

        builder: (context,state){
          BlocProvider.of<CartCubit>(context).getCartItems.values.toList().forEach((element) {
            totalPrice += element.price * element.quantity;
          });
            return SafeArea(
            child: Scaffold(
                body: BlocProvider.of<CartCubit>(context).getCartItems.values.toList().isNotEmpty
                    ? Stack(
                        children: [
                          Column(
                            children: [
                              CustomAppbar(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                IsCenter: true,
                                icon: const Icon(
                                  Icons.arrow_back,
                                  size: 24,
                                ),
                                showIcon: false,
                                child: const Text(''),
                              ),
                              Stack(
                                children: [
                                  SizedBox(
                                    height: screenHeight * 0.78,
                                    child:  ListView.builder(
                                              itemCount: BlocProvider.of<CartCubit>(context).getCartItems.length,
                                              itemBuilder: (context, index) {
                                                String id = BlocProvider.of<CartCubit>(context).getCartItems.keys.toList()[index];
                                                return CartWidget(
                                                  id: cartItems[index].id, quantity: cartItems[index].quantity.toString(),
                                                );
                                              })

                                  ),
                                ],
                              ),
                            ],
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              width: screenWidth,
                              height: screenHeight * 0.15,
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(.2),
                                        borderRadius: BorderRadius.circular(50)),
                                    padding: const EdgeInsets.all(15),
                                    width: screenWidth * 0.88,
                                    height: 2,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: screenWidth * 0.10,
                                        vertical: screenWidth * 0.04),
                                    child: Row(
                                      children: [
                                        const Text(
                                          'Total',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        const Spacer(),
                                        Text('\$${totalPrice.toString()}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                decoration:
                                                    TextDecoration.underline))
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: Colors.redAccent,
                                    ),
                                    height: 50,
                                    width: screenWidth * 0.9,
                                    child: const Center(
                                        child: Text(
                                      'Order Now',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    )),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          CustomAppbar(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            IsCenter: true,
                            icon: const Icon(
                              Icons.arrow_back,
                              size: 24,
                            ),
                            showIcon: false,
                            child: const Text(''),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Container(
                                  child: Image.asset('assets/cartImage.jpeg'),
                                ),
                              ),
                              const Text('Go shopping to add items !',
                                  style: TextStyle(
                                      color: Colors.redAccent,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        ],
                      )),
        );}
        );
  }
}
