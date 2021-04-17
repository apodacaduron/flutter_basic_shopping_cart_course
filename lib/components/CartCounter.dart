import 'package:flutter/material.dart';

class CartCounter extends StatelessWidget {
  final int count;
  CartCounter({this.count});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(Icons.shopping_cart_outlined),
        Visibility(
          visible: count > 0,
          child: Positioned(
            top: 0,
            right: 0,
            child: CircleAvatar(
              radius: 8,
              backgroundColor: Colors.red,
              child: Text(
                count.toString(),
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
