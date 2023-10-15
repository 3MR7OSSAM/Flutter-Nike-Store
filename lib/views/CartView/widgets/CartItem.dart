import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubit/CartCubit/AddToCartCubit/Add_to_cart_cubit.dart';
class CartItem extends StatefulWidget {
  const CartItem({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    List products = BlocProvider.of<CartCubit>(context).getCartItems.values.toList();
    if (products.isEmpty) {
      return const Column(
        children: [
          SizedBox(
            width: 150,
              height: 150,
              child: Image(
                  image: AssetImage(
            'assets/NikeBox.png',
          ))),
          Text(
            'Your cart is empty',
            style: TextStyle(
              color: Colors.redAccent,
              fontSize: 18,
              fontFamily: 'FuturaBold',
            ),
          ),
        ],
      );
    }
    return ListTile(
      leading: Image.asset(products[widget.index].image),
      title: Text(products[widget.index].name),
     // subtitle: Text('${products[widget.index].totalPrice}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                // products[widget.index].quantity--;
                // if (products[widget.index].quantity == 0) {
                //   products[widget.index].delete();
                // } else {
                //   products[widget.index].totalPrice =
                //       products[widget.index].quantity *
                //           products[widget.index].price;
                // }
              });
            },
            icon: const Icon(Icons.remove),
          ),
          Text(products[widget.index].quantity.toInt().toString()),
          IconButton(
            onPressed: () {
              setState(() {
                products[widget.index].quantity++;
               // products[widget.index].totalPrice =
                    products[widget.index].quantity *
                        products[widget.index].price;
              });
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
