import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({Key? key, required this.price}) : super(key: key);
  final double price;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * .5,
          left: MediaQuery.of(context).size.height * .01),
      child: Row(

        children: [
          Column(
            children:  [
              Text(
                "${price}\$",
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              const Text(
                '10% OFF',
                style: TextStyle(fontSize: 12, color: Colors.red),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
