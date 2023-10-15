import 'package:flutter/material.dart';
import 'package:nikestore/Models/ShoseModel.dart';
import 'package:nikestore/views/ProductView/ProductView.dart';


class CustomCard extends StatelessWidget {
   const CustomCard({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductView(id: Shoeses[index].id)));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 7,
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(14)
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  Shoeses[index].image,
                  height: screenWidth*0.26,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            // Text
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Shoeses[index].name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const Row(
                    children: [
                      Icon(Icons.star_outlined,color: Colors.yellow,),
                      Text('4.9'),
                      Text('  (100 Reviews)',style: TextStyle(fontSize: 10),)
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '\$${Shoeses[index].price}' ,
                    style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}
