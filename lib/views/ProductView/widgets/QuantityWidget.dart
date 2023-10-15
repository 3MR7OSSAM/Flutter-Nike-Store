import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/CartCubit/AddToCartCubit/Add_to_cart_cubit.dart';
class QuantityWidget extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color color;

  const QuantityWidget({
    Key? key,
    required this.icon,
    required this.onTap,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: color,
        child: Icon(icon,size: 17,color: Colors.red,),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _quantityTextController =
  TextEditingController();

  @override
  void initState() {
    super.initState();
    _quantityTextController.text = '1';
  }

  void _increaseQuantity() {
    _quantityTextController.text =
        (int.parse(_quantityTextController.text) + 1).toString();
  }
  void _onDelete(String id) {
    if(int.parse(_quantityTextController.text) >= 1) {
      BlocProvider.of<CartCubit>(context).deleteItem(id);
    }
  }
  void _decreaseQuantity() {
    if (int.parse(_quantityTextController.text) <= 1) {
      return;
    }
    _quantityTextController.text =
        (int.parse(_quantityTextController.text) - 1).toString();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SizedBox(
        height: screenWidth * 0.3,
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: QuantityWidget(
                icon: CupertinoIcons.add,
                onTap: () {
                  setState(() {
                    _increaseQuantity();
                  });
                },
                color: Colors.blue,
              ),
            ),
            SizedBox(
              width: 30,
              child: Center(
                child: TextField(
                  enabled: false,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  controller: _quantityTextController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[0-9.]')),
                  ],
                  onChanged: (value) {
                    if (value.isEmpty) {
                      _quantityTextController.text = '1';
                    }
                  },
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: QuantityWidget(
                icon: CupertinoIcons.minus,
                onTap: () {
                  setState(() {
                    _decreaseQuantity();
                  });
                },
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
