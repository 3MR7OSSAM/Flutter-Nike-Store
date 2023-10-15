import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/CartCubit/AddToCartCubit/Add_to_cart_cubit.dart';
import '../../CartView/CartView.dart';

class CustomAppbar extends StatelessWidget {
  final Widget child;

  final bool IsCenter;
  final Widget icon;
  final bool showIcon;
  Function()? onTap;

  CustomAppbar({
    Key? key,
    required this.child,
    required this.IsCenter,
    required this.icon,
    this.onTap,
    required this.showIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List Products =
        BlocProvider.of<CartCubit>(context).getCartItems.values.toList();

    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black12)),
              width: 36,
              height: 34,
              child: icon),
        ),
        IsCenter == true ? const Spacer() : Container(),
        child,
        const Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CartView()));
          },
          child: showIcon
              ? Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.black12)),
                      width: 36,
                      height: 34,
                      child: const Icon(
                        Icons.shopping_bag_outlined,
                        size: 24,
                      ),
                    ),
                    Products.isNotEmpty
                        ? Positioned(
                        right: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                                width: 7,
                                height: 7,
                                decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                          ),
                        )
                        : Container()
                  ],
                )
              : Container(),
        ),
      ],
    );
  }
}
