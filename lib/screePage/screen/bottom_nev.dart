import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class bottomNev extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Icon(
                  Icons.home_filled,
                  size: 25,
                ),
                Text(
                  'Home',
                ),
              ],
            ),
            Column(
              children: [
                Icon(
                  Icons.shopping_bag,
                  size: 25,
                  color: Colors.blueGrey,
                ),
                Text(
                  'Shop',
                  style: TextStyle(color: Colors.blueGrey),
                ),
              ],
            ),
            Column(
              children: [
                Icon(
                  Icons.favorite_border,
                  size: 25,
                  color: Colors.blueGrey,
                ),
                Text(
                  'Wishlist',
                  style: TextStyle(color: Colors.blueGrey),
                ),
              ],
            ),
            Column(
              children: [
                Icon(
                  Icons.account_circle_outlined,
                  size: 25,
                  color: Colors.blueGrey,
                ),
                Text(
                  'Account',
                  style: TextStyle(color: Colors.blueGrey),
                ),
              ],
            ),
          ],
        ),
      ),
      height: 64,
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                7,
              ),
              topRight: Radius.circular(7))),
    );
  }
}
