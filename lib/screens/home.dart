import 'package:flutter/material.dart';
import 'package:backdrop/app_bar.dart';
import 'package:backdrop/button.dart';
import 'package:backdrop/scaffold.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
import 'package:ship_qarte/components/colors.dart';
import 'package:ship_qarte/components/size_config.dart';
import 'package:ship_qarte/screens/ui.dart';
import 'package:ship_qarte/screens/widget/feeds_products.dart';

import 'widget/backlayer.dart';
import 'widget/category.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List _carouselImages = [
    'assets/images/carousel1.png',
    'assets/images/carousel2.jpg',
    'assets/images/carousel3.jpg',
    'assets/images/carousel4.png',
  ];

  final List _brandImages = [
    'assets/images/addidas.jpg',
    'assets/images/apple.jpg',
    'assets/images/dell.jpg',
    'assets/images/h&m.jpg',
    'assets/images/nike.jpg',
    'assets/images/samsung.jpg',
    'assets/images/huawei.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    // final productsData = Provider.of<Products>(context);
    // productsData.fetchProducts();

    // final popularItems = productsData.popularProducts;
    //print('popularItems length ${popularItems.length}');
    return Scaffold(
      body: BackdropScaffold(
        backLayerBackgroundColor: COLORS.blueDark,
        frontLayerBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
        headerHeight: MediaQuery.of(context).size.height * 0.15,
        appBar: BackdropAppBar(
          title: Text("Home"),
          backgroundColor: COLORS.blueDark,
          leading: BackdropToggleButton(icon: AnimatedIcons.home_menu),
          // flexibleSpace: Container(
          //     ignore: prefer_const_constructors
          //     decoration: BoxDecoration(
          //         gradient: const LinearGradient(
          //             colors: [Colors.blue, Colors.blueAccent])),
          //     ),
          actions: <Widget>[
            IconButton(
              //iconSize: 15,
              padding: const EdgeInsets.all(10),
              icon: const CircleAvatar(
                radius: 15,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 13,
                  backgroundImage: AssetImage('assets/images/person.png'),
                  // backgroundImage: NetworkImage('https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg'),
                ),
              ),
              onPressed: () {},
            )
          ],
        ),
        backLayer: Column(
          children: <Widget>[
            Divider(
                color: COLORS.whiteDark, height: 25, indent: 15, endIndent: 15),
            ListTile(
              onTap: () {
                //Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              title: Text(
                'Categories',
                style: TextStyle(color: COLORS.whiteDark),
              ),
              // trailing: Icon(
              //   Icons.chevron_right_rounded,
              //   color: COLORS.greyWhite,
              // ),
              leading: const Icon(
                Icons.category_outlined,
                color: COLORS.whiteDark,
                size: 22,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              title: Text(
                'Cart',
                style: TextStyle(color: COLORS.whiteDark),
              ),
              // trailing: Icon(
              //   Icons.chevron_right_rounded,
              //   color: COLORS.greyWhite,
              // ),
              leading: const Icon(
                Icons.shopping_cart_outlined,
                color: COLORS.whiteDark,
                size: 22,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(WishlistScreen.routeName);
              },
              title: Text(
                'Wishlist',
                style: TextStyle(color: COLORS.whiteDark),
              ),
              // trailing: Icon(
              //   Icons.chevron_right_rounded,
              //   color: COLORS.greyWhite,
              // ),
              leading: const Icon(
                Icons.favorite_border,
                color: COLORS.whiteDark,
                size: 22,
              ),
            ),
            ListTile(
              onTap: () {
                //Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              title: Text(
                'My Rewards',
                style: TextStyle(color: COLORS.whiteDark),
              ),
              // trailing: Icon(
              //   Icons.chevron_right_rounded,
              //   color: COLORS.greyWhite,
              // ),
              leading: const Icon(
                Icons.airplane_ticket_outlined,
                color: COLORS.whiteDark,
                size: 22,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserInfo(),
                  ),
                );
              },
              title: Text(
                'Profile',
                style: TextStyle(color: COLORS.whiteDark),
              ),
              // trailing: Icon(
              //   Icons.chevron_right_rounded,
              //   color: COLORS.greyWhite,
              // ),
              leading: const Icon(
                Icons.person_outline,
                color: COLORS.whiteDark,
                size: 22,
              ),
            ),
            ListTile(
              onTap: () {
                //Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              title: Text(
                'My Orders',
                style: TextStyle(color: COLORS.whiteDark),
              ),
              // trailing: Icon(
              //   Icons.chevron_right_rounded,
              //   color: COLORS.greyWhite,
              // ),
              leading: const Icon(
                Icons.shopping_bag_outlined,
                color: COLORS.whiteDark,
                size: 22,
              ),
            ),
            ListTile(
              onTap: () {
                //Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              title: Text(
                'Settings',
                style: TextStyle(color: COLORS.whiteDark),
              ),
              // trailing: Icon(
              //   Icons.chevron_right_rounded,
              //   color: COLORS.greyWhite,
              // ),
              leading: const Icon(
                Icons.settings,
                color: COLORS.whiteDark,
                size: 22,
              ),
            ),
          ],
        ),
        frontLayer: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 190.0,
                width: double.infinity,
                child: Carousel(
                  boxFit: BoxFit.fill,
                  autoplay: true,
                  animationCurve: Curves.fastOutSlowIn,
                  animationDuration: Duration(milliseconds: 1000),
                  dotSize: 5.0,
                  dotIncreasedColor: Colors.purple,
                  dotBgColor: Colors.black.withOpacity(0.2),
                  dotPosition: DotPosition.bottomCenter,
                  showIndicator: true,
                  indicatorBgPadding: 8.0,
                  images: [
                    ExactAssetImage(_carouselImages[0]),
                    ExactAssetImage(_carouselImages[1]),
                    ExactAssetImage(_carouselImages[2]),
                    ExactAssetImage(_carouselImages[3]),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.blockHeight * 2,
                    horizontal: SizeConfig.blockHeight * 1),
                child: Text(
                  'Categories',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: SizeConfig.blockWidth * 6),
                ),
              ),
              Container(
                width: double.infinity,
                height: SizeConfig.blockHeight * 28,
                child: ListView.builder(
                  itemCount: 7,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext ctx, int index) {
                    return CategoryWidget(
                      index: index,
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.blockHeight * 2,
                    horizontal: SizeConfig.blockHeight * 1),
                child: Row(
                  children: [
                    Text(
                      'Popular Brands',
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: SizeConfig.blockWidth * 6),
                    ),
                    Spacer(),
                    FlatButton(
                      onPressed: () {
                        // Navigator.of(context).pushNamed(
                        //   BrandNavigationRailScreen.routeName,
                        //   arguments: {
                        //     7,
                        //   },
                        // );
                      },
                      child: Text(
                        'View all',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: SizeConfig.blockWidth * 4.5,
                            color: Colors.red),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: SizeConfig.blockHeight * 20,
                width: MediaQuery.of(context).size.width * 1,
                child: Swiper(
                  itemCount: _brandImages.length,
                  autoplay: true,
                  viewportFraction: 0.4,
                  scale: 0.05,
                  onTap: (index) {
                    // Navigator.of(context).pushNamed(
                    //   BrandNavigationRailScreen.routeName,
                    //   arguments: {
                    //     index,
                    //   },
                    // );
                  },
                  itemBuilder: (BuildContext ctx, int index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: Colors.white,
                        child: Image.asset(
                          _brandImages[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.blockHeight * 2,
                    horizontal: SizeConfig.blockHeight * 1),
                child: Row(
                  children: [
                    Text(
                      'Popular Products',
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: SizeConfig.blockWidth * 6),
                    ),
                    Spacer(),
                    FlatButton(
                      onPressed: () {
                        // Navigator.of(context)
                        //     .pushNamed(Feeds.routeName, arguments: 'popular');
                      },
                      child: Text(
                        'View all',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: SizeConfig.blockWidth * 4.5,
                            color: Colors.red),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 230,
                margin: EdgeInsets.symmetric(horizontal: 3),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      //padding: EdgeInsets.only(left: 5),
                      margin:
                          EdgeInsets.only(left: 8, bottom: 5, right: 0, top: 2),
                      child: FeedProducts(),
                    ),
                    Container(
                      //padding: EdgeInsets.only(left: 5),
                      margin:
                          EdgeInsets.only(left: 8, bottom: 5, right: 0, top: 2),
                      child: FeedProducts(),
                    ),
                    Container(
                      //padding: EdgeInsets.only(left: 5),
                      margin:
                          EdgeInsets.only(left: 8, bottom: 5, right: 0, top: 2),
                      child: FeedProducts(),
                    ),
                    Container(
                      //padding: EdgeInsets.only(left: 5),
                      margin:
                          EdgeInsets.only(left: 8, bottom: 5, right: 0, top: 2),
                      child: FeedProducts(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
