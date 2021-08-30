import 'package:flutter/material.dart';
import 'package:ship_qarte/screens/widget/feeds_products.dart';

class Feeds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 5),
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [FeedProducts(), FeedProducts()],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [FeedProducts(), FeedProducts()],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [FeedProducts(), FeedProducts()],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [FeedProducts(), FeedProducts()],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [FeedProducts(), FeedProducts()],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [FeedProducts(), FeedProducts()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
