
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nikestore/cubit/CartCubit/AddToCartCubit/Add_to_cart_cubit.dart';
class SwipeDownButton extends StatefulWidget {
  const SwipeDownButton({
    super.key,
 required this.onDrugDown,
  });

  final Function onDrugDown;

  @override
  SwipeDownButtonState createState() => SwipeDownButtonState();
}

class SwipeDownButtonState extends State<SwipeDownButton> {
  double _dragDistance = 0.0;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onVerticalDragUpdate: (details) {
        setState(() {
          _dragDistance += details.delta.dy.abs();
          if (_dragDistance > 20.0) {
            _dragDistance = 20.0;
          }
        });
      },
      onVerticalDragEnd: (details) {

        if (_dragDistance > 10.0) {
          widget.onDrugDown();
          setState(() {
            _dragDistance = 0.0;
          });
        } else {
          setState(() {
            _dragDistance = 0.0;
          });
        }
      },
      child: Transform.translate(
        offset: Offset(0, _dragDistance),
        child: Image(
          image: const AssetImage(
            'assets/ScrollBtn.png',
          ),
          width: MediaQuery.of(context).size.width * 0.1,
          height: MediaQuery.of(context).size.height * 0.09,
        ),
      ),
    );
  }
}
