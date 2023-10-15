import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/CartCubit/AddToCartCubit/Add_to_cart_cubit.dart';
import '../../ProductView/widgets/QuantityWidget.dart';
class CartWidget extends StatefulWidget {
   CartWidget({Key? key, required this.quantity, required this.id}) : super(key: key);
   String quantity;
   String id;
  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  final TextEditingController _quantityTextController = TextEditingController();

  @override
  void initState() {
    _quantityTextController.text = widget.quantity;
    super.initState();
  }
@override
  void dispose() {
  _quantityTextController.dispose();
    super.dispose();
  }
  void _increaseQuantity() {
    _quantityTextController.text =
        (int.parse(_quantityTextController.text) + 1).toString();
    BlocProvider.of<CartCubit>(context).increaseCartItems(widget.id);
  }

  void _decreaseQuantity(String id) {
    if (int.parse(_quantityTextController.text) <= 1) {
      BlocProvider.of<CartCubit>(context).deleteItem(id);
    }
    _quantityTextController.text =
        (int.parse(_quantityTextController.text) - 1).toString();
    BlocProvider.of<CartCubit>(context).decreaseCartItems(widget.id);

  }
  @override
  Widget build(BuildContext context) {
    final currentProduct = BlocProvider.of<CartCubit>(context).getCartItems.values.firstWhere((element) => element.id == widget.id);
    List cartItems =BlocProvider.of<CartCubit>(context).getCartItems.values.toList();
    double screenWidth = MediaQuery.of(context).size.width;
    return cartItems.isNotEmpty ?Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.transparent,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: screenWidth * 0.22,
                  width: screenWidth * 0.22,
                  child: Image.asset(currentProduct.image)
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: screenWidth*0.4,
                    child: Text(
                      currentProduct.name,
                      style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 19,
                          fontWeight: FontWeight.bold),
                          maxLines: 3,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        const Text('Color : ',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w500),),
                        Container(width: 15,height: 15,decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color:currentProduct.color,
                        ),),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text('Size : ${currentProduct.size}',style: const TextStyle(color: Colors.black54,fontWeight: FontWeight.w500),
                        ))
                      ],
                    ),
                  ),
                  Center(
                    child: Text('\$${currentProduct.price.toString()}',style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),),
                  )
                ],
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.3)
                ),
                height: screenWidth*0.22,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: QuantityWidget(
                        icon: CupertinoIcons.add,
                        onTap: () {
                          setState(() {
                            print(currentProduct.color);
                            _increaseQuantity();
                          });
                        },
                        color: Colors.transparent,
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.all(screenWidth*0.03),
                      child: Center(child: Text(_quantityTextController.text),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: QuantityWidget(
                        icon: CupertinoIcons.minus,
                        onTap: () {
                          setState(() {
                            _decreaseQuantity(widget.id);
                          });
                        },
                        color: Colors.transparent,
                      ),
                    ),
                  ],
                ),
              ),            ],
          ),
        ),
      ),
    ):Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Container(
            child: Image.asset('assets/cartImage.jpeg'),
          ),
        ),
        const Text('Go shopping to add items !', style: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.bold))
      ],
    );
  }
}
